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
                            spaceline
                            ace-jump-buffer
                            highlight-indentation
                            highlight-parentheses
                            paredit
                            paren-face
                            multiple-cursors
                            emmet-mode
                            org-ac
                            htmlize ; for highlight code when org mode export to html
                            markdown-mode
                            back-button
                            yasnippet
                            pcre2el ; pcre regexp
                            which-key
                            use-package

                            restclient

                            ;;; Programming
                            ;; lua
                            lua-mode
                            ;; typescript
                            tss
                            ;; java
                            ;;emacs-eclim
                            ;; docker
                            dockerfile-mode
                            ;; scala
                            ensime
                            ;; clojure
                            cider
                            cider-decompile
                            cider-spy

                            ))

;;; ----------------------------------------------------------------------------

;; provide
(provide 'init-martin)

;;; init-martin ends here
