FROM nginx:alpine

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["/bin/sh", "-c", "sed -i \"s|TWITCH_OAUTH_PLACEHOLDER|${TWITCH_OAUTH}|g\" /usr/share/nginx/html/_auth.js && \
    sed -i \"s|TWITCH_USERNAME_PLACEHOLDER|${TWITCH_USERNAME}|g\" /usr/share/nginx/html/_auth.js && \
    sed -i \"s|TWITCH_CHANNEL_PLACEHOLDER|${TWITCH_CHANNEL}|g\" /usr/share/nginx/html/_auth.js && \
    nginx -g 'daemon off;'"]