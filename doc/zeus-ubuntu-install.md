## Installing Zeus (Ubuntu 22.04)

Notes from: 2022-09-30

  * Use Ubuntu 22.04.1 LTS (desktop)
  * Minimum Spec: 1vCPU, 1.5GB RAM

Repositories

  * Old: `~/sandbox/zeus.git` -- MacBook only -- has secrets
  * New: https://github.com/asterr/zeus-ansible.git

----

### Install with Parallels

  * Create New
  * Download Ubuntu Linux
  * Wait for install to complete -- about 30 minutes.
  * Settings:
    * General:Name: Zeus-Ubuntu
    * Option:Startup and Shutdown: Always Ready in the Background
    * Backup:SmartGuard: Enable
  * Restart: Parallels Desktop

----

### Fix for User IDs

_Parallels creates a user "parallels" with uid 1000._

  * Create 'testroot' user
    ```
    sudo groupadd -g 2001 testroot
    sduo useradd \
      -u 2001 \
      -g testroot \
      -G sudo \
      --create-home \
      testroot
    sudo passwd testroot
    ```

  * Log back in as testroot

  * Delete the 'parallels' user
    ```
    sudo userdel -r parallels
    ```

  * Create 'asterr' user (minimal)
    ```
    sudo groupadd -g 1000 asterr
    sudo useradd \
      -u 1000 \
      -g asterr \
      -G sudo \
      --create-home \
      asterr
    sudo passwd asterr
    ```

  * Log back in asterr

  * Delete the 'testroot' user
    ```
    sudo userdel -r testroot
    ```

----

### Prep after OS Install

  * clone zeus-ansible
    ```
    sudo apt install git
    cd /home/asterr
    git clone https://github.com/asterr/zeus-ansible.git
    ```

  * install ansible
    ```
    sudo apt install python3-pip
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
    ```

  * get git token
    ```
    cd zeus-ansible
    ansible -m debug -a "var=git_token" all -e @config.yml
    ```

  * basic git config
    ```
    sudo apt install vim
    git config --global credential.helper store
    git config --global user.name "Aaron Sterr"
    git config --global user.email "asterr@pobox.com"
    git config --global core.editor vim
    # force a login
    git push
      # email: personal
      # token: from ansible debug command above
    ```
