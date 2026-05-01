FROM node:20-slim AS builder
RUN npm install -g pnpm
WORKDIR /app
COPY . .
RUN pnpm install && pnpm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html

CMD /bin/sh -c "sed -i \"s|TWITCH_OAUTH_PLACEHOLDER|${TWITCH_OAUTH}|g\" /usr/share/nginx/html/assets/*.js && \
                sed -i \"s|TWITCH_USERNAME_PLACEHOLDER|${TWITCH_USERNAME}|g\" /usr/share/nginx/html/assets/*.js && \
                sed -i \"s|TWITCH_CHANNEL_PLACEHOLDER|${TWITCH_CHANNEL}|g\" /usr/share/nginx/html/assets/*.js && \
                nginx -g 'daemon off;'"