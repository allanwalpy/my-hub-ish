# configuring new debian machine

how i should configure my system for mine needs

## disk partition

| # | name | path  | size   | etc          |
|---|------|-------|--------|--------------|
| 1 | boot | /boot | 1 Gb   | boot section |
| 2 | home | /home | 50 Gb  | encrypted    |
| 3 | swap | ----- | 16 Gb  |              |
| 4 | root | /     | 100 Gb |              |

## file system modifications

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