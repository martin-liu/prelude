;;; martin-funcs --- This is Martin's costomize functions
;;; Commentary:
;;; This is Martin's Costomize functions

;;; Code:
;; 1. Duplicate current line
    (defun duplicate-current-line (&optional n)
      "duplicate current line, make more than 1 copy given a numeric argument"
      (interactive "p")
      (save-excursion
        (let ((nb (or n 1))
    	  (current-line (thing-at-point 'line)))
          ;; when on last line, insert a newline first
          (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    	(insert "\n"))

          ;; now insert as many time as requested
          (while (> n 0)
    	(insert current-line)
    	(decf n)))))

;;; 2. Org insert color
(defun org-insert-with-color (color)
  "Insert a COLOR link to org buffer, it will be effective when export to html or latex."
  (interactive "sEnter the color you want to surround the text:")
  (insert (concat "[[color:" color "][]]"))
  (backward-char 2))

;;; Bind keys
(define-key global-map [C-M-down] 'duplicate-current-line)
(global-set-key "\C-q" 'goto-last-change)
;;;; Org
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
;; org-mode highlight
(org-add-link-type
 "hl" nil
 (lambda (path desc format)
  (cond
   ((eq format 'html)
    (format "<font style=\"background-color:%s;\">%s</font>" path desc))
   ((eq format 'latex)
    (format "\\colorbox{%s}{%s}" path desc))))) ;; require \usepackage{color}

(local-set-key (kbd "C-c C-c") 'org-insert-with-color)
))


(provide 'martin-funcs)

;;; martin-funcs.el ends here
