;;; init-spelling.el --- Spell check settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'jinx)
  (add-hook 'text-mode-hook 'jinx-mode)
  (add-hook 'LaTeX-mode-hook 'jinx-mode)
  (global-set-key (kbd "M-$") 'jinx-correct)
  (global-set-key (kbd "C-M-$") 'jinx-languages)

  (add-to-list 'vertico-multiform-categories
               '(jinx grid (vertico-grid-annotate . 20))))

(provide 'init-spelling)
;;; init-spelling.el ends here
