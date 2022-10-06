## Create local volumes

mkdir /System/Volumes/Data/naibu
mkdir /System/Volumes/Data/recovered


## Configure SMB

Add to `~/Library/Preferences/nsmb.conf`

```
[default]
signing_required=no
read_async_cnt=10
write_async_cnt=10
dir_cache_async_cnt=20
dir_cache_max_cnt=20480
# ----------------------
# tuning
protocol_vers_map=4
streams=yes
soft=yes
notify_off=yes
mc_prefer_wired=yes
max_resp_timeout=180
```


## Restore Data from Time Machine

  * Open Finder
  * Connect to Server: `smb://landisk-c35992/TimeMachine`
    * Accept connection attempt and connect as "Guest"

  * In Finder
    * Open /Volumes/TimeMachine
    * Open `Aaron Sterr's MacBook Pro.sparsebundle`

  * A new volume window should appear:
    `/Volumes/Backups of Aaron Sterr's MacBook Pro`
  * Select the desired backup time. (e.g. `2022-10-02-063044`)

  * A new hidden mount should be visible in df:
    `/Volumes/.timemachine/C2D76FA9-7860-443C-A846-B36C5D658239/2022-10-02-063044.backup`

  * change directory to this backup

  * If the shell reports "Operation not permitted"
    * Open Security and Privacy in System Preferences
    * Check Full Disk Access
      * Grant access to iTerm.app if not already granted.
      * Restart iTerm.app after granting permissions

  * The backup will be under a directory like `2022-10-02-063044.backup`
    * _This is repeated in the path._

  ```
  ➜  2022-10-02-063044.backup ls -l
total 16
drwxr-xr-x@ 5 root  wheel   160 Oct  2 06:27 2022-10-02-063044.backup
-rw-r--r--@ 1 root  wheel  4670 Oct  2 05:30 backup_manifest.plist
➜  2022-10-02-063044.backup cd 2022-10-02-063044.backup
➜  2022-10-02-063044.backup pwd
/Volumes/.timemachine/C2D76FA9-7860-443C-A846-B36C5D658239/2022-10-02-063044.backup/2022-10-02-063044.backup
  ```

  * Rsync files as desired.
    * sudo if files are owned by multiple users.

```
➜  Macintosh HD - Data pwd
/Volumes/.timemachine/C2D76FA9-7860-443C-A846-B36C5D658239/2022-10-02-063044.backup/2022-10-02-063044.backup/Macintosh HD - Data
➜  Macintosh HD - Data sudo rsync -avP Users/ /System/Volumes/Data/recovered/2022-10-02/Users/
```



## Desktop

  * Set Hot Keys for Spaces:
    * ^1 -> Space 1
    * ^2 -> Space 2
    * ^3 -> Space 3
    * ^4 -> Space 4
    * ^5 -> Space 5
    * ^6 -> Space 6
    
  * Set Display:
    * Scaled: More Space

  * Set Desktop:
    * The Lake -- Dynamic

  * Set Hot Corners:
    * Upper Left: Disable Screen Saver
    * Upper Right: Start Screen Saver
    * Lower Left: Desktop
    * Lower Right: Mission Control

  * Increase Dock Size

  * Set Screen Saver
    * Show with clock

  * Security & Privacy
    * Require password "immediately" after sleep or screen saver begins

## Finder Preferences

  * Sidebar -> Show
    * asterr
    * Aaron's MacBook Pro

## Start Flycut

_Clipboard with history_

  * Run Flycut.app
  * Add Flycut.app to "Accessibility" apps in Security and Privacy.

## Fix Media Key Mappings -- Fixed by using correct app

  * Download Karabiner-Elements v14.10.0
    * https://karabiner-elements.pqrs.org/
  * Install Karabiner Elements

_This might not be useful...._

_NOTE: I uninstalled Karabiner_

  * Disable Apple Music
    ```
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
    ```

_NOTE: I did not disable Apple Music._


  * Install YT Music from Brew
    ```
    brew install --cask yt-music
    ```

  * NOTE: YouTube Music Desktop is *wrong*
  * NOTE: I should have setup YT Music in the first place (was using on old mac.)
  * See: https://github.com/steve228uk/YouTube-Music

----

## Install Parallels

  * https://www.parallels.com/jp/
  * Click My Account
  * Login (personal e-mail / Google)
  * Download "Parallels Dekstop for Mac Pro Edition"
  * Open "Install Parallels Desktop.dmg"
  * Click "Install Parallels Desktop.app"

## Install Windows 11

  * Select "Windows 11 Home"
  * Click "Install Windows"
    * Takes about 15-20 minutes
  * Accept License
  * Sign in to Windows
    * Personal Account

  * Activate Windows
    * Preferences
    * System -> Activation
    * Troubleshoot
    * I changed hardware on this device recently
    * Pick the old Windows 11 Home license for Parallels (unused)

----

## Install ExpressVPN

_Needs to be done on the Mac Host_

  * https://www.expressvpn.com/
  * Click "My Account"
  * Login with personal email
  * Dowload for Mac
  * Open the Pkg File:
    * expressvpn_mac_11.9.0.70037_release.pkg
  * Sign In (Express VPN App)
  * Do not launch on startup

----

## Install Quicken (in Windows)

  * Download Quicken.exe from https://quicken.com
  * Install in Windows
  * Copy `~/Documents/Quicken to the new machine.`
  * Start the ExpressVPN, connected to the US. (on the Mac host)
  * Open Quicken in Windows.
  * Select the existing `asterr-current.qdf` file.
  * Login to Quicken to activate.
    * Use personal e-mail and Quicken password.

----

## Install Duplicati

  * https://github.com/duplicati/duplicati/releases
    * duplicati-2.0.6.104_canary_2022-06-15.dmg
  * Open duplicati-2.0.6.104_canary_2022-06-15.dmg
  * Copy to Applications
  * Run Duplicati
    * Will warn that mono is required
  * Click Download
    * Goes to: https://www.mono-project.com/download/stable/#download-mac
  * Download "Mono 6.12.0 (Visual Studio channel)" for macOS
  * Open the downloaded pkg file:
    * MonoFramework-MDK-6.12.0.182.macos10.xamarin.universal.pkg

TODO: Start properly
