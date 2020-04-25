FROM node:8.11.2
RUN apt-get clean && apt-get update
RUN apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN npm config set registry https://registry.npm.taobao.orgregistry.npm.taobao.org \
 && npm install \
 && npm run build \
 && cp -r dist/* /var/www/html \
 && rm -rf /app
CMD ["nginx","-g","daemon off;"]

 