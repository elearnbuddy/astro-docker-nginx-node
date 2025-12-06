FROM node:24-alpine AS build

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /app

COPY . .

RUN pnpm install --frozen-lockfile

RUN pnpm run astro sync && pnpm run build

FROM node:24-alpine AS runtime

RUN apk add --no-cache nginx

RUN mkdir -p /run/nginx

RUN mkdir -p /usr/share/nginx/html

WORKDIR /app

COPY --from=build /app/dist ./dist
COPY --from=build /app/package.json ./package.json

COPY nginx.conf /etc/nginx/nginx.conf

RUN cp -r ./dist/client/* /usr/share/nginx/html/

COPY start.sh ./start.sh
RUN chmod +x ./start.sh

ENV HOST=0.0.0.0
ENV PORT=4000

EXPOSE 3000

CMD ["./start.sh"]
