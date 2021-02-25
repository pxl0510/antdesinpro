FROM node:12.18.3 as builder
WORKDIR /app
COPY package.json .
RUN npm install --registry=http://registry.npm.taobao.org
COPY . .
RUN npm run build 
 
FROM nginx:latest
COPY nginx.conf /etc/nginx
COPY --from=builder /app/build /usr/share/nginx/html