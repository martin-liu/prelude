;;; martin-funcs --- This is Martin's costomize functions
;;; Commentary:
;;; This is Martin's Costomize functions

;;; Code:
;; 1. Append sexp's value
(defun m-eval-and-append-as-comment ()
  "Append the value of the preceding sexp as comment."
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (insert (format " ; => %S" value))))

;;; 2. Org insert color
(defun org-insert-with-color (color)
  "Insert a COLOR link to org buffer, it will be effective when export to html or latex."
  (interactive "sEnter the color you want to surround the text:")
  (insert (concat "[[color:" color "][]]"))
  (backward-char 2))

(defun org-insert-with-red ()
  "Insert red link"
  (interactive)
  (insert "[[code:#c7254e][]] ")
  (backward-char 3))

;;;; Org insert with color
(add-hook 'org-mode-hook
          (lambda ()
            ;; org-mode color
            (org-add-link-type
             "color" nil
             (lambda (path desc format)
               (cond
                ((eq format 'html)
                 (format "<span style=\"color:%s;\">%s</span>" path desc))
                ((eq format 'latex)
                 (format "{\\color{%s}%s}" path desc)))))
            ;; org-mode code
            (org-add-link-type
             "code" nil
             (lambda (path desc format)
               (cond
                ((eq format 'html)
                 (format "<span style=\"padding: 2px 4px;background-color: #f9f2f4;border-radius: 4px;color:%s;\">%s</span>" path desc))
                ((eq format 'latex)
                 (format "{\\color{%s}%s}" path desc)))))
            ;; org-mode highlight
            (org-add-link-type
             "hl" nil
             (lambda (path desc format)
               (cond
                ((eq format 'html)
                 (format "<font style=\"background-color:%s;\">%s</font>" path desc))
                ((eq format 'latex)
                 (format "\\colorbox{%s}{%s}" path desc))))) ;; require \usepackage{color}

            (local-set-key (kbd "C-c C-c") 'org-insert-with-red)
            ))

;;; Bind keys
(global-set-key "\C-cc" 'm-eval-and-append-as-comment)
(global-set-key "\C-q" 'goto-last-change)

(provide 'martin-funcs)

;;; martin-funcs.el ends here
