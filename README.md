[![Codeberg CI](https://ci.codeberg.org/api/badges/13654/status.svg)](https://ci.codeberg.org/repos/13654)
[![GitLab CI](https://gitlab.com/slu/slu.gitlab.io/badges/main/pipeline.svg)](https://gitlab.com/slu/slu.gitlab.io/)
----

# Professional Profile

This is the source of my professional profile, which consists of my CV, Resume, and Coding Portfolio. All are available at

- https://slu.codeberg.page/
- https://slu.gitlab.io/
- https://soren.github.io/

The content is maintained as a set of [Org-mode] files and converted to HTML using an [Elisp] script. This setup is inspired by [Build Your Website with Org Mode].

## Notes

The content definitely needs restructuring and rewriting, and I will refer to, for example, [CV, Resume vs Portfolio: What’s The Difference] when doing so.


I keep the code in sync across three repositories by adding push remotes, like this:

``` bash
for url in ssh://git@codeberg.org/slu/slu.codeberg.page.git \
           git@gitlab.com:slu/slu.gitlab.io.git \
           git@github.com:soren/soren.github.com.git; do
    git remote set-url --add --push origin "$url"
done
```

Codeberg pages are stored in a branch named "pages". To create an empty pages branch, issue the following:

``` bash
git switch --orphan pages                      # create empty branch
git commit --allow-empty -m 'Add pages branch' # make empty commit that we can push
git push -u origin pages                       # push to remote
```

[CV, Resume vs Portfolio: What’s The Difference]: https://www.linkedin.com/pulse/cv-resume-vs-portfolio-whats-difference-magicalapi-dnbzc/
[Org-mode]: https://en.wikipedia.org/wiki/Org-mode
[Elisp]: https://en.wikipedia.org/wiki/Emacs_Lisp
[Build Your Website with Org Mode]: https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/
