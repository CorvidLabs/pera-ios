#!/usr/bin/env bash
#
# Headless UI smoke test for Corvid Nevermore Wallet.
#
# Erases a simulator for a clean onboarding, builds the app + UI test target,
# and runs the XCUITest smoke suite. No host Accessibility permission and no
# LocalNet required — the suite exercises navigation + rendering only.
#
# Usage:   scripts/ci-uismoke.sh
# Env:     SIM_DEVICE     simulator name        (default: "iPhone 17")
#          RESULT_BUNDLE  .xcresult output path (default: build/ui-smoke.xcresult)
#
set -euo pipefail

DEVICE_NAME="${SIM_DEVICE:-iPhone 17}"
RESULT="${RESULT_BUNDLE:-build/ui-smoke.xcresult}"
SCHEME="pera-uitests"
PROJECT="algorand.xcodeproj"

UDID="$(xcrun simctl list devices available \
  | awk -F '[()]' -v d="$DEVICE_NAME" '$0 ~ d" \\(" { gsub(/^ +| +$/,"",$2); print $2; exit }')"

if [ -z "${UDID:-}" ]; then
  echo "error: simulator '$DEVICE_NAME' not found (set SIM_DEVICE)." >&2
  echo "available devices:" >&2
  xcrun simctl list devices available >&2
  exit 1
fi
echo "==> using $DEVICE_NAME ($UDID)"

echo "==> erasing simulator for a clean onboarding"
xcrun simctl shutdown "$UDID" >/dev/null 2>&1 || true
xcrun simctl erase "$UDID"
xcrun simctl bootstatus "$UDID" -b

rm -rf "$RESULT"
mkdir -p "$(dirname "$RESULT")"

if command -v xcbeautify >/dev/null 2>&1; then PRETTY="xcbeautify"; else PRETTY="cat"; fi

echo "==> running $SCHEME smoke suite"
set -o pipefail
xcodebuild test \
  -project "$PROJECT" \
  -scheme "$SCHEME" \
  -configuration Debug \
  -destination "platform=iOS Simulator,id=$UDID" \
  -resultBundlePath "$RESULT" \
  | $PRETTY

echo "==> smoke test passed. result bundle: $RESULT"
