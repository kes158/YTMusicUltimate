[YTMU+Latest]: https://github.com/Mark02-2012/MaxMusic/releases/download/MaxMusic_9.37.2_2.4.1_(93)/MaxMusic_2.4.1_9.37.2.ipa

[YTMUlatest]: https://github.com/Mark02-2012/MaxMusic/releases/download/YTMU_9.37.2_2.4.1_(95)/YTMusicUltimate_2.4.1_9.37.2.ipa

[YTMU+no-YMP]: https://github.com/Mark02-2012/MaxMusic/releases/download/MaxMusic_9.37.2_2.4.1_(94)/MaxMusic_no_YMP_2.4.1_9.37.2.ipa

<h1 p align="center">MaxMusic (ex YTMUltimate+)</h1>
   
<p align="center">
<td><img src="Resources/IMG_5914.png" width=500


<p align="center">
<img src=https://user-images.githubusercontent.com/38832025/235781207-6d1ad44e-0c32-4aec-9c75-cb928ca8a0d3.png?raw=true) />
</p>

<p align="center">
The best fork of <a href="https://github.com/dayanch96/YTMusicUltimate">YTMusicUltimate</a> that adds more tweaks and more customizzation for downloaded songs for the YouTube Music app on iOS.

<h2 p align="center">Disclaimer</h2>
<p align="center">
   This project is an independent developer modification and is not affiliated with, authorized, maintained, sponsored, or endorsed by Google LLC or YouTube Music. All product and company names are trademarks of their respective holders.

<h2 p align="center">More info</h2>
<p align="center">
   <strong>The updates will be released</strong> every new YTMusic/YTMusicUltimate version (estimated time for updates: 3-24 hours; VARIABLE), <strong>on my Telegram Channel 👉<a href="https://t.me/Mark02workshop_official">LINK TO JOIN</a>👈</strong>

<p align="center">
   <a href="#so-what-is-maxmusic">More info about MaxMusic</a>

## Bug reporting
**In the repo may be some issues, so please report any issue in the [Issues](https://github.com/Mark02-2012/MaxMusic/issues) section.**


## Download Links

* **Jailbreak (Only YTMusicUltimate) DEPRECATED, WILL FIX:**
Add __[https://ginsu.dev/repo](https://ginsu.dev/repo)__ to your favorite installer and download latest version from __[Releases](https://github.com/ginsudev/YTMusicUltimate/releases)__ page.

(arm.deb version for Rootful and arm64.deb version for Rootless devices)

* **Sideloading:**
You can find pre-built IPAs in my [Telegram channel](https://t.me/Mark02workshop_official), but can also build one yourself, keep reading:

## How to build a YTMusicUltimate and MaxMusic IPA by yourself using Github actions

>[!NOTE]
>If this is your first time here, start from step 1.
>
>If you already forked my repository and built an IPA before, skip steps 1 and 2. Instead, click on the "Sync fork" button to get the latest version of the tweaks and continue through step 3.

1. Fork this repository using the fork button on the top right.
2. On your forked repository, go to Repository Settings > Actions, enable Read and Write permissions.
3. Go to the Actions tab on your forked repo, click on "Build and Release YTMusicUltimate and MaxMusic" located on the left side. Click "Run workflow" button located on the right side.
4. Find a decrypted YTMusic .ipa file (read [this](#how-to-find-decrypted-youtube-music-ipas) if you don't know where to find one) and upload it to a file provider (filebin.net, Dropbox or catbox.moe is recommended; IF YOU USED DROPBOX, YOU HAVE TO CHANGE THE FINAL PART OF THE LINK FROM dl=0 TO dl=1). Paste the url to the necessary field, select the extra tweaks you want and click "Run workflow".
5. Wait for the build to finish. You can download the tweaked IPA from the releases section of your forked repo. (If you can't find the releases section, go to your forked repo and add /releases to the url. i.e github.com/user/YTMUltimatePLUS/releases)

### Home Screen widget on sideloaded installs

The YouTube Music widget is an app extension. It needs to be included in the IPA and signed with a matching App Group entitlement on both the app and the extension. If its artwork and tiles stay gray, check that the installer/signing service preserved the extension and its App Group. A signing profile without that capability cannot make the stock widget read the app's recent-playback data; rebuild and install with a signing method that supports the same App Group for both targets. Tapping the widget may still open YouTube Music because the widget's actions are supplied by the original app.

## App-local WireGuard (optional, iOS 17+)
Check **App-local WireGuard** when running the build workflow to include an in-app WireGuard tunnel: YouTube Music's own requests and music streams go through an imported WireGuard `.conf` without a system VPN or network extension. See [docs/WireGuard.md](docs/WireGuard.md) (Korean) for setup, diagnostics and what has to be verified on a device.

## How to find decrypted YouTube Music IPAs

**If you have Telegram:**
1. Open Telegram
2. Search for "Eevee IPA Decrypter bot"
3. Start the bot and send him the link for YouTube Music on App Store
4. He will send you the latest YouTube Music decrypted IPA

**If you don't have Telegram/want another version of YouTube Music:**
> [!NOTE]
> For this make sure to disable all adblocks you have (NextDNS, ADGuard, Brave Shields, uBlock Origin etc.)

1. Open your browser and search "Decrypt Day"
2. Click the first link (It should be like decrypt . day the link, without spaces of course)
3. On the search bar, type "YouTube Music", click on "Search" and YouTube Music
4. Scroll down and click on "Download for free" to download the latest available version immediately, click on "Previous versions" instead to download older versions

## IPA building troubleshooting (I can't build the IPA/Github action fails/I can't find the releases section etc.)

99.9% of the time, the culprit is the IPA URL you provided. You HAVE TO provide a decryped IPA. It cannot be any other extension, it has to be a **.ipa** file. Find a decrypted YTMusic IPA (refer to [this](#how-to-find-decrypted-youtube-music-ipas)), upload it to filebin.net, Dropbox or catbox.moe (IF YOU USED DROPBOX, YOU HAVE TO CHANGE THE FINAL PART OF THE LINK FROM dl=0 TO dl=1), give the direct link to the GitHub action. If you find a working ipa and upload it properly, everything will start working perfectly, pinky promise.

If the github action works and you cannot find where you can download the result, you need to add /releases to the url of your forked repository. It'll probably look like this: https://github.com/YOURUSERNAME/YTMUltimatePLUS/releases, don't forget to replace the YOURUSERNAME part with your username on GitHub. It may seem invisible but if the github action is successful, IPA will be there as a draft relelase.

## So.. What is MaxMusic
MaxMusic is simply a fork of the original [YTMusicUltimate](https://github.com/Dayanch96/YTMusicUltimate) by [Dayanch96](https://github.com/Dayanch96), but with more integrated tweaks and with custom downloads features.

## MaxMusic versions changelog
 * **1.0 (May 29 2026)**:
  <p>First release, added Return-YouTube-Music-Dislikes, YTMABConfig, YouMusicPiP and VolumeBoostYT</p>
  
 * **1.1 (September 1 2026)**:
   <p>Changed name from YTMUltimate+ to MaxMusic</p>

  * **1.2 (October 9 2026)**:
   <p>Custom YTMusicUltimate tweak:
      
       - Added new custom download tab design, offline playlists and custom offline player for downloaded songs (all with Liquid Glass; credits to @Ilhamaji)
       - New trash bin button to delete songs in download tab
       - Working downloads in newer versions of YT Music
       - New feature "Download All Playlist Tracks" but still not working, will fix in 1.3 (still not fixed in 1.3 :( )</p>
       
  * **1.3 (November 9 2026)**:
  <p>• Created by myself and added a new fork of Return-YouTube-Music-Dislikes, named Return YTMusic Dislikes MaxMusic, that offers a new feature "Auto Skip Disliked Songs". You can find its settings in YouTube Music > Account

• Added a new tweak for the Last.fm Scrubbler feature, link here (REQUIRES LOGGING IN/CREATING A PERSONAL ACCOUNT TO USE THE APP)

• Removed YouMusicPiP from my pre-compiled IPAs, but you can still integrate it by yourself with GitHub Actions</p>

## Added tweaks
>[!NOTE]
>All added tweaks preferences can be found in YTMusic > Account, except for VolumeBoostYT, YouMusicPiP and YTMABConfig (Because them don't have a preferences section in settings or have it in YTMusic > Account > Settings).
>
>YTMusicUltimate preferences can be
found in YTMusic > Account.
  
 <details>
  <summary>Return-YouTube-Music-Dislikes</summary>
   <p>Return-YouTube-Music-Dislikes is a tweak based on Return-YouTube-Dislikes that permit to view dislikes in YouTube Music app</p>
     <p><a href="https://github.com/PoomSmart/Return-YouTube-Music-Dislikes">Official repository</a> by <a href="https://github.com/PoomSmart">PoomSmart</a></p>
     <p><a href="https://github.com/Mark02-2012/RYMD-MaxMusic">My fork of it</a> (the one I'm using in MaxMusic)</p>
   </details>

  <details>
   <summary>YTMABConfig</summary>
    <p>YTMABConfig is a tweak that permit to view and change A/B flags of YouTube Music</p>
     <p><a href="https://github.com/PoomSmart/YTMABConfig">Official repository</a> by <a href="https://github.com/PoomSmart">PoomSmart</a></p>
  </details>

  <details>
   <summary>YouMusicPiP</summary>
   <p>YouMusicPiP is a tweak based on YouPiP that enable PiP in YouTube Music when you select video mode on the song and exit from the app</p>
     <p><a href="https://github.com/PoomSmart/YouMusicPiP">Official repository</a> by <a href="https://github.com/PoomSmart">PoomSmart</a></p>
  </details>

   <details>
     <summary>VolumeBoostYT</summary>
     <p>VolumeBoostYT is a tweak that was created for YouTube, but it's also compatible with YouTube Music, that permit to adjust and boost your volume from 0 to 2000% with gestures</p>
     <p><a href="https://github.com/VasirakCalgux/VolumeBoostYT">Official repository</a> by <a href="https://github.com/VasirakCalgux">VasirakCalgux</a></p>
   </details>

   <details>
     <summary>Last.fm Scrobbler</summary>
     <p>Last.fm Scrobbler for YouTube Music</a> is a tweak to port the <a href="last.fm">Last.fm</a> scrubbler feature on YouTube Music</p>
     <p><a href="https://github.com/ImMALWARE/ios-yt-music-last.fm">Official repository</a> by <a href="https://github.com/ImMALWARE">ImMALWARE</a></p>
   </details>
### Lock Screen launch identity and Feather

The Now Playing repair uses the installed on-disk bundle ID, like BitChord. Google login still receives its expected original identity, but NSBundle identity spoofing is now limited to calls from the main Google executable; system frameworks and extension bundles receive their own real identity. The repair also requests association when playback resumes without a metadata update. This uses private MediaRemote API and needs device verification; a request counter is not proof of successful launch.

BitChord owns its WidgetKit extension and snapshot writer. This tweak instead relies on the supplied YouTube Music IPA's original widget and shared storage. The release workflow now checks that WidgetKit extensions and their executables survive repackaging and that extension IDs belong to the final host ID. This check does not prove that extension binaries are decrypted or that the final signature grants shared storage.

With Feather, preserve app extensions during import/signing, and check that the final app and widget are signed with profiles granting at least one common App Group. The new storage bridge, loaded by both processes, maps Google's original groups into separate folders inside that common group. It reads the final signatures and leaves already granted original groups alone. Unsupported/DER-only entitlement metadata or no shared group causes it to leave storage unchanged rather than guess. Do not use Spotify's bundle ID or signing identity for YouTube Music; use a distinct ID and matching profile. If the certificate/profile lacks App Groups, a dylib patch cannot grant that capability. A gray widget can therefore remain until the input IPA and final signing are corrected.

Device verification after installing a newly signed build:

1. Play in Spotify, then play a track in YouTube Music. Lock the device and tap Now Playing; repeat after pause/resume and from Dynamic Island.
2. In YTMusicUltimate settings, open the separate Now Playing launch diagnostics row below the optional WireGuard / Proxy row to check the installed bundle ID, signed App ID, API availability and association counter.
3. Add the YouTube Music widget, play several tracks, and verify artwork/data updates and tapping the widget. Repeat after unlocking/restarting the app.
4. Recheck Google login, since its identity workaround must continue to work.

Automated checks: `python3 -m unittest discover -s tests/packaging -v`; `.github/workflows/nowplaying-check.yml` additionally runs the Objective-C MediaRemote mock harness on macOS. Neither replaces a signed-IPA device test.

### Standalone repair for existing IPAs

`bash scripts/build-repair.sh /tmp/YTMUPlaybackRepair.dylib` builds the Now Playing repair and shared storage bridge on macOS with Xcode and `ldid`. Then run:

```sh
python3 scripts/patch-repair.py original.ipa repaired.ipa --dylib /tmp/YTMUPlaybackRepair.dylib
```

The script preserves the input, rejects encrypted executables and missing widgets, injects the same standalone dylib into host and WidgetKit extension, preserves their entitlement dictionaries and ad-hoc signs the changed executables. The output needs full signing in Feather before installation. No signing identities, provisioning profiles or private keys are generated or bundled.

The normal IPA workflow builds Now Playing into the main tweak and injects a groups-only companion to avoid installing the Now Playing hooks twice. `Source/WidgetBridge/` is excluded from the main tweak so host and widget each load exactly one group bridge. Foregrounding the app or obtaining a media center alone does not claim the local media origin; binding requires published playback metadata.
