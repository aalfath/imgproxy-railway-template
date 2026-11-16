#!/bin/sh
# Refuse to start as an open image proxy: URL signing needs a hex key and salt.
# Set IMGPROXY_ALLOW_UNSIGNED=true only if you really want unsigned URLs.
set -e
if [ -z "${IMGPROXY_KEY}" ] || [ -z "${IMGPROXY_SALT}" ]; then
  if [ "${IMGPROXY_ALLOW_UNSIGNED:-false}" != "true" ]; then
    echo "railway-start: IMGPROXY_KEY and IMGPROXY_SALT must both be set (hex-encoded)." >&2
    echo "railway-start: set IMGPROXY_ALLOW_UNSIGNED=true to run without URL signing (not recommended)." >&2
    exit 1
  fi
  echo "railway-start: WARNING: running without URL signing (IMGPROXY_ALLOW_UNSIGNED=true)." >&2
fi
exec entrypoint.sh imgproxy "$@"
