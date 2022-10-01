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
  * Open TimeMachine "landisk-c35992" (AFP) 
    * Should be connected as Guest
<!--   * Connect to Server: `smb://landisk-c35992/TimeMachine`
  * Accept connection attempt and connect as "Guest"
 -->
 
  * From a terminal:
    ```
    hdiutil attach /Volumes/TimeMachine/Aaron\ Sterr’s\ MacBook\ Pro.sparsebundle
    ```

<!--   * In Finder
  * Open /Volumes/TimeMachine
  * Open `Aaron Sterr's MacBook Pro.sparsebundle` 
 -->
  * A new volume window should appear:
    `/Volumes/Backups of Aaron Sterr's MacBook Pro`
  * Select the desired backup time. (e.g. `2022-10-01-121745`)

  * A new hidden mount should be visible in df:
    `/Volumes/.timemachine/810F1D0D-95E8-4060-BAE9-A426786BBF63/2022-10-01-121745.backup`

  * change directory to this backup
   




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
    
## Fix Media Key Mappings

  * Download Karabiner-Elements v14.10.0
    * https://karabiner-elements.pqrs.org/
  * Install Karabiner Elements

_This might not be useful...._

  * Disable Apple Music
    ```
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
    ```

  * Install YT Music from Brew
    ```
    brew install --cask yt-music
    
  * NOTE: YouTube Music Desktop is *wrong*
  * NOTE: I should have setup YT Music in the first place (was using on old mac.)
  

    ```
