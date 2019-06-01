# vultr-hosting-scripts

just some scripts for my serv

## install

- clone repository;

```bash
git clone https://github.com/allan-walpy/vultr-hosting-scripts.git
```

- rename folder on smth easy;

```bash
mv vultr-hosting-scripts script
```

- go to folder;

```bash
cd script
```

- give permission to run scripts with `./`;

> NB! `sudo` priveleges required

```bash
bash ./_maintenance/init
```

## update

- go to root folder of repository;

```bash
cd script
```

- run update script;

```bash
./_maintenance/_update
```

## remove

```bash
cd ../
rm -r -f ./script
```

## change origin repository

in case you want use your own fork;

### https protocol

```bash
git remote set-url origin https://github.com/{user_name}/{repository_name}.git
```

### ssh protocol

```bash
git remote set-url origin git@github.com:{user_name}/{repository_name}.git
```

## secret scripts

Some scripts are hidden from git to not expose secret information. Such files ends with `.hide`, but for each of such file git repository contains `.hide.example` of script without sensitive information