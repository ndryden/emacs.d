;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; I use nix + direnv instead of virtualenv/pyenv/pyvenv, and it is an
;; approach which extends to other languages too. I recorded a
;; screencast about this: https://www.youtube.com/watch?v=TbIHRHy7_JM


(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(setq python-shell-interpreter "python3")

(require-package 'pip-requirements)
(require-package 'pyvenv)

(when (maybe-require-package 'flymake-ruff)
  (defun sanityinc/flymake-ruff-maybe-enable ()
    (when (executable-find "ruff")
      (flymake-ruff-load)))
  (add-hook 'python-mode-hook 'sanityinc/flymake-ruff-maybe-enable)
  (add-hook 'python-ts-mode-hook 'sanityinc/flymake-ruff-maybe-enable))

(when (maybe-require-package 'ruff-format)
  (add-hook 'python-mode-hook 'ruff-format-on-save-mode)
  (add-hook 'python-ts-mode-hook 'ruff-format-on-save-mode)
  (with-eval-after-load 'ruff-format (diminish 'ruff-format-on-save-mode)))

(when (maybe-require-package 'toml-mode)
  (add-to-list 'auto-mode-alist '("poetry\\.lock\\'" . toml-mode)))

;;(when (maybe-require-package 'reformatter)
;;  (reformatter-define black :program "black" :args '("-")))

;;(when (maybe-require-package 'lsp-mode)
;;  (require-package 'lsp-pyright)
;;  (add-hook 'python-mode-hook
;;            (lambda () (lsp))))

(provide 'init-python)
;;; init-python.el ends here
