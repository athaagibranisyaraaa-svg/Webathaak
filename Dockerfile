FROM node:20-slim
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg chromium \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
ENV CHROMIUM_PATH=/usr/bin/chromium \
    PUPPETEER_SKIP_DOWNLOAD=true
COPY package*.json ./
RUN npm ci
COPY . .
RUN NODE_OPTIONS=--max-old-space-size=3072 npm run build \
    && mkdir -p /app/storage/videos /app/storage/uploads
ENV NODE_ENV=production
EXPOSE 4000
CMD ["npm", "start"]
