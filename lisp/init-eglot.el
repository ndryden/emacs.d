;;; init-eglot.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'eglot)
  (maybe-require-package 'consult-eglot)
  (maybe-require-package 'yasnippet)
  (with-eval-after-load 'eglot (yas-minor-mode)))

(with-eval-after-load 'abbrev (diminish 'abbrev-mode))
(with-eval-after-load 'eldoc (diminish 'eldoc-mode))

(defun eglot-restart ()
  "Restart Eglot for the current buffer.
This function shuts down any running Eglot server for the current buffer
and then starts a new one."
  (interactive)
  (when (eglot-current-server)
    (eglot-shutdown))
  (eglot))

(provide 'init-eglot)
;;; init-eglot.el ends here
