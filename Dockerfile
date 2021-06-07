FROM node:14.1-alpine AS build

#Application folder in the container
WORKDIR /app
#Copies react app to container
COPY . /app
#silent makes the process not logged on the server
RUN npm install --silent
RUN npm install react-scripts@3.0.1 -g 

#builds the production build
RUN npm run build

FROM nginx:1.16.0-alpine
# copy from container build into nginx folder
COPY --from=build /app/build /usr/share/nginx/html
#remove default config file from nginx
RUN rm /etc/nginx/conf.d/default.conf
#replace config file with new nginx conf file
COPY nginx/nginx.conf /etc/nginx/conf.d

#Fire up the port
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

