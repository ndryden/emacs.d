;;; init-eglot.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'eglot)
  (maybe-require-package 'consult-eglot)
  (maybe-require-package 'yasnippet)
  (with-eval-after-load 'eglot (yas-minor-mode)))

(with-eval-after-load 'abbrev (diminish 'abbrev-mode))
(with-eval-after-load 'eldoc (diminish 'eldoc-mode))

(provide 'init-eglot)
;;; init-eglot.el ends here
