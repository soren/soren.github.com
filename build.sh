#!/usr/bin/env sh

pwd

emacs -Q --script build.el

base_url="${BASE_URL:-http://localhost:8080}"

written_date() {
    local date=$1
    local month month_fmt

    month=$(date -d"$date" +"%-m")

    if [ "$month" -ge 3 ] && [ "$month" -le 7 ]; then
        month_fmt="%B" # Full name (March, April, May, June, July)
    else
        month_fmt="%b." # Abbriviated name (Jan., Feb., Aug., Sep., Oct., Nov., Dec.)
    fi
    echo -n "$(date -d "$date" +"%A, ${month_fmt} %-e, %Y")"
}

for filepath in public/*.html; do
    filename="$(basename "$filepath")"
    org_path="content/${filename%html}org"
    home_nav="🏠<a href='${base_url}'>Home</a>"
    this_url="🌐<a href='${base_url}/${filename}'>${base_url}/${filename}</a>"
    mod_date="📅$(written_date "$(git log -1 --pretty="format:%ci" "$org_path")")"

    byline="<p class='byline'><span>${home_nav}</span><span>${mod_date}</span></p>"
    footer="<span>Content ©2025 Søren Lund and licensed under <a href='https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1'>CC BY-SA 4.0</a></span><span>${this_url}</span>"
    sed -i -e '/^<h1/a'"$byline" "$filepath" -e "s#<FOOTER>#${footer}#"
done
