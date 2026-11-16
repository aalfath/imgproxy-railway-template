# imgproxy on Railway

This repo is the source of the **imgproxy** template on Railway. It deploys [imgproxy](https://github.com/imgproxy/imgproxy) **v4.0.24**, the fast image server that resizes, crops and converts remote images on the fly from a URL.

- Image: `ghcr.io/imgproxy/imgproxy:v4.0.24@sha256:5f3546e097bde5d2c568bf5110c4e3fb4af9bbe2cc5da6390067fda034a88db3` (official, pinned by digest).
- One service, with a public Railway domain and a health check on `/health`. imgproxy keeps no data, so there's no volume.
- `start.sh` checks that URL signing is configured, then starts imgproxy through the image's own entrypoint.

## Variables

| Variable | Default | What it does |
|---|---|---|
| `IMGPROXY_KEY` | generated, 64 hex chars | Hex-encoded key used to sign image URLs |
| `IMGPROXY_SALT` | generated, 64 hex chars | Hex-encoded salt used to sign image URLs |
| `PORT` | `8080` | Port imgproxy listens on (Railway routes the domain here) |

Baked-in defaults you can override with a service variable: `IMGPROXY_USE_ETAG=true`, `IMGPROXY_USE_LAST_MODIFIED=true`, `IMGPROXY_AUTO_WEBP=true`, `IMGPROXY_TTL=31536000`. Every other option is in the [imgproxy configuration docs](https://docs.imgproxy.net/configuration/options). Useful ones: `IMGPROXY_ALLOWED_SOURCES` (only fetch from your own buckets or sites), `IMGPROXY_USE_S3` with the `AWS_*` variables (read from S3-compatible storage) and `IMGPROXY_MAX_SRC_RESOLUTION`.

The container refuses to start without a key and salt, so it never runs as an open proxy by accident. To run without signing anyway, set `IMGPROXY_ALLOW_UNSIGNED=true`.

## Signing URLs

Your app builds each URL as `https://YOUR-DOMAIN/<signature>/<processing options>/plain/<source url>` and signs it with the key and salt. See [Signing a URL](https://docs.imgproxy.net/usage/signing_url) and the [examples](https://github.com/imgproxy/imgproxy/tree/master/examples) for most languages.

## Updates

Changes to this repo's `main` branch show up as an "update available" notice in Railway projects deployed from the template. Read `CHANGELOG.md` before you apply one.
