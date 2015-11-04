;;; m-keybinding
;;; Commentary:
;;; Code:

;;; Packages
;;; -----------------------------------------------------------------------

;;; Global key-bindings
;; basic
(global-set-key (kbd "s-}") 'forward-paragraph)
(global-set-key (kbd "s-{") 'backward-paragraph)

;; simple-mode, (for basci editing)
(global-set-key (kbd "\C-cmo") 'just-one-space)

;; helm-mode
;; helm keys
(global-set-key (kbd "\C-ci") 'helm-imenu)
(global-set-key (kbd "\C-c\C-g") 'helm-do-grep)

;; ace-window
(global-set-key (kbd "C-x o") 'ace-window)

;; ace-jump
(global-set-key (kbd "s-<") 'ace-jump-word-mode)
(global-set-key (kbd "s->") 'ace-jump-buffer)
(global-set-key (kbd "\C-cJ") 'ace-jump-buffer)
(global-set-key (kbd "\C-cj") 'imenu)

;; multiple-cursors
(global-set-key (kbd "\C-cmm") 'mc/mark-all-symbols-like-this-in-defun)
(global-set-key (kbd "\C-cmM") 'mc/mark-all-symbols-like-this)

;; martin
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/Dropbox/Martin/doc/note/fragments.org")))

;;; -----------------------------------------------------------------------

;;; Hook key-bindings
;; coffee-mode
(add-hook 'coffee-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-r" 'coffee-indent-shift-right)
             (local-set-key "\C-c\C-l" 'coffee-indent-shift-left)
             ))

;; smartparens-mode
(add-hook 'smartparens-mode-hook
          '(lambda ()
             (local-set-key "\C-c\M-w" 'sp-backward-copy-sexp)
             (local-set-key (kbd "C-M-<backspace>") 'sp-backward-kill-sexp)))

;; cider-repl-mode
(add-hook 'cider-repl-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-p" 'cider-repl-previous-input)
             (local-set-key "\C-c\C-n" 'cider-repl-next-input)))

;;; -----------------------------------------------------------------------

;; Provide
(provide 'm-keybinding)

;;; init-martin ends here
