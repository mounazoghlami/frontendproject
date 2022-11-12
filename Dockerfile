FROM node:16.3.0-alpine
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm config set legacy-peer-deps true
RUN npm install
COPY . .
RUN npm run build 

FROM nginx:latest
COPY --from=BUILD /app/dist/frontenddevops /usr/share/nginx/html
EXPOSE 80
