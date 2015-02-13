;;;p init-martin --- This is Martin's config
;;; Commentary:
;;; Code:

;;; Packages
;;; ----------------------------------------------------------------------------

;; Add repo for package.el
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))


;;; El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/personal/el-get-recipes")

(el-get 'sync)

;; require some packages
(prelude-require-packages '(highlight-indentation
                            highlight-parentheses
                            paredit
                            paren-face
                            color-theme-sanityinc-tomorrow
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
                            color-theme-sanityinc-tomorrow ; theme
                            ))

;;; ----------------------------------------------------------------------------

;; provide
(provide 'init-martin)

;;; init-martin ends here
