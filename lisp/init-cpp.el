;;; init-cpp.el --- Configuration options C/C++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'lsp-mode)
  (require-package 'lsp-ui)
  (require-package 'ccls)
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  (add-hook 'c-mode-hook
            (lambda () (lsp)))
  (add-hook 'c++-mode-hook
            (lambda () (lsp)))
  (add-hook 'cuda-mode-hook
            (lambda () (lsp)))
  ;; Recommended lsp-mode performance optimization.
  (setq read-process-output-max (* 1024 1024))
  ;; Disable indentation for C++ namespaces.
  (add-hook 'c++-mode-hook
            (lambda () (c-set-offset 'innamespace 0))))


(provide 'init-cpp)
;;; init-cpp.el ends here
