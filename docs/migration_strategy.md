# Migration to Macbook Strategy

## Data Backup Tools

  * [ ] Time Machine
  * [ ] Backblaze
  * [ ] Duplicati

---

## Key Data to Verify

_Verify the following data is backed up and
restored to /System/Volumes/Data/recovered._


  * [ ] /Users/*
  * [ ] Virtual Machines
  * [ ] Desktop (Aaron)
  * [ ] Stickies (Aaron)
  * [ ] Keychain

---

## Work Applications

_Note: Data recovery should not be an issue for these
applications.  The data can be downloaded from servers
as needed._


  * [ ] Pulse / VPN
  * [ ] Chrome (Accounts)
  * [ ] VIP Access (Register Token)
  * [ ] Outlook (Account)
  * [ ] Teams (Account)
  * [ ] iTerm2 (License)
  * [ ] YT Music (Account)
  * [ ] Slack (Accounts)
  * [ ] Docker Desktop (Account, Configs)
  * [ ] Sublime Text (License, Configs, Plugins)
  * [ ] Microsoft Remote Desktop (Configs)
  * [ ] OneNote (Account)

---

## Personal Applications

_Note: These applications require data migration to
be useful, especially mail and virtual machine related._

  * [ ] Omnifocus (Account, Config)
  * [ ] Mail (Accounts, Config)
  * [ ] Calendar (Account)
  * [ ] MsgFiler (License)
  * [ ] SendToKindle (Account)
  * [ ] Microsoft Excel
  <!-- * [ ] VMWare Fusion (License, Config)  -- replaced by Parallels -->
  * [ ] Parallels (License, Config)
  * [ ] SpamSieve (License)
  * [ ] MiniCalendar

---

## Additional Bits

  * [ ] Printer (Manual)


---

# Procedures and Notes

## Base Install

See the base_install.md

_Note: Ran Software Updates from System Preferences._

---
Manual steps below here.

## Printers

  * Add printers manually as needed.

---

## Pulse Connections

_Note: Pulse is installed by ansible._

  * Add connections
    * us-access
      * type: Policy Secure (UAC)
      * server: us-access.tradingscreen.com
      * settings prompted at login:
        * Realm: Two-Factor
        * User Name: {{ short username }}
    * eu-access
      * type: Policy Secure (UAC)
      * server: eu-access.tradingscreen.com
      * settings prompted at login:
        * Realm: Two-Factor
        * User Name: {{ short username }}
    * ap-access
      * type: Policy Secure (UAC)
      * server: ap-access.tradingscreen.com
      * settings prompted at login:
        * Realm: Two-Factor
        * User Name: {{ short username }}

_Note: Since Pulse will be outdated, it will auto-upgrade
about 5 minutes after connecting.  In Oct 2022, it upgraded
to v9.1.15(15819)_

_Reboot after this sequence.)_


---

## Chrome Accounts

_Note: Chrome is installed by ansible._

  * Create a profile:
    * Primary login: {{ personal e-mail }}
    * This should synchronize bookmarks, passwords, etc.
  * Add a secondary account: {{ work e-mail }}

---

## Slack Accounts

_Note: Slack is installed by ansible._

  * Sign-in to Slack
    * First workspace:
      * Work e-mail
      * Need e-mail confirmation code
      * Need 2FA code for this workspace.
    * Second workspace:
      * Work e-mail
      * Need e-mail confirmation code
      * Need 2FA code for this workspace.
    * Third workspace:
      * Personal e-mail
      * Need e-mail confirmation code

---

## VIP Access Token

_Note: VIP Access is installed by ansible._

_Note: Unless the token is registered, it can not be used for logins._

_Reference: https://imaginesoftware.atlassian.net/wiki/spaces/INFRATS/pages/24010175174/HowToVIPToken_

  * Connect to the VPN (or inside a physical office)
  * Register the new token (on each reinstall):
    * Open: {{ VIP Self Service URL }}
    * Login with standard work credentials.
    * Provide one-time code from an existing token installation.
  * Click on "register"
  * Open New VIP Access
  * Credential Registration:
    * Name: MacBook 2022 Example
    * Credential ID (from token)
    * Security code (from token)
    * Submit

---

## MS Office

_Note: MS Office is installed by ansible._

  * Open Microsoft Outlook
  * Add work e-mail address
  * Enter password
  * Authorize request with Microsoft Authenticator
    on another device.
  * Accept Privacy Agreement
  * Personalization:
    * Density: Compact
    * Reading Pane: Read on the right

---

## MS Office Updater

  * Open Microsoft AutoUpdate
  * Open "Advanced"
  * Set Update Channel to Beta
  * Turn off "Auto Install"

---

## MS Teams

_Note: MS Teams seems to be installed with MS Office._

  * Open Microsoft Teams
  * Add work e-mail address
  * Enter password
  * Authorize request with Microsoft Authenticator
    on another device.

---

## MS OneNote

_Note: MS OneNote is installed with MS Office._

_Note: This assumes that the work account is already
signed in from the Outlook setup step._


  * Open Microsoft OneNote
  * Go to File -> Open Notebook
  * Add a Place
    * Click: OneDrive
    * Add personal e-mail
    * Select "Personal Account"
    * Send notification to Authenticator
  * Historical Notebooks (cleaning)
    * OneDrive - Personal/Documents/

---

## Gcloud

_Note: Gcloud is installed by ansible into `~/utils/google-cloud-sdk`._

  * gcloud auth login
  * setup configurations (see ./gcloud-configs.md)

---

## YT Music

_Note: YT Music is install by ansible._

_Need to review if any actions are actually required._

  * Manually Open from /Applications and accept prompt (if error about application downloaded from the Internet.)
  * Need to sign in:
    * Google ID (personal)
    * Google Password
    * Google 2FA
