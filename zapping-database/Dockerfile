FROM alpine:3.18

# Install SQLite
RUN apk add --no-cache sqlite

WORKDIR /data

COPY init.sql /init.sql

CMD ["sh", "-c", "sqlite3 /data/zapping.db < /init.sql && tail -f /dev/null"]