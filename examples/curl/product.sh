#!/usr/bin/env bash
# Chewy Product API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./product.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/chewy/product" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.chewy.com/purina-pro-plan-adult-sensitive-skin/dp/128666
