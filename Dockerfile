FROM node:14.1-alpine AS builder

WORKDIR /opt/web
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.17-alpine
RUN apk --no-cache add curl
COPY ./nginx/nginx.conf /etc/nginx/nginx.template
CMD ["/bin/sh", "-c", "envsubst < /etc/nginx/nginx.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
COPY --from=builder /opt/web/build /usr/share/nginx/html