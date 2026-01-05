#!/usr/bin/env bash
set -euo pipefail

# -------------------------------------------------
# Input: single argument = bundle URL (with SAS)
# -------------------------------------------------
BUNDLE_URL="${1:-}"

if [[ -z "${BUNDLE_URL}" ]]; then
  echo "Usage: bootstrap.sh <bundle_url_with_sas>"
  exit 1
fi

# -------------------------------------------------
# Pre-flight checks
# -------------------------------------------------
command -v curl >/dev/null 2>&1 || {
  echo "Error: curl is required"
  exit 1
}

command -v tar >/dev/null 2>&1 || {
  echo "Error: tar is required"
  exit 1
}

# -------------------------------------------------
# Download bundle
# -------------------------------------------------
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

BUNDLE_PATH="${TMP_DIR}/bundle.tar.gz"

echo "Downloading lab bundle..."
curl -fsSL "${BUNDLE_URL}" -o "${BUNDLE_PATH}"

# -------------------------------------------------
# Extract bundle
# Assumption:
# - tar.gz contains a top-level directory
# -------------------------------------------------
echo "Extracting lab bundle..."
tar -xzf "${BUNDLE_PATH}"

# -------------------------------------------------
# Done
# -------------------------------------------------
echo "Deployment complete."
echo "Check the extracted directory and open README.md to continue."
