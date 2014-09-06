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
                            paren-face
                            color-theme-sanityinc-tomorrow
                            emmet-mode
                            back-button))

;;; ----------------------------------------------------------------------------

;; provide
(provide 'init-martin)

;;; init-martin ends here
