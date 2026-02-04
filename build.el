;; Load the publishing systems
(require 'ox-publish)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive t
             :base-directory "./content"
             :base-extension "org"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil           ;; Don't include author name
             :with-creator nil          ;; Don't include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil       ;; Don't include time stamp in file
             :html-postamble t          ;; Include footer
             :html-postamble-format '(("en" "<hr><p><em>Copyright ©2025 Søren Lund and licensed under <a href='https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1'>CC BY-SA 4.0</a></em></p><hr><p><a href=\"https://codeberg.org/slu/slu.codeberg.page\"><img alt=\"Get it on Codeberg\" src=\"https://get-it-on.codeberg.org/get-it-on-blue-on-white.svg\" height=\"30\"></a></p>")))

       (list "org-site:static"
             :recursive t
             :base-directory "./content"
             :base-extension "pdf"
             :publishing-directory "./public"
             :publishing-function 'org-publish-attachment)))

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<style>html {margin:2ch;} body {max-width:70ch;padding:2ch;margin:auto;}</style>")

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
