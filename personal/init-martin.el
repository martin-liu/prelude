;;; init-martin --- This is Martin's config
;;; Commentary:
;;; Code:

;;; Packages
;;; ----------------------------------------------------------------------------

;; Add repo for package.el
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))

;; require some packages
(prelude-require-packages '(color-theme-sanityinc-tomorrow
                            highlight-indentation
                            highlight-parentheses
                            paredit
                            paren-face
                            multiple-cursors
                            emmet-mode
                            lua-mode
                            org-ac
                            htmlize ; for highlight code when org mode export to html
                            markdown-mode
                            back-button
                            yasnippet
                            cider
                            cider-decompile
                            cider-spy
                            pcre2el ; pcre regexp
                            ;; typescript
                            tss
                            ace-jump-buffer
                            ))

;;; ----------------------------------------------------------------------------

;; provide
(provide 'init-martin)

;;; init-martin ends here
