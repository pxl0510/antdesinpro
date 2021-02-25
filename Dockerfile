FROM node:5.15.0-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install --registry=http://registry.npm.taobao.org
COPY . .
RUN npm run build 
 
FROM nginx:latest
COPY nginx.conf /etc/nginx
COPY --from=builder /app/build /usr/share/nginx/html