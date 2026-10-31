#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
ignite="$(brew --prefix ignite-swift/ignite/ignite-swift)/bin/ignite"
build_log="$(mktemp "${TMPDIR:-/tmp}/ignite-build.XXXXXX")"
trap 'rm -f "$build_log"' EXIT

rm -rf Build
"$ignite" build 2>&1 | tee "$build_log"
# Ignite can exit successfully after a build error, so also check its output.
grep -Fq '✅ Successfully built!' "$build_log"
test -s Build/index.html
