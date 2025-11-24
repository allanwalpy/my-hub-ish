# configuring new debian machine

how i should configure my system for mine needs

## disk partition

*NB: TODO: review filetypes - should others filetypes be used?*

note: not all drives will be present from the begining - the initial configuration is main drive only;

### drive main

ssd on cpu line; gpt partion table;

| # | name | path  | type   | size   | etc          |
|---|------|-------|--------|--------|--------------|
| 1 | root | /     | ext4   |  * Gb  |              |
| 2 | home | /home | ext4   | 64 Gb  | encrypted    |
| 3 | swap | ---   | swap   | 64 Gb  |              |
| 0 | boot | /boot | fat32  |  1 Gb  | boot section |

### drive extra

ssd on chipset line; gpt partion table;

| # | name          | path               | size    | etc                 |
|---|---------------|--------------------|---------|---------------------|
| 0 | extra         | /media/walpy/extra |  * Gb   | see note 1          | 
| 2 | recovery      | not\_mounted       | 32 Gb   | see note 2          |
| 1 | recovery.boot | ---                |  1 Gb   | see note 2          |

1 = intended for big chunk of data - game files, movies /until extrenal ssd purchased/ - everything, that is not advised to store in `/home` /because it encrypted/

2 = recovery has debian /or other - to ease up differention in grub/ installed on it, with no password /or username has password in it, like `user_1234`/ with optionally some recovery tools installed - can be useful if system on main drive borked or main ssd broke

NB: TODO: see if `recovery.boot` is required;

### drive external

usb ssd drive; gpt partion;

| # | name          | path                  | type | size | etc                              |
|---|---------------|-----------------------|------|------|----------------------------------|
| 0 | external      | /media/walpy/external | ext4 | * Gb | file storage for different media |

note: compability with non linux system is not required => etx4 is ok to use;

## file system modifications

NB: TODO: look into between drive symbolic links and their pitfals;

- /opt/user - 777 chmod, and chown by user;
  for storing user applications outside of apt packages; /games etc./

- /opt/user/files/wine - for wine prefix?;

- /home/walpy/bin - extension of bin folder;
  for adding utils outside of apt package; /consider `.local/bin`/
  also suitable for scripts;

- /home/walpy/files - for user files, like git folders;

- /home/walpy/files/feature - for extensions;
  like nightmode or conky;

- /home/walpy/storage - for mounting storage;
  instead of /media/walpy ?; or use it as a link to /media/walpy ?;


## additional comment

- `super` key calls for whisker menu;

```shell
xcape -e 'Super_L=Super_L|Z'
```
