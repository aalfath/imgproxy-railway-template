# Changelog

Each entry is one version of this template. Breaking changes come first.

## 4.0.24-1 (2026-11-16)

- README: Deploy on Railway button linking to the published template `imgproxy-2`. No change to the image or the service.

## 4.0.24 (2026-11-16)

- First release: imgproxy v4.0.24, `ghcr.io/imgproxy/imgproxy:v4.0.24@sha256:5f3546e097bde5d2c568bf5110c4e3fb4af9bbe2cc5da6390067fda034a88db3`.
- URL signing is on by default: the template generates a hex `IMGPROXY_KEY` and `IMGPROXY_SALT`, and the container refuses to start without them unless `IMGPROXY_ALLOW_UNSIGNED=true`.
- Defaults baked into the image: `IMGPROXY_USE_ETAG=true`, `IMGPROXY_USE_LAST_MODIFIED=true`, `IMGPROXY_AUTO_WEBP=true`, `IMGPROXY_TTL=31536000`. Health check: `/health`.
