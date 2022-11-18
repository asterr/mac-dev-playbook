## Sequence

### Preparation

  * Complete Backups
    * Duplicati (Mac)
    * Duplicati (Zeus)
    * Time Machine (Mac)

  * Disable Old Laptop
    * Disable automatic timemachine backups
    * Stop duplicati
      * `launchctl -w unload ~/Library/LaunchAgents/net.duplicati.plist`
      * pkill mono
    * Disable wifi

---

### Rebuild

  * Build Laptop
  * Run ansible configuration
  * Copy old data to /System/Volumes/Data/recovered
  * Install Zeus
  * Install Windows 11 for Quicken

---

### Other Fixes

  * Manual Fixes
  * See additional configuration

---

## Disk Layout

_I decided to return to standard usage of /Users._

  * `/Users`
    * home directories

  * `/System/Volumes/Data`
      * `opt/`
          * created by ansible playbook
          * holds homebrew and vagrant
      * `recovered/`
          * holds data recovered from timemachine
      * `usr/`
          * holds locally installed software
