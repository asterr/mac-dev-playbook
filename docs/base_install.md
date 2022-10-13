# Initial Installation

This document describes how to perform a fresh installation

---

## Overview

  * Factory Reset the Macbook
  * Base Install (with Appled ID)
  * Install Developer Tools
  * Install Ansible
  * Clone Repository
  * Install Roles
  * Run Ansible


---

## References

  * See: https://github.com/geerlingguy/mac-dev-playbook
  * See: https://hvops.com/articles/ansible-mac-osx/
  * See: https://opensource.com/article/22/6/install-software-macos-ansible-homebrew

*Forks*

  * https://github.com/asterr/mac-dev-playbook
  * https://github.com/asterr/dotfiles
  * https://github.com/asterr/ansible-role-mac-rosetta

---

## Procedures

---

### Factory Reset the Macbook

  * Shutdown
  * Boot with Options
    * Hold power button until Options appear
    * _NOTE: needed a local administrator login_
  * Use Disk Utility to wipe disk
    * Select Volume "Macintosh HD"
    * Erase the volume group
    * Might be prompted to activate Macbook with Apple ID.
  * Exit Disk Utility

---

### Base Install (Reinstall OS)

  * Shutdown
  * Boot with Options
    * Hold power button until Options appear
  * Select "Reinstall OS"
    * _NOTE: Needed my AppleID login for the Activation Lock_
  * Need a Wifi Password (unless wired)

----

### Base Install:

- Set Full Name: Aaron Sterr
- Set Account Name: asterr
- Password: local password
- Connect with Apple ID: asterr@pobox.com

----

### Install Developer Tools

```
xcode-select --install
```

----

### Install Ansible:

```
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
sudo pip3 install --upgrade pip
pip3 install ansible
```

----

### Clone Repository

```
mkdir ~/tmp
cd ~/tmp
git clone https://github.com/asterr/mac-dev-playbook.git
git submodule update --init --recursive
```

----

### Install Roles

```
ansible-galaxy install -r requirements.yml
```

----

### Manual Steps:

  * Need to sign in manually to the Apple Store (mas signin doesn't work)
  * Create `~/.vault_pass` -- super secure secret, protecting vault
    * Test with: `ansible-vault view confidential.txt`
  * Convenience feature to provide ansible_become_password:

```
    mkdir host_vars
    ansible-vault create host_vars/127.0.0.1.yml
```

```
    $ ansible-vault view host_vars/127.0.0.1.yml | sed -e 's/: .*/: REDACTED/'
    ---
    ansible_become_password: REDACTED
```

  * Prevent the macbook from sleeping during the upgrade
    * Battery Preferences
    * On Power Adapter:
      * Prevent your Mac from automatically sleeping when the display is off


----

### Running the Playbook

```
    ansible-playbook main.yml -vv
```

Debug Sequencences:

```
    # ansible-playbook main.yml --ask-become-pass --check -vv
    # ansible-playbook main.yml --ask-become-pass --check -vv --step
    # ansible-playbook main.yml --ask-become-pass -vv --step
```

Notes:

  * `gcloud auth` was required midway through the first run.
    Executed manually and reran the playbook.

----

### Reboot when done

  * Reboot the macbook when completed.

