;;; init-spelling.el --- Spell check settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'jinx)
  (add-hook 'text-mode-hook 'jinx-mode)
  (add-hook 'LaTeX-mode-hook 'jinx-mode)
  ;; Force the language because the LANG env var is unreliable.
  (setq jinx-languages "en_US")
  (global-set-key (kbd "M-$") 'jinx-correct)
  (global-set-key (kbd "C-M-$") 'jinx-languages)

  (with-eval-after-load 'vertico
    (add-to-list 'vertico-multiform-categories
                 '(jinx grid (vertico-grid-annotate . 20))))
  (with-eval-after-load 'jinx (diminish 'jinx-mode)))

(provide 'init-spelling)
;;; init-spelling.el ends here
