FROM node:20.12.2-alpine3.19

WORKDIR /usr/src/app

COPY package.json pnpm-lock* ./
RUN corepack enable pnpm && pnpm i --frozen-lockfile

COPY . .

RUN corepack enable pnpm && pnpm run build

EXPOSE 3000

CMD [ "pnpm", "run", "start" ]