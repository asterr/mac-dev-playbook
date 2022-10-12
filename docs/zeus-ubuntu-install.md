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
    * General:Name: zeus
    * Option:Startup and Shutdown: Always Ready in the Background
    * Options:Sharing:
      * Share custom Mac folders with Linux
        * Share cloud folders with Linux
        * Share Mac volumes with Linux
        * "Manage Folders":
          * Add "asterr"
    * Backup:SmartGuard: Enable
  * Restart: Parallels Desktop
  * Unmimize the install
    ```
    sudo unminimize
    ```

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

----

### Run Ansible

  * create ~asterr/.vault_pass
  * install dependencies
    ```
    cd ~asterr/zeus-ansible
    ansible-galaxy install -r requirements.yml
    ```
  * run the playbook
    ```
    cd ~asterr/zeus-ansible
    ansible-playbook site.yml -v
    ```

----

### Recover the Home Directory

  * import one of the zeus duplicati configs (encrypted)
    * `zeus-home-001-duplicati-config.json.aes`
  * disable the schedule
  * repair the database
  * restore to: /home/asterr/recover

  * swap files around
    ```
    sudo mv /home/asterr /home/asterr.new
    sudo mv /home/asterr.new/recover /home/asterr
    rsync -avP /home/asterr.new/zeus-ansible /home/asterr
    rsync -avP /home/asterr.new/ansible-runner.sh /home/asterr
    rsync -avP /home/asterr.new/.vault_pass /home/asterr
    ```

----

### Rebuild Backups

Rename the local backups:

```
cd /mnt/duplicati001
sudo mv zeus-home-001 zeus-home-001.20221006-old-host
cd /mnt/duplicati002
sudo mv zeus-home-002 zeus-home-002.20221006-old-host
```

Rename AWS backups

  * Install the awscli
    ```
    sudo apt install awscli
    aws configure
      # enter AWS Access Key
    ```
  * Open https://console.aws.amazon.com
  * Open S3
  * Create a new bucket
    * `duplicati-zeus-home-aws-20221006-old-host`
    * Copy settings from `duplicati-zeus-home-aws`
    * Create bucket
  * Copy bucket contents
    ```
    aws s3 sync s3://duplicati-zeus-home-aws s3://duplicati-zeus-home-aws-20221006-old-host
    ```

Repeat for each of:

  * zeus-home-001
  * zeus-home-002
  * zeus-home-aws

Load the backup config and create a new version

  * Move old backups
  * Open http://localhost:8200 (on zeus)
  * Add backup
    * Import from a file
    * See: asterr/tmp/duplicati/zeus
    * Enter the encryption key
