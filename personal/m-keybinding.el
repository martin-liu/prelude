;;; m-keybinding
;;; Commentary:
;;; Code:

;;; Packages
;;; -----------------------------------------------------------------------

;;; Global key-bindings
;; simple-mode, (for basci editing)
(global-set-key (kbd "\C-cmo") 'just-one-space)

;; helm-mode
;; helm keys
(global-set-key (kbd "\C-cj") 'helm-imenu)
(global-set-key (kbd "\C-c\C-g") 'helm-do-grep)

;; ace-jump
(global-set-key (kbd "s-<") 'ace-jump-word-mode)

;; martin
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/Dropbox/Martin/doc/note/fragments.org")))

;;; -----------------------------------------------------------------------

;;; Hook key-bindings
;; coffee-mode
(add-hook 'coffee-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-r" 'coffee-indent-shift-right)
             (local-set-key "\C-c\C-l" 'coffee-indent-shift-left)
             ))

;;; -----------------------------------------------------------------------

;; provide
(provide 'm-keybinding)

;;; init-martin ends here
