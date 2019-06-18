# node 6을 사용
FROM node

# 모든 파일 들고오기
COPY . .

# 모듈 설치
RUN npm install sync-request sync-mysql urlencode
RUN npm install -g forever

# 컨테이너 부팅 후 실행
CMD ["forever", "get_data.js"] 



# 아래 명령어로 빌드 가능
# docker build --tag [IMAGE NAME]:[TAG] .