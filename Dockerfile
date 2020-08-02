FROM node:10-alpine

ARG BUILD_TYPE=production
#RUN apk add --no-cache python make g++

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

EXPOSE 8080
CMD ["node", "src/app.js"]

COPY --chown=node:node package*.json ./

USER node
ENV NODE_ENV ${BUILD_TYPE}
RUN npm ci

COPY --chown=node:node src/ src/
