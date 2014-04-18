;;; M-package.el --- config about package
;;; Commentary:
;;; Code:

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


;; highlight-indentation
(highlight-indentation-current-column-mode t)
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(provide 'm-package)
;;; m-package ends here
