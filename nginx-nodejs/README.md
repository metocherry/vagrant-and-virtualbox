# Nginx NodeJS

## SELinux

nginx 로그보기

```bash
tail -n 100 /var/log/nginx/error.log
```

SELinux로 인한 nginx proxy denied

```bash
setsebool -P httpd_can_network_connect true
```

## References

- [nginx - SELinux 환경설정 문제로 인한 HTTP 프록시 연결 실패 해결](https://marshallslee.tistory.com/entry/nginx-SELinux-%ED%99%98%EA%B2%BD%EC%84%A4%EC%A0%95-%EB%AC%B8%EC%A0%9C%EB%A1%9C-%EC%9D%B8%ED%95%9C-HTTP-%ED%94%84%EB%A1%9D%EC%8B%9C-%EC%97%B0%EA%B2%B0-%EC%8B%A4%ED%8C%A8-%ED%95%B4%EA%B2%B0)