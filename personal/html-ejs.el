;;; html-ejs --- Summary
;;; Commentary:
;;; Use mmm-mode to enable EJS (http://embeddedjs.com) Template highlighting in html-mode
;;; Code:

;; Turn on mmm-mode
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

;; mmm-mode class for EJS Templates
(mmm-add-classes
 '(
   (html-ejs :submode js-mode :front "<%[#=]?" :back "-?%>"
             :match-face (("<%#" . mmm-comment-submode-face)
                          ("<%=" . mmm-output-submode-face)
                          ("<%" . mmm-code-submode-face))
             :insert ((?% ejs-code nil @ "<%" @ " " _ " " @ "%>" @)
                      (?# ejs-comment nil @ "<%#" @ " " _ " " @ "%>" @)
                      (?= ejs-expression nil @ "<%=" @ " " _ " " @ "%>" @))
             )))

;;; Add html-js, embedded-css and html-ejs to html-mode
(mmm-add-mode-ext-class 'html-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-mode nil 'html-css)
(mmm-add-mode-ext-class 'html-mode nil 'html-ejs)

(provide 'html-ejs)
;;; html-ejs.el ends here
