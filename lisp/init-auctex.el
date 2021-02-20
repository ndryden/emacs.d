;;; init-auctex.el --- Configure AUCTeX -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'auctex)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (when *is-a-mac*
    (setq TeX-view-program-list '(("Preview" "open %o")))
    (setq TeX-view-program-selection '((output-pdf "Preview"))))
  ;; Set up RefTeX.
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t))


(provide 'init-auctex)
;;; init-auctex.el ends here
