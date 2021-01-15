# 빌드 단계
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 실행 단계
# FROM 키워드 하나당 블록하나를 관리하고
# 이전 FROM 블록의 파일시스템은 삭제되기 때문에
# 최종이미지의 용량은 작다.
# nginx의 기본명령어를 통해 자동으로 웹서버가 실행된다.
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

