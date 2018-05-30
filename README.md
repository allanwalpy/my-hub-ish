# vultr-hosting-scripts
just some scripts for my serv

## installation;

### 1. clone repository;

```bash
git clone https://github.com/allan-walpy/vultr-hosting-scripts.git
```

### 2. rename folder on smth easy;

```bash
mv vultr-hosting-scripts script
```

### 3. go to folder;

```bash
cd script
```

### 4. give permission to run scripts with `./`;

```bash
bash grant_permission.sh
```

## update;

### 1. go to root folder of repository;

```bash
cd script
```

### 2. run update script;

```bash
./update
```

## change origin repository;
in case you want use your own fork;

### https protocol
```bash
git remote set-url origin https://github.com/my_user_name/vultr-hosting-scripts.git
```

### ssh protocol
```bash
git remote set-url origin git@github.com:my_user_name/vultr-hosting-scripts.git
```
