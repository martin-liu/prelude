;;; M-package.el --- config about package
;;; Commentary:
;;; Code:

;; highlight-indentation, mainly for python, coffee
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(highlight-indentation-current-column-mode t)
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; color-theme, tomorrow theme
(disable-theme 'zenburn)
(load-theme 'sanityinc-tomorrow-eighties t)

;; ace-window, used to jump between windows
(setq aw-keys '(?d ?h ?t ?n ?s ?6 ?7 ?8 ?9))

;; pcre-mode
(pcre-mode 1)

;; helm-mode
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

;; back-button
(require 'back-button)
(back-button-mode 1)

;; Org export
(setq org-export-htmlize-output-type 'css)

;; Org auto completion
(require 'org-ac)
;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "org-ac")
(org-ac/config-default)

;;Org
;;;indent
(setq org-startup-indented t)
(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)
            (auto-fill-mode 1)))

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

;;; Programming
;;-----------------------------------------------------------
;; Yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))

;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on web-mode
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; multiple-cursors-mode
(require 'multiple-cursors)

;; emacs-eclim
;; (require 'eclim)
;; (require 'eclimd)
;; (custom-set-variables
;;  '(eclim-eclipse-dirs '("/Applications/eclipse"))
;;  '(eclim-executable "/Applications/eclipse/eclim")
;;  '(eclimd-default-workspace "~/martin/code/my/java/")
;;  '(eclim-auto-save t)
;;  '(eclim-print-debug-messages f))
;; (add-hook 'java-mode-hook '(lambda () (eclim-mode t)))

;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)

;; jdee

;;-----------------------------------------------------------
(provide 'm-package)
;;; m-package ends here
