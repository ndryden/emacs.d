;;; init-flymake.el --- Configure Flymake global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(maybe-require-package 'flymake "1.2.2")

;; Use flycheck checkers with flymake, to extend its coverage
;; (when (maybe-require-package 'flymake-flycheck)
;;   ;; Disable flycheck checkers for which we have flymake equivalents
;;   (with-eval-after-load 'flycheck
;;     (setq-default
;;      flycheck-disabled-checkers
;;      (append (default-value 'flycheck-disabled-checkers)
;;              '(emacs-lisp emacs-lisp-checkdoc emacs-lisp-package sh-shellcheck))))

;;   (add-hook 'flymake-mode-hook 'flymake-flycheck-auto)
;;   (add-hook 'prog-mode-hook 'flymake-mode)
;;   (add-hook 'text-mode-hook 'flymake-mode))

(add-hook 'prog-mode-hook 'flymake-mode)
(add-hook 'text-mode-hook 'flymake-mode)

;; For more convenient navigation.
(defun flymake-goto-next-error-only (&optional n interactive)
  "Go to Nth next Flymake error, skipping warnings.
If `flymake-wrap-around' is non-nil, wraps to top when reaching end."
  (interactive (list (prefix-numeric-value current-prefix-arg) t))
  (flymake-goto-next-error n '(:error) interactive))
(defun flymake-goto-prev-error-only (&optional n interactive)
  "Go to Nth previous Flymake error, skipping warnings.
If `flymake-wrap-around' is non-nil, wraps to bottom when reaching top."
  (interactive (list (prefix-numeric-value current-prefix-arg) t))
  (flymake-goto-prev-error n '(:error) interactive))

(with-eval-after-load 'flymake
  ;; Provide some flycheck-like bindings in flymake mode to ease transition
  (define-key flymake-mode-map (kbd "C-c ! l") 'flymake-show-buffer-diagnostics)
  (define-key flymake-mode-map (kbd "C-c ! n") 'flymake-goto-next-error-only)
  (define-key flymake-mode-map (kbd "C-c ! p") 'flymake-goto-prev-error-only)
  (define-key flymake-mode-map (kbd "C-c ! N") 'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "C-c ! P") 'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c ! l") 'flymake-show-buffer-diagnostics)
  (define-key flymake-mode-map (kbd "C-c ! c") 'flymake-start))

(unless (version< emacs-version "28.1")
  (setq eldoc-documentation-function 'eldoc-documentation-compose)

  (add-hook 'flymake-mode-hook
            (lambda ()
              (add-hook 'eldoc-documentation-functions 'flymake-eldoc-function nil t))))

(provide 'init-flymake)
;;; init-flymake.el ends here
