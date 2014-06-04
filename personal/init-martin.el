;;;p init-martin --- This is Martin's config
;;; Commentary:
;;; Code:

;;; ----------------------------------------------------------------------------
;;; Start config
(server-start)

;; Windows: Use windows key as Super key
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key
;; MAC: Use command key as M, option key as S
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Key binds
 ; C-t
(global-set-key (kbd "C-'") 'set-mark-command)

;; Disable ~ and # files
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; Setting font
(let ((font (if (equal system-type 'gnu/linux) "Ubuntu Mono" "Menlo")))
  (set-face-attribute
   'default nil :family font :height 180))

;; Line number
(global-linum-mode t)

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
