# first step
FROM node:alpine as builder
WORKDIR /home/app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# second step
FROM nginx
COPY --from=builder /home/app/build /usr/share/nginx/html