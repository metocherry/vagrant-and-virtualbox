# Change Password

1. Switch to the root user.

```bash
sudo su -
```

2. Connect to the postgres datbase.

```bash
su - postgres -c psql
```

3. Change the postgres password

Syntax : `\password <username>`

```bash
\pssword postgres
```

and then, exit

```bash
\q
```
