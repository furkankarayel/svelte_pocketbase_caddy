FROM node:lts-slim as build

WORKDIR /app

COPY package*.json ./
RUN rm -rf node_modules
RUN rm -rf build
COPY . .
RUN npm install --force
RUN npm run build

FROM node:lts-slim as run

WORKDIR /app
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/build ./build
RUN npm install --production

EXPOSE 8080
ENTRYPOINT [ "npm", "run", "start" ]