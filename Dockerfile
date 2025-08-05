FROM node:lts-buster
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://github.com/XdKing2/MALVIN-XD /home/node/MALVIN-XD
WORKDIR /home/node/MALVIN-XD
RUN chmod -R 777 /home/node/MALVIN-XD/
RUN yarn install --network-concurrency 1
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
