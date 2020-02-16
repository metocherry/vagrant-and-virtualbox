# Doodle

MVCC(multi-version concurrency control)

- 일관성
- 동시성

## PostgreSQL

### Resolve Problems

#### 외부 접속 오류 - 접근

Add or edit `/var/lib/pgsql/11/data/postgresql.conf`:

```text
listen_addresses = '*'
```

And edit `/var/lib/pgsql/11/data/pg_hba.conf`:

```text
# TYPE    DATABASE    USER      ADDRESS       METHOD
host        all       all       0.0.0.0/0     md5
```

#### 외부 접속 오류 - 초기 패스워드

```bash
ALTER USER postgres PASSWORD <new_password>;
```

## Shell

### Query Services

```bash
sudo systemctl list-units --type service
```
