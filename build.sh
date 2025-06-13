#!/usr/bin/env sh

pwd

emacs -Q --script build.el

base_url="${BASE_URL:-http://localhost:8080}"

written_date() {
    date="$1"
    month=$(date -d"$date" +"%-m")

    if [ "$month" -ge 3 ] && [ "$month" -le 7 ]; then
        month_fmt="%B" # Full name (March, April, May, June, July)
    else
        month_fmt="%b." # Abbriviated name (Jan., Feb., Aug., Sep., Oct., Nov., Dec.)
    fi
    printf "%s" "$(date -d "$date" +"%A, ${month_fmt} %-e, %Y")"
}

get_mod_date() {
    file="$1"
    git log -1 --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%ad' "$file"
}

for filepath in public/*.html; do
    filename="$(basename "$filepath")"
    org_path="content/${filename%html}org"
    home_nav="🏠<a href='${base_url}'>Home</a>"
    this_url="🌐<a href='${base_url}/${filename}'>${base_url}/${filename}</a>"
    mod_date="📅$(written_date "$(get_mod_date "$org_path")")"

    byline="<p class='byline'><span>${home_nav}</span><span>${mod_date}</span></p>"
    footer="<span>Content ©2025 Søren Lund and licensed under <a href='https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1'>CC BY-SA 4.0</a></span><span>${this_url}</span>"
    sed -i -e '/^<h1/a'"$byline" "$filepath" -e "s#<FOOTER>#${footer}#"
done
