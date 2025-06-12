#!/usr/bin/env sh

pwd

emacs -Q --script build.el

base_url="${BASE_URL:-http://localhost}"

for filepath in public/*.html; do
    filename="$(basename "$filepath")"
    if [ "$filename" != "index.html" ]; then
        byline="<p>🏠<a href='${base_url}'>Home</a> "
    else
        byline="<p> "
    fi
    byline="${byline}🌐<a href='${base_url}/${filename}'>${base_url}/${filename}</a> 📅June 12, 2025 (first revision)</p>"
    sed -i '/^<h1/a '"$byline" "$filepath"
done
