# Mac OS Notes

This page documents some technical procedures for Mac OSX.

---

## Manual Copy of Files from Time Machine

_Note: Using wired ethernet between the workstation and the time machine
disk is **much** faster than wireless._

  * Open the TimeMachine share using Finder.
  * Double click on the relevant sparse bundle.
    * If encrypted, enter the encryption key.
    * Finder will open a new window like:
      `/Volumes/Backups of XXX's MacBook Pro`
  * Open the desired backup in Finder.
  * Find the mount in terminal:
    `df | grep timemachine`

_Note: If multiple mounts are returned, find the one with the correct timestamp in the path._

_Note: In Monterey (12.6), the path looked like: `/Volumes/.timemachine/810F1D0D-95E8-4060-BAE9-A426786BBF63/2022-09-20-063817.backup`_

  * Use rsync to copy as desired:

```
➜  ~ cd /Volumes/.timemachine/810F1D0D-95E8-4060-BAE9-A426786BBF63/2022-09-20-063817.backup
➜  2022-09-20-063817.backup ls -l
total 48
drwxr-xr-x@ 5 root  wheel    160 Sep 20 06:14 2022-09-20-063817.backup
-rw-r--r--@ 1 root  wheel  24392 Sep 20 05:04 backup_manifest.plist
➜  2022-09-20-063817.backup cd 2022-09-20-063817.backup
➜  2022-09-20-063817.backup ls
Macintosh HD - Data
➜  2022-09-20-063817.backup cd Macintosh\ HD\ -\ Data
➜  Macintosh HD - Data ls -l
total 3840
drwxrwxr-x@ 133 root  admin  4256 Sep 16 18:52 Applications
-rw-r--r--@   1 root  wheel     0 Sep 20 06:38 Icon?
drwxr-xr-x@ 131 root  wheel  4192 Sep 14 08:25 Library
drwxr-xr-x@   3 root  wheel    96 Aug 24 17:59 System
lrwxr-xr-x+   1 root  wheel    60 May 14  2011 User Guides And Information -> /Library/Documentation/User Guides and Information.localized
lrwxr-xr-x+   1 root  wheel    49 Dec 31  2014 User Information -> /Library/Documentation/User Information.localized
drwxr-xr-x@   9 root  admin   288 Aug 24 17:59 Users
drwxr-xr-x@   2 root  wheel    64 Sep 20 06:12 Volumes
drwxr-xr-x@  85 root  wheel  2720 Sep 14 08:15 boot
drwxr-xr-x@   2 root  wheel    64 Aug 25  2019 cores
drwxr-xr-x@   2 root  wheel    64 Jul 20 08:22 local
drwxr-xr-x@   2 root  wheel    64 Aug 25  2019 mnt
drwxr-xr-x@   9 root  wheel   288 Oct 21  2019 opt
drwxr-xr-x@   6 root  wheel   192 Sep 14 08:26 private
drwxr-xr-x@   2 root  wheel    64 Aug 25  2019 sw
drwxr-xr-x@   5 root  wheel   160 Aug 24 17:59 usr
```

```
➜  ~ sudo rsync -avP "/Volumes/.timemachine/810F1D0D-95E8-4060-BAE9-A426786BBF63/2022-09-20-063817.backup/2022-09-20-063817.backup/Macintosh HD - Data/Users/" /System/Volumes/Data/test-recovery/
```

---

## Create a Persistent Volume

A basic persistent directory can be created under:

    /System/Volumes/Data

The volume can be linked under the root directory, using
`/etc/synthetic.conf`.

  * IMPORTANT: the file is tab delimited.
  * In vim, may need to use: `set noexpandtab`

Example:

```
 $ ls -l /etc/synthetic.conf
-rw-r--r--  1 root  wheel  36 Sep 24 19:49 /etc/synthetic.conf
 $ cat /etc/synthetic.conf
afs-foo System/Volumes/Data/afs-foo
```
