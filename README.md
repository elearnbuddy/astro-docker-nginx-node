# Astro + Node.js + Nginx + Docker

This is a sample repo for `Astro` with `Docker`, `Node.js` and `Nginx`.

`Nginx` is used to serve static files and `Node.js` is used for any `Astro Actions` or `Astro Islands`.

This ensures static pages are served very efficiently while not compromising on some `Astro` features that can be used with a static site but require Node.js.

## Install dependencies

```sh
pnpm install
```

## Dev Mode

```sh
pnpm run dev
```

## Build

```sh
pnpm run build
```

## Build Docker

```sh
docker build . -t my-astro-app
```
