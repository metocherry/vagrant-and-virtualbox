# Semanage

## Command Lines

### Check selinux

```bash
sestatus
```

### Find opend http_port

```bash
sudo semanage prot -l | grep http_port_t
```

### Add http_port

```bash
sudo semanage port -a -t http_port_t -p tcp <port>
```

## Resolve Problems

* -bash: semanage: command not found

```bash
sudo yum install -y policycoreutils-python
```

## References

* [Linux Troubleshooting – semanage command not found in CentOS 7/RHEL 7](https://www.ostechnix.com/linux-troubleshooting-semanage-command-not-found-in-centos-7rhel-7/)
