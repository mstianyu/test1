FROM node:12.16.1
COPY package.json /usr/src/app/
WORKDIR /usr/src/app

RUN npm install
COPY . /usr/src/app/
RUN npm run build

FROM nginx:1.14.2

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
ADD nginx.conf /etc/nginx/conf.d/default.conf


 