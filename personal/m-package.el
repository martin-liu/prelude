;;; M-package.el --- config about package
;;; Commentary:
;;; Code:

(eval-when-compile
  (require 'use-package))

;; highlight-indentation, mainly for python, coffee
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(highlight-indentation-current-column-mode t)
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; color-theme, tomorrow theme
(disable-theme 'zenburn)
(load-theme 'sanityinc-tomorrow-eighties t)

;; spaceline
(require 'spaceline-config)
(spaceline-emacs-theme)
(spaceline-toggle-minor-modes-off)

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

;; Org mode

(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)
            (setq org-startup-indented t)
            (auto-fill-mode 1)
            ;; highlight code
            (setq org-src-fontify-natively t)
            (org-display-inline-images)))

;;; Set default org file to store note
(setq org-default-notes-file "~/Dropbox/Martin/doc/GTD.org")
(setq org-agenda-files '("~/Dropbox/Martin/doc/"))

;;; Set org tag list
(setq org-tag-alist '(("@work" . ?w) ("@me" . ?m)))

;;; Quickly use C-c C to take note
(global-set-key (kbd "C-c C") 'org-capture)
;;; Setup capture template
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "" "Tasks") "* TODO %?\n %i\n")
        ("n" "NOTE" entry (file+headline "" "Notes") "* NOTE - %?\n %i\n %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/Martin/doc/journal.org")
         "* %U\n%?")))

;; Org export
(setq org-export-htmlize-output-type 'css)

;; Org auto completion
(require 'org-ac)
;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "org-ac")
(org-ac/config-default)



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
;; which-function-mode
(which-function-mode 1)
;; which-key-mode
(which-key-mode 1)

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


;;; Scheme
;; geiser
(setq geiser-active-implementations '(guile))

;;; Scala
;; ensime
(setenv "PATH" (concat "/usr/local/bin/sbt:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala:" (getenv "PATH")))
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(define-key company-active-map [tab] nil)


;;; Web
;; js2-mode
(custom-set-variables
 '(js2-basic-offset 2))

;; web-mode
(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)
            (setq web-mode-code-indent-offset 2)))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))

;;-----------------------------------------------------------
(provide 'm-package)
;;; m-package ends here
