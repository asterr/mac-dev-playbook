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

_This is not set in stone, and I am leaning towards
using /Users for primary storage, as the least surprising
design._

  * `/Users`
    * home directories only
    * goal is <20GB
  * `/System/Volumes/Data`
    * `opt/`
      * created by ansible playbook
      * holds homebrew and vagrant
    * `naibu/` -- not implemented
      * `parallels/`
      * `sandbox/`
      * TBD
    * `recovered/`
      * holds data recovered from timemachine
