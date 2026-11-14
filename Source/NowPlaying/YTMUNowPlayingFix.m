// Automatic launch association repair for sideloaded YouTube Music.
// No settings UI, networking, entitlement rewriting, or launch loops.
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdatomic.h>
#ifndef YTMU_NP_TEST
#import <UIKit/UIKit.h>
#endif

static NSDictionary *NPInfo;
static void *(*NPGetOrigin)(void);
static void (*NPSetParent)(void *, CFStringRef);
static BOOL NPInstalled;
static atomic_bool NPHasInfo, NPSPIFailed;

static NSString *NPBundleID(void) { return NPInfo[@"CFBundleIdentifier"]; }

static void NPBind(void) {
    if (!atomic_load(&NPHasInfo) || !NPBundleID().length || !NPGetOrigin || !NPSetParent || atomic_load(&NPSPIFailed)) return;
    // WebKit declares this two-argument ABI. A void return only means that
    // the request was sent; it does not confirm acceptance by iOS.
    @try {
        void *origin = NPGetOrigin();
        if (origin) NPSetParent(origin, (__bridge CFStringRef)NPBundleID());
    } @catch (NSException *exception) {
        atomic_store(&NPSPIFailed, true);
    }
}

static void (*NPOriginalSetInfo)(id, SEL, NSDictionary *);
static void (*NPOriginalSetPlaybackState)(id, SEL, NSInteger);

static void NPSetPlaybackState(id self, SEL cmd, NSInteger state) {
    NPOriginalSetPlaybackState(self, cmd, state);
    // MPNowPlayingPlaybackStatePlaying == 1. Reapply on resume even if metadata
    // did not change, but never claim the origin before this app publishes it.
    if (state == 1) NPBind();
}

static void NPSetInfo(id self, SEL cmd, NSDictionary *info) {
    NPOriginalSetInfo(self, cmd, info);
    atomic_store(&NPHasInfo, info.count > 0);
    if (info.count) NPBind();
}

static void NPHook(Class cls, SEL selector, IMP replacement, IMP *original) {
    Method method = class_getInstanceMethod(cls, selector);
    if (!method) return;
    *original = method_getImplementation(method);
    class_replaceMethod(cls, selector, replacement, method_getTypeEncoding(method));
}

static void NPInstall(void) {
    if (NPInstalled) return;
    NPInstalled = YES;
    Class center = NSClassFromString(@"MPNowPlayingInfoCenter");
    NPHook(center, NSSelectorFromString(@"setNowPlayingInfo:"),
        (IMP)NPSetInfo, (IMP *)&NPOriginalSetInfo);
    NPHook(center, NSSelectorFromString(@"setPlaybackState:"),
        (IMP)NPSetPlaybackState, (IMP *)&NPOriginalSetPlaybackState);
#ifndef YTMU_NP_TEST
    // The handle lives for the process lifetime. Failure leaves publishing intact.
    void *framework = dlopen("/System/Library/PrivateFrameworks/MediaRemote.framework/MediaRemote", RTLD_LAZY | RTLD_LOCAL);
    if (framework) {
        NPGetOrigin = dlsym(framework, "MRMediaRemoteGetLocalOrigin");
        NPSetParent = dlsym(framework, "MRMediaRemoteSetParentApplication");
    }
    [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidBecomeActiveNotification
        object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification *note) { NPBind(); }];
#endif
}

#ifndef YTMU_NP_TEST
__attribute__((constructor)) static void NPStart(void) {
    @autoreleasepool {
        // Bypass the existing Google login hooks and use the installed plist.
        NSString *file = [NSBundle.mainBundle.bundlePath stringByAppendingPathComponent:@"Info.plist"];
        NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:file];
        if (![info[@"CFBundleExecutable"] isEqualToString:@"YouTubeMusic"]) return;
        NPInfo = [info copy];
        dispatch_async(dispatch_get_main_queue(), ^{ NPInstall(); });
    }
}
#endif
