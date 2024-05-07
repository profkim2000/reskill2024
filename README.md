# reskill2024
reskill 2024

## 연습문제
sql.txt 파일의 전체 sql을 적용하고
연습문제2.pdf 파일의 연습문제를 풀어봅니다.

## 연습문제 답
연습문제의 답은 이 github에서 찾을 수 있습니다. 연습문제의 답 파일은 현재는 삭제된 상태이지만 commit history를 살펴보면 찾을 수 있음.


## docker 설정

### 네트워크 생성
docker network create --subnet=172.30.0.0/16 mynet

각 서버들의 네트워크 IP는 다음과 같이 할 계획임. 웹서버: 172.30.0.5 WAS 서버: 172.30.0.6 DB 서버: 172.30.0.7

### webserver 실행(image: httpd)

docker run -dit --net mynet --ip 172.30.0.5 --name httpd -p 41080:80 -p 41022:22 -e TZ=Asia/Seoul httpd

### tomcat 실행(image: tomcat)

docker run -dit --privileged --net mynet --ip 172.30.0.6 --name tomcat -p 42888:8080 -p 42022:22 -e TZ=Asia/Seoul tomcat:9.0

### postgresql 실행(image: ubuntu/postgres)

docker run -d --net mynet --ip 172.30.0.7 --name postgres -p 43432:5432 -p 43022:22 -e POSTGRES_PASSWORD=My:s3Cr3t/ -e TZ=Asia/Seoul ubuntu/postgres:latest

### tomcat 서버 새로 설치하고 geoserver 올리기 실행(image: tomcat)
docker run -dit --privileged --net mynet --ip 172.30.0.8 --name **tomcat_geoserver** -p 44888:8080 -p 44022:22 -e TZ=Asia/Seoul tomcat:9.0
