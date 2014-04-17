;;; init-martin --- This is Martin's config
;;; Commentary:
;;; Code:

;;; ----------------------------------------------------------------------------
;;; Start config
(server-start)

;; Key binds
 ; C-t 设置标记
(global-set-key (kbd "C-t") 'set-mark-command)

;; Set Shell
;(setq shell-file-name  "C:/Martin/tools/cygwin/bin/zsh.exe")

;;默认进入text-mode，而不是没有什么功能的fundamental-mode
(setq major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Disable menu bar & tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Disable ~ and # files
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;;显示行号
(global-linum-mode 1)
;; Highlight line
(global-hl-line-mode 1)

;; imenu-tree
(eval-after-load "tree-widget"
  '(if (boundp 'tree-widget-themes-load-path)
       (add-to-list 'tree-widget-themes-load-path "~/.emacs.d/")))
(autoload 'imenu-tree "imenu-tree" "Imenu tree" t)
(autoload 'tags-tree "tags-tree" "TAGS tree" t)

;; Display whitespaces
(whitespace-mode t)

;; Add repo for package.el
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
;; El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;; Font
;;; Setting English font
(set-face-attribute
 'default nil :font "Menlo 15")

;;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 20)))
;;; ----------------------------------------------------------------------------

;;iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))


;;Org && deft
;;;indent
(setq org-startup-indented t)
(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)))

;; Deft
;(require 'deft)
;(setq deft-directory "C:/Martin/backup/GoogleDrive/doc/note")
;(setq deft-extension "org")
;(setq deft-text-mode 'org-mode)
;(setq deft-use-filename-as-title t)
;(global-set-key [f8] 'deft)

;; Parentheses
;; highlight and config color
(require 'highlight-parentheses)
(highlight-parentheses-mode t)
(require 'paren-face)
(global-paren-face-mode t)


;;Proxy
;(setq url-proxy-services
;'(("no_proxy" . "localhost")
;  ("http" . "den-entbc-001:80")))

;; provide
(provide 'init-martin)

;;; init-martin ends here
