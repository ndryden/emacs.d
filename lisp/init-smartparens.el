;;; init-smartparens.el --- Configure smartparens -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'smartparens)

(require 'smartparens-config)

(smartparens-global-mode 1)

(with-eval-after-load 'smartparens (diminish 'smartparens-mode))

;; Enable in minibuffer:
(add-hook 'minibuffer-setup-hook 'my/conditionally-enable-smartparens-mode)

(defvar smartparens-minibuffer-commands '(eval-expression
                                          pp-eval-expression
                                          eval-expression-with-eldoc
                                          ibuffer-do-eval
                                          ibuffer-do-view-and-eval)
  "Interactive commands for which smartparens should be enabled in the minibuffer.")

(defun my/conditionally-enable-smartparens-mode ()
  "Enable smartparens during lisp-related minibuffer commands."
  (when (memq this-command smartparens-minibuffer-commands)
    (smartparens-mode 1)))

(provide 'init-smartparens)

;;; init-smartparens.el ends here
