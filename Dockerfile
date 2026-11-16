# imgproxy for Railway: the official image, pinned by version and digest.
FROM ghcr.io/imgproxy/imgproxy:v4.0.24@sha256:5f3546e097bde5d2c568bf5110c4e3fb4af9bbe2cc5da6390067fda034a88db3

# Sensible defaults. Any of them can be overridden with a service variable.
ENV IMGPROXY_USE_ETAG=true \
    IMGPROXY_USE_LAST_MODIFIED=true \
    IMGPROXY_AUTO_WEBP=true \
    IMGPROXY_TTL=31536000

COPY --chmod=755 start.sh /usr/local/bin/railway-start.sh

# imgproxy listens on $PORT (Railway sets it); health check path: /health
ENTRYPOINT ["/usr/local/bin/railway-start.sh"]
