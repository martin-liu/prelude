;;; m-preload --- This is Martin's preload config
;;; Commentary:
;;; Code:

;;Proxy
(if (equal system-type 'gnu/linux)
    (setq url-proxy-services
          '(("no_proxy" . "localhost")
            ("http" . "hualiu-9766.lvs01.dev.ebayc3.com:53"))))

;; provide
(provide 'init-martin)

;;; m-preload ends here
