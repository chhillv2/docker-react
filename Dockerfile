FROM node:alpine

WORKDIR '/app'

COPY package.json . 
RUN npm i 

COPY . .

CMD ["npm", "run", "start"]

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html