# Giblab with Docker

## Install Docker on CentOS

```bash
sudo yum update -y
```

### Install using the repository

#### set up repository

```bash
// 1. Install required packages
sudo yum install -y yum-utils \
                    device-mapper-persistent-data \
                    lvm2


// 2. Set up the stable repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

// 3. Install Docker CE(Community Edition)
sudo yum install docker-ce docker-ce-cli containerd.io
```

#### Running Docker

run 명령어를 사용하면, 사용할 이미지가 저장되어 있는지 확인하고, 없으면 다운로드(pull)를 한 다. 그 후 컨테이너를 생성(create)하고, 시작(start)한다.

```bash
sudo systemctl start docker
sudo docker version

sudo docker run <docker_image_name>

// @example
// @references https://hub.docker.com/_/centos?tab=tags
sudo docker run centos
```

When you want to remove it:

```bash
sudo yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine

sudo rm -rf /var/lib/docker/
```

## Docker Command Lines

| 옵션  | 설명                                                   |
| ----- | ------------------------------------------------------ |
| -d    | detached mode 흔히 말하는 백그라운드 모드              |
| -p    | 호스트와 컨테이너의 포트를 연결(포워딩)                |
| -v    | 호스트와 컨테이너의 디렉토리를 연결(마운트)            |
| -e    | 컨테이너 내에서 사용할 환경변수 설정                   |
| -name | 컨테이너 이름 설정                                     |
| -rm   | 프로세스 종료시 컨테이너 자동 제거                     |
| -it   | -i와 -t를 동시에 사용한 것으로 터미널 입력을 위한 옵션 |
| -link | 컨테이너 연결(컨테이너명:별칭)                         |

## References

* [도커 설치](https://docs.docker.com/compose/install/) - https://docs.docker.com/compose/install/
* [초보자를 위한 도커 안내서](https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html)
