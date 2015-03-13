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
(let ((font (if (equal system-type 'darwin) "M+ 1m" "Menlo")))
  (set-face-attribute
   'default nil :family font :height 180))

;; Line number
(global-linum-mode t)

;; fill-column
(setq-default fill-column 80)

;;Proxy
(setq url-proxy-services
'(("no_proxy" . "localhost")
  ("http" . "hualiu-9766.lvs01.dev.ebayc3.com:53")))
