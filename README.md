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
bash _permission.sh
```

## update

- go to root folder of repository;

```bash
cd script
```

- run update script;

```bash
./update
```

## remove

```bash
cd ../
rm -rf ./{root-repository-folder-name}
```

## change origin repository

in case you want use your own fork;

### https protocol

```bash
git remote set-url origin https://github.com/{user_name}/vultr-hosting-scripts.git
```

### ssh protocol

```bash
git remote set-url origin git@github.com:{user_name}/vultr-hosting-scripts.git
```
