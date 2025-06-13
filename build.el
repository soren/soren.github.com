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
             :time-stamp-file nil)      ;; Don't include time stamp in file
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
      org-html-head "<style>body {max-width:70ch;margin:auto;padding:0 2ch 0 2ch;font-family:Sans-Serif;} .header {padding-top:2ex;padding-bottom:1ex;} .title {font-family:Serif;font-style:italic;font-size:250%;margin:0;border-bottom:1px solid;} .title + p {margin:.5ex 0 0 0;font-size:75%;} p.footer {margin-top: 4ex;border-top: 1px solid;padding-top: 1ex;font-style:italic;}</style>")

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
