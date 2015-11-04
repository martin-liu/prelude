;;; martin-funcs --- This is Martin's costomize functions
;;; Commentary:
;;; This is Martin's Costomize functions

;;; Code:
;; 1. Append sexp's value
(defun m-eval-and-append-as-comment ()
  "Append the value of the preceding sexp as comment."
  (interactive)
  ;; go to end of the line
  (end-of-line)
  ;; remove existing comment
  (comment-kill nil)
  ;; indent comment
  (comment-dwim nil)
  (cond ((eq 'clojure-mode major-mode)
         (progn
           (cider-eval-last-sexp 't)
           (insert " => ")
           ))
        (t (insert (format " => %S" (eval (preceding-sexp)))))))

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

            (local-set-key (kbd "C-c c") 'org-insert-with-red)
            ))

;;; 3. goto-last-change
(defvar m-last-change-pos1 nil)
(defvar m-last-change-pos2 nil)

(defun m-swap-last-changes ()
  (when m-last-change-pos2
    (let ((tmp m-last-change-pos2))
      (setf m-last-change-pos2 m-last-change-pos1
            m-last-change-pos1 tmp))))

(defun m-goto-last-change ()
  (interactive)
  (when m-last-change-pos1
    (let* ((buffer (find-file-noselect (car m-last-change-pos1)))
           (win (get-buffer-window buffer)))
      (if win
          (select-window win)
        (switch-to-buffer buffer))
      (goto-char (cdr m-last-change-pos1))
      (m-swap-last-changes))))

(defun m-buffer-change-hook (beg end len)
  (let ((bfn (buffer-file-name))
        (file (car m-last-change-pos1)))
    (when bfn
      (if (or (not file) (equal bfn file)) ;; change the same file
          (setq m-last-change-pos1 (cons bfn end))
        (progn (setq m-last-change-pos2 (cons bfn end))
               (m-swap-last-changes))))))

(add-hook 'after-change-functions 'm-buffer-change-hook)


;;; 4. narrow or widen
(defun m-narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
  Intelligently means: region, subtree, or defun, whichever applies first.

  With prefix P, don't widen, just narrow even if buffer is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode) (org-narrow-to-subtree))
        (t (narrow-to-defun))))

;;; Bind keys
(global-set-key "\C-cmc" 'm-eval-and-append-as-comment)
(global-set-key "\C-q" 'm-goto-last-change)
(global-set-key "\C-cmn" 'm-narrow-or-widen-dwim)

(provide 'martin-funcs)

;;; martin-funcs.el ends here
