#!/usr/bin/env bash
# Assemble a GitHub Pages site from every top-level folder containing index.html.
# Usage: scripts/build-site.sh [outdir]   (default: _site)
set -euo pipefail

cd "$(dirname "$0")/.."
out="${1:-_site}"
rm -rf "$out"
mkdir -p "$out"

links=""
for dir in */; do
  dir="${dir%/}"
  [[ "$dir" == "$out" ]] && continue
  [[ -f "$dir/index.html" ]] || continue
  cp -R "$dir" "$out/$dir"
  links+="      <li><a href=\"$dir/\">$dir</a></li>"$'\n'
done

cat > "$out/index.html" <<HTML
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>99-Prime-Explore</title>
    <style>
      body { font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", Arial, sans-serif; margin: 2em 16px; }
      li { margin: 0.5em 0; }
    </style>
  </head>
  <body>
    <h1>99-Prime-Explore</h1>
    <p>Explore the density of prime numbers.</p>
    <ul>
${links}    </ul>
  </body>
</html>
HTML

touch "$out/.nojekyll"
echo "Built $out:"; ls "$out"
