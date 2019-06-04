# PostgreSQL

## Table of Contents

- [Install](#install)
- [Access PostgreSQL](#access-postgresql)
  - [Access Command Line](#access-command-line)
- [Use sample dvdrental](#use-sample-dvdrental)
- [PSQL Command Lines](#psql-command-lines)
  - [Database](#database)

## Install

### Step 1. Configure yum repository

```bash
sudo rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```

### Step 2. Install

```bash
sudo yum install -y postgresql11-server postgresql11-contrib
```

### Step 3. Initialize data

```bash
sudo /usr/pgsql-11/bin/postgresql-11-setup initdb
```

### Step 4. Boot postgreSQL

```bash
sudo systemctl start postgresql-11
sudo systemctl enable postgresql-11
```

## Access PostgreSQL

### Access Command Line

First, set password

```bash
sudo passwd postgres
```

And, connect to postgress

```bash
su - postgres -c 'psql'
```

- `-c` or `--command`: pass a single command to the shell

### Access from external

#### Step 1. Edit `/var/lib/pgsql/11/data/postgresql.conf`

```text
listen_addresses = '*'
```

#### Step 2. Edit `/var/lib/pgsql/data/pg_hba.conf`

```text
# TYPE    DATABASE    USER      ADDRESS       METHOD
host        all       all       0.0.0.0/0     md5
```

#### Step 3. Set the initial password

```bash
su - postgres -c 'psql'

ALTER USER postgres PASSWORD <new_password>;
```

## Use sample dvdrental

If you want to use sample data:

```bash
su - postgres
pg_restore -U postgres -d dvdrental /vagrant/temp/dvdrental.tar
```

And then, confirm tables:

```bash
psql
\connect dvdrental;
\dt
```

## PSQL Command Lines

### Database

#### 데이터베이스 생성

```bash
create database <name> encoding 'utf-8';
```

#### 데이터베이스 조회

- `\list` or `\l`

```bash
\list
```

#### 데이터베이스 연결

- `\connect` or `\c`

```bash
\connect <database_name>
```

#### 데이터베이스 삭제

```bash
drop database <name>;
```

#### 테이블 조회

```bash
\dt
```

### Dump

```bash
pg_dump -U db_user -W -F t db_name > /path/to/your/file/dump_name.tar
```

- `-U` to specify which user will connect to the PostgreSQL database server.
- `-W` or `--password` will force pg_dump to prompt for a password before connecting to the server.
- `-F` is used to specify the format of the output file, which can be one of the following:
  - p: plain-text SQL script
  - c: custom-format archive
  - d: directory-format archive
  - t: tar-format archive

## References

- https://linux4one.com/how-to-install-postgresql-on-centos-7/
