#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MPNowPlayingInfoCenter : NSObject
@property (nonatomic, strong) NSDictionary *nowPlayingInfo;
@property (nonatomic) NSInteger playbackState;
+ (instancetype)defaultCenter;
@end
@implementation MPNowPlayingInfoCenter
+ (instancetype)defaultCenter { static id center; if (!center) center = [self new]; return center; }
@end

#define YTMU_NP_TEST 1
#include "../../Source/NowPlaying/YTMUNowPlayingFix.m"

static NSUInteger calls;
static NSString *lastTarget;
static void *origin(void) { return (void *)0x1234; }
static void *noOrigin(void) { return NULL; }
static void bindTarget(void *value, CFStringRef target) {
    NSCAssert(value == (void *)0x1234, @"origin ABI");
    lastTarget = [(__bridge NSString *)target copy]; calls++;
}
static void throwOnBind(void *value, CFStringRef target) {
    [NSException raise:@"FixtureSPIException" format:@"simulated private API failure"];
}
static NSUInteger checks;
#define CHECK(condition, label) do { if (!(condition)) { NSLog(@"FAIL: %s", label); return 1; } checks++; } while (0)

int main(void) { @autoreleasepool {
    // Fake an altered runtime NSBundle value: target must come from disk fixture.
    NPInfo = @{@"CFBundleIdentifier": @"org.example.personal.ytmusic", @"CFBundleShortVersionString": @"9.44.2"};
    NSString *legacyPreference = @"YTMU.NowPlayingLaunchFix.enabled";
    // A previously disabled UI setting must not disable the automatic repair.
    [NSUserDefaults.standardUserDefaults setBool:NO forKey:legacyPreference];
    NPInstall(); NPGetOrigin = origin; NPSetParent = bindTarget;
    MPNowPlayingInfoCenter *center = [MPNowPlayingInfoCenter defaultCenter];
    CHECK(center != nil && calls == 0, "creating a center does not claim another app's playback");
    NPBind();
    CHECK(calls == 0, "foreground notification before metadata does not claim playback");
    NSDictionary *info = @{@"title": @"fixture", @"rate": @1, @"elapsed": @12.5};
    center.nowPlayingInfo = info;
    CHECK(center.nowPlayingInfo == info, "preserves exact metadata object");
    CHECK(calls == 1, "metadata automatically binds despite the old disabled preference");
    CHECK([lastTarget isEqual:NPBundleID()], "uses installed ID, not a hardcoded other app");
    center.nowPlayingInfo = nil;
    CHECK(center.nowPlayingInfo == nil && calls == 1, "stop/clear does not rebind");
    center.playbackState = 1; NPBind();
    CHECK(calls == 1, "cleared metadata cannot rebind from resume or foreground");
    center.nowPlayingInfo = info;
    CHECK(calls == 2, "new playback automatically reapplies without settings");
    NPSetParent = NULL;
    center.nowPlayingInfo = info;
    CHECK(center.nowPlayingInfo == info && calls == 2, "missing SPI does not break publishing");
    NPSetParent = bindTarget; NPGetOrigin = noOrigin;
    NPBind();
    CHECK(calls == 2, "missing origin skips binding");
    NPGetOrigin = origin;
    NSUInteger before = calls;
    NPInstall(); center.nowPlayingInfo = info;
    CHECK(calls == before + 1, "install is idempotent without recursive wrappers");
    NSUInteger resumeCalls = calls;
    center.playbackState = 1;
    CHECK(center.playbackState == 1 && calls == resumeCalls + 1, "resume rebinds without changing metadata");
    center.playbackState = 2;
    CHECK(center.playbackState == 2 && calls == resumeCalls + 1, "pause preserves state without rebinding");
    NPSetParent = throwOnBind;
    center.nowPlayingInfo = info;
    CHECK(center.nowPlayingInfo == info && NPSPIFailed, "SPI exception is isolated from metadata publishing");
    NPSetParent = bindTarget;
    NSUInteger failedCalls = calls;
    center.nowPlayingInfo = info;
    CHECK(center.nowPlayingInfo == info && calls == failedCalls, "SPI failure stops further requests for this run");
    [NSUserDefaults.standardUserDefaults removeObjectForKey:legacyPreference];
    printf("PASS: %lu launch-association checks (mock MediaRemote; not an iPhone test)\n", (unsigned long)checks);
    return 0;
} }
