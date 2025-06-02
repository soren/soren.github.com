# Coding Portfolio

This is the source of my Coding Portfolio, available at

- https://slu.gitlab.io/
- https://slu.codeberg.page/
- https://soren.github.io/

I keep the code in sync across three repositories by adding push
remotes, like this:

``` shell
git remote set-url --add --push origin git@codeberg.org/slu/slu.codeberg.page.git
git remote set-url --add --push origin git@github.com:soren/soren.github.com.git
```
