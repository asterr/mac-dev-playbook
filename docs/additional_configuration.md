## Fix Display Manually

  * Open System Preferences -> Displays:
    * Scaled to More Space
    * Adjust arrangement for multiple monitors

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
protocol_vers_map=6
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

  * Exclude Recovered files from Spotlight
    * Open System Preferences -> Spotlight
    * Privacy
    * Add /System/Volumes/Data/recovered
    * Rebuild Spotlight Index
      ```
      sudo mdutil -d /System/Volumes/Data
      sudo mdutil -i on /System/Volumes/Data
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
  * Add Flycut to Login Items
    * Open System Preferences
    * Users and Groups
    * Select primary login account
    * Click Login Items
    * Add Flycut.app

----

## Install Parallels

  * https://www.parallels.com/jp/
  * Click My Account
  * Login (personal e-mail / Google)
  * Download "Parallels Dekstop for Mac Pro Edition"
  * Open "Install Parallels Desktop.dmg"
  * Click "Install Parallels Desktop.app"
  * Parallels Preferences
    * General:Virtual machine Dock icons: None

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

## Install ExpressVPN -- Cancelled

_Needs to be done on the Mac Host_

  * https://www.expressvpn.com/
  * Click "My Account"
  * Login with personal email
  * Dowload for Mac
  * Open the Pkg File:
    * expressvpn_mac_11.9.0.70037_release.pkg
  * Sign In (Express VPN App)
  * Do not launch on startup

Uninstall:

  * Cancel subscription
    * https://www.expressvpn.com
    * Click "My Account"
    * Login with personal email
    * Click "My Subscription"
    * Click "Edit subscription settings"
    * Turn Off Automatic Renewal
  * Quit ExpressVPN, if it is running
  * Open Applications
    * Move "ExpressVPN.app" to the trash
  * Remove "ExpressVPN Launcher" from Login Items
    * System Preferences -> Users & Groups
    * Select current user
    * Login Items
    * Remove "ExpressVPN Launcher" from the list

----

## Install Quicken (in Windows)

  * Download Quicken.exe from https://quicken.com
  * Install in Windows
  * Copy `~/Documents/Quicken to the new machine.`
  * Start the ExpressVPN, connected to the US. (on the Mac host)
    * This might or might not be required.  It didn't work reliably.
    * ProtonVPN or other solutions might be equally viable.
    * Or Quicken might start working again for non-US IP addresses.
    * Symptoms are:
      * Verify username and password
      * Attempt to activate still results in "credentials error"
  * Open Quicken in Windows.
  * Select the existing `asterr-current.qdf` file.
  * Login to Quicken to activate.
    * Use personal e-mail and Quicken password.

----

## Install Purple Tree

_Disk usage visualization utility._

  * Already purchased in App Store.
  * Download via App Store.

----

## Register Sublime

_The key is in email from 2021-05-20_

  * Open Sublime Text
  * Help -> Enter License

----

## Install OmniFocus

  * https://omnigroup.com
  * Signin:
    * personal e-mail
  * Download Omnifocus for Mac
  * Install
  * Setup Sync
    * personal e-mail
  * Add license
    * see email from: 2018-10-01
  * Preferences:
    * Layout: Columns
      * Add "deferred date"
    * Style:Font size: Small
    * Style:Color Palette: Color Text in the Outline
    * Dates & Times:Due Soon Means: 1 week
  * Fix Favorite Perspectives
    * Inbox
    * Forecast
      * Show deferred items
    * Todo
    * Review
    * Due Daily
    * Projects
    * Chores

----

## Fix Parallels Networking

_The shared network is in 10.0.0.0/8 which is used for corporate._

  * Original: 10.211.55.0/24
  * Target: 172.16.122.0/24

Process:

  * Open Parallels Desktop
  * Open Preferences -> Network
  * Select "Shared"
  * Connect Mac to this Network: Enabled (default)
  * Start address: 172.16.122.1
  * End address: 172.16.122.254
  * Subnet mask: 255.255.255.0
  * Restart Parallels Desktop

_Note: Something happened when I attempted to restart
Parallels Desktop, and I end up needed to force quit
and reboot my Mac._

----

## ITerm Hot Key

  * Open Automator
  * Create new Quick Action document
    * Workflow receives: no input
    * in "any application"
    * Add "Run AppleScript" action:
      ```
      on run {input, parameters}
        tell application "iTerm"
          create window with default profile
        end tell
        return input
      end run
      ```
  * Save action as "iTermLauncher"

  * Open System Preferences
  * Keyboard -> Shortcuts
  * Select "Services"
  * Find "iTermLauncher" under "General"
  * Set Key to: Cmd+9

_Note: If it doesn't work, manually run the "service" from the
application menu that is in focus.  Each application needs to
be granted access to control iTerm._

----

## Fix workspace order

  * Preferences
  * Mission Control
  * Disable: Automatically rearrange Spaces based on most recent use

----

## Setup Mac Mail

  * Preferences:
    * General:
      * Check for new messages: Automatically
      * New messages sound: None
      * Automatically try sending later if outgoing server is
        unavailable: True

  * Customize Toolbar
    * Menu: View: Customize Toolbar
    * Show: Icon and Text
    * Items:
      * Get Mail
      * Tags
      * Archive
      * Delete
      * Junk
      * Reply
      * Reply All
      * Forward
      * New Message
      * Hide Related Messages
      * Search

  * Accounts:
    * home-imap:
      * Account Information
        * Enable this account: True
        * Description: home-imap
        * Email Address: Aaron Sterr (home) <asterr@pobox.com>
        * Download Attachments: All
      * Mailbox Behavior:
        * Drafts Mailbox: MailMac/Drafts
        * Sent Mailbox: MailMac/Sent Messages
        * Junk Mailbox: MailMac/Spam
        * Erase junk messages: Never
        * Trash Mailbox: MailMac/Deleted Messages
        * Erase deleted messages: After one month
        * Archive Mailbox: Archive
      * Server Settings/Incoming Mail Server (IMAP):
        * User Name: asterr
        * Password:
        * Host Name: zeus
        * Automatically manage connection settings: False
        * Port: 993 (Use TLS/SSL)
        * Authentication: Password
        * Advance IMAP Settings:
          * IMAP Path Prefix: MailMac
          * TLS Certificate: None
          * Allow insecure authentication: False
      * Server Settings/Outgoing Mail Server (SMTP)
        * Account: asterr@pobox.com
        * User Name: asterr@pobox.com
        * Password: 
        * Host Name: smtp.pobox.com
        * Automatically manage connection settings: False
        * Port: 465 (Use TLS/SSL)
        * Authentication: Password
    * Pobox
      * Account Information
        * Enable this account: True
        * Description: Pobox
        * Email Address: Aaron Sterr <asterr@pobox.com>
        * Download Attachments: Recent
      * Mailbox Behavior:
        * Drafts Mailbox: INBOX/Drafts
        * Sent Mailbox: INBOX/Sent
        * Junk Mailbox: INBOX/Spam
        * Erase junk messages: Never
        * Trash Mailbox: INBOX/Trash
        * Erase deleted messages: After one month
        * Archive Mailbox: INBOX/Archive
      * Server Settings/Incoming Mail Server (IMAP):
        * User Name: asterr@pobox.com
        * Password:
        * Host Name: mail.pobox.com
        * Automatically manage connection settings: False
        * Port: 993 (Use TLS/SSL)
        * Authentication: Password
        * Advance IMAP Settings:
          * IMAP Path Prefix: INBOX
          * TLS Certificate: None
          * Allow insecure authentication: False
      * Server Settings/Outgoing Mail Server (SMTP)
        * Account: asterr@pobox.com
        * User Name: asterr@pobox.com
        * Password: 
        * Host Name: smtp.pobox.com
        * Automatically manage connection settings: False
        * Port: 465 (Use TLS/SSL)
        * Authentication: Password
  * Viewing:
    * List Preview: 1 line
    * Display unread messages with bold font: True
  * Composing:
    * Check spelling: Never
    * When sending to a group, show all member addresses: True

Fix Rules:

  * Quit Mail
  * Copy: `~/Library/Mail/V9/SyncedRules.plist` to `~/Library/Mail/V9/UnsyncedRules.plist`
  * Start Mail
  * Verify the rules.
  * Remove any duplicates.

_Note: UnsyncedRules get added to SyncedRules by Mail._

----

## Install MailTags

  * Download MailSuite 2021
    * https://smallcubed.com/#sc_download
    * 30-Day Trial (will add license next)
    * Install (only MailTags and MailActon)
  * Start Mail
    * The Build Tag Library will begin (takes a long time)
  * Register
    * Code from 2018-10-17 (see mail)
    * Mail Menu -> Smallcubed MailSuite
    * Purchase Registration
    * Enter the Registration Code
    * Click OK
  * Configuration
    * Open Mail Preferences -> MailTags
      * General
        * Tag Window: select all
        * Show tag panel when composing: False
        * Send tags with message: True
      * Keywords
        * Auto add new keywords to preferred list: True
        * Number of recent items: 25
        * Sort order for display on messages: By Frequency and Alphabetical
        * Gear: Collect Keywords


_Note: Mail Act-On F3 will move messages._

----

## Install MsgFiler

_Note: MsgFiler is installed from the App Store by Ansible._

  * Open MsgFiler
  * Gear:
    * Keep MsgFiler Open After Filing: False
    * Pressing Enter Always Performs Default Action: True
  * Preferences
    * Filing:
      * Keep MsgFiler open after filing: False
      * Use MsgFiler Enginer to file engines: True
        * Mark messages as read: True
  * If "MsgFiler Engine Not Installed" pops up
    * Open: https://msgfiler.com/support/engine/
    * Download MsgFiler Engine Version 1.6.2
    * Quit Mail
    * In Finder, open: Library/Mail/Bundles
    * Drag: "MsgFilerEngine.mailbundle" to the Bundles folder.
    * Reopen Mail
    * Open Mail Preferences
    * General -> Manage Plugins
    * Enable MsgFilerEngine.mailbundle
    * Restart MacMail
  * Enable Bundles for MacMail
    ```
    sudo defaults write "/Library/Preferences/com.apple.mail" EnableBundles 1
    defaults write com.apple.mail EnableBundles -bool true
    defaults write com.apple.mail BundleCompatibilityVersion 4
    ```
  * Permissions for MsgEngine
    * Open System Preferences -> Security & Privacy
    * Privacy
    * Accessibility
      * Add MsgFiler.app
    * Automation:
      * Check: MsgFiler.app/Mail.app
    * Restart Mail and MsgFiler

  * Add MsgFiler to login items
    * System Preferences
    * Users & Groups
    * Current User
    * Login Items
      * MsgFiler.app

----

## Fix Login Items

  * System Preferences
  * Users & Groups
  * Current User
  * Login Items
    * Pulse Secure
    * Mini Calendar

----

## Install SpamSieve

  * Download: http://c-command.com/downloads/SpamSieve-current.dmg
  * Restore: `~/Library/Application Support/SpamSieve`
  * Install SpamSieve.app
  * Register app with details from purchase
  * Set Up for Apple Mail
    * Grant "Full Disk Access" to SpamSieve
      * System Preferences:Security & Privacy:Privacy
    * Quit Mail
    * Open SpamSieve
    * SpamSieve -> Install Apple Mail Plug-In
    * Open Mail
    * Enable the SpamSieve Plugin
  * Restore: `~/Library/Mail/SpamSieve/com.c-command.SpamSieve.plist`
  * Enable SpamSieve Rule
    * Mail Preferences -> Rules
    * Create "SpamSieve" Rule (name must begin with SpamSieve)
    * If "any" of the folllowing conditions are met:
      * "Every Message"
    * Perform the following actions:
      * Move Message to mailbox "Junk" (pobox)
  * Move the SpamSieve rule to the top of the rule list.
  * SpamSieve Preferences
    * Notification
      * Play sound: False

----

## Add Folders to Dock

  * Open Finder
  * Open Macintosh HD
  * Drag "Applications" to the Dock.
    * Set Display as Folder
    * Set View as Fan
  * Open asterr
  * Drag "Documents" to the Dock.
    * Set Display as Folder
    * Set View as Fan
    * Sort by Date Modified

----

## Install RVM (Ruby)

From: https://nrogap.medium.com/install-rvm-in-macos-step-by-step-d3b3c236953b

  * `\curl -sSL https://get.rvm.io | bash`


** TODO: 1.8.7 won't build on Mac M1 so far**

Support for 1.8.7 on Mac:

  * See: https://github.com/rvm/rvm/issues/5033
  * Download: https://github.com/openssl/openssl/releases/tag/OpenSSL_1_0_2u
  * `cd openssl-OpenSSL_1_0_2u`
  * `./Configure darwin64-x86_64-cc --prefix=/usr/local/opt/openssl@1.0`
  * `make`
  * `make test`
  * `sudo make install`

Build RVM with openssl@1.0

  * `export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC`
  * `export optflags="-Wno-error=implicit-function-declaration"`
  * `export SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk`
  * `export CPPFLAGS=-I/usr/local/opt/openssl@1.0/include`
  * `export CPPFLAGS=-I${SDKROOT}/usr/include`
  * `export CFLAGS=-I${SDKROOT}/usr/include`
  * `PATH=/usr/local/opt/openssl@1.0/bin:$PATH`
  * `rvm autolibs disable`
  * `brew install gcc`
  * `arch -x86_64 rvm install 1.8.7-p374 --with-openssl-dir=/usr/local/opt/openssl@1.0`
  * `arch -x86_64 rvm install 1.8.7-p374 --with-openssl-dir=/usr/local/opt/openssl@1.0 --autolibs=disable --with-gcc=gcc`

  * rvm install 1.8.7-p374 --with-openssl-dir=/usr/local/opt/openssl@1.0
  * rvm install 1.8.7-head --with-openssl-dir=/usr/local/opt/openssl@1.0
----

## Enable Time Machine

  * Open System Preferences -> Time Machine
  * Select Disk: New Disk
    * Use: smb://landisk-c35992/TimeMachine
      * Connect as Guest
    * Backup is: `Aaron's MacBook Pro.sparsebundle`
  * Back Up Automatically: True
  * Show Time Machine in Menu Bar: True
  * Options -> Exclusions:
    * None

----

## Install Backblaze

  * Login to: https://secure.backblaze.com/user_signin.htm
    * User: `asterr@pobox.com`
    * Need password
    * Need token

  * Download:
    * https://secure.backblaze.com/mac/install_backblaze.dmg
    * Open the installer
    * Run "Backblaze Installer.app"
    * Provide the account: asterr@pobox.com when installing


  * Have 15 days to either:
    * Inherit Backup State
    * Delete the previous backup:
        * Frees up the license
        * Then assign the license to the new computer

----

## Install Duplicati

  * Add configuration to `host_vars/127.0.0.1.yml`
  * Run `ansible-playbook main.yml -vv --tags duplicati`

### Sample Config for Shares

```
---
nas:
  duplicati001:
    username: asterr
    password: **REDACTED**
    nas_ip_address: 192.168.2.143
    nas_shares:
      - duplicati001
      - Public

  duplicati002:
    username: asterr
    password: **REDACTED**
    nas_ip_address: 192.168.2.144
    nas_shares:
      - duplicati002
```

### Import Backup Jobs

Load the backup config and create a new version

  * Move old backups
  * Open http://localhost:8200
  * Add backup
    * Import from a file
    * See: asterr/tmp/duplicati/macbook
    * Enter the encryption key


### Old Manual Steps

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


---

## Restore Remote Desktop Configurations

This step restores previous connection details from a
backup or another workstation.

_Note: Microsoft Remote Desktop is installed by Ansible._

  * Assuming that the old home directory was restored to:
    `/System/Volumes/Data/recovered/processing/Users/asterr`

  * Assuming that the current configurations can be overwritten.

  * Copy the sqlite files:

```
cd /System/Volumes/Data/recovered/processing/Users/asterr
rsync -avP Library/Containers/com.microsoft.rdc.macos/Data/Library/Application\ Support/com.microsoft.rdc.macos/com.microsoft.rdc.application-data.sqlite* ~/Library/Containers/com.microsoft.rdc.macos/Data/Library/Application\ Support/com.microsoft.rdc.macos

cd ~/Library/Containers/com.microsoft.rdc.macos/
cd Data/Library/Application\ Support/com.microsoft.rdc.macos
ls -l
```

```
total 752
drwxr-xr-x@ 5 asterr  staff     160 Nov  7 12:14 SupportingImages
drwxr-xr-x@ 5 asterr  staff     160 Nov  7 12:06 com.microsoft.appcenter
-rw-r--r--@ 1 asterr  staff  159744 Jul  7 10:03 com.microsoft.rdc.application-data.sqlite
-rw-r--r--@ 1 asterr  staff   32768 Nov  7 12:05 com.microsoft.rdc.application-data.sqlite-shm
-rw-r--r--@ 1 asterr  staff  181312 Nov  7 12:15 com.microsoft.rdc.application-data.sqlite-wal
```

  * Start Remote Desktop

  * Verify each of the saved connections
    * May need to add trust for the TLS certificates (stored in keychain)
    * May need to supply the passwords again (stored in keychain)
