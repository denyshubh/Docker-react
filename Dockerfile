FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN yarn 

COPY . .
CMD ["yarn", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
