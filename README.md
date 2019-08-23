# Vagrant

- 가상화란?
- 하이퍼바이저(Hypervisor)
- Vagrant : 스크립트를 기반으로 특정 환경의 가상 머신을 만들어서 빠르게 개발 환경을 구축하고 공유할 수 있게 만들어진 솔루션

## Vagrant Plugin

```bash
vagrant plugin install vagrant-vbguest
```

## Centos 7

```bash
/ 루트 패스워드 설정
sudo passwd root

// ssh 설정
sudo vi /etc/ssh/sshd_config

// 방화벽 사용
sudo systemctl enable firewalld
sudo systemctl start firewalld

// selinux
// centos7은 selinux를 사용하며, ssh 포트가 22번 포트로 고정되어있다.
// selinux에서 포트를 추가하기 위해서는 semanage가 필요하다.
$ sudo yum install policycoreutils-python

// 정의된 포트 확인
$ sudo semanage port -l | grep ssh

// 포트 추가
$ sudo semanage port -a -t ssh_port-t -p tcp {포트번호}


```# /etc/nginx/nginx.conf
include /etc/nginx/conf.d/*.conf;```


mkdir -p /shared_data/apps/example.com/current/public
mkdir -p /shared_data/apps/logs
```

## References

- [lesstif - Vagrant란?](https://www.lesstif.com/pages/viewpage.action?pageId=24445417)
