;;; init-cpp.el --- Configuration options C/C++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Disable indentation for C++ namespaces.
(add-hook 'c++-mode-hook
          (lambda () (c-set-offset 'innamespace 0)))
(setq c-default-style "bsd"
      c-basic-offset 2)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode) . ("ccls"))))

;;(when (maybe-require-package 'lsp-mode)
;;  (require-package 'yasnippet)
;;  (require-package 'yasnippet-snippets)
;;  (require-package 'lsp-ui)
;;  (require-package 'ccls)
;;  (setq ccls-executable "ccls")
;;  (setq lsp-prefer-flymake nil)
;;  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
;;  ;; Set up Corfu completions.
;;  (setq lsp-completion-provider :none)
;;  (add-hook 'orderless-style-dispatchers (lambda (_pattern index _total) (and (eq index 0) 'orderless-flex)) nil 'local)
;;  (add-hook 'lsp-completion-mode (lambda () (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults)) '(orderless))))
;;  (setq lsp-enable-snippet nil)
;;  (add-hook 'c-mode-hook
;;            (lambda () (lsp)))
;;  (add-hook 'c++-mode-hook
;;            (lambda () (lsp)))
;;  (add-hook 'cuda-mode-hook
;;            (lambda () (lsp)))
;;  ;; Recommended lsp-mode performance optimization.
;;  (setq read-process-output-max (* 1024 1024))
;;  ;; Set up yasnippet mode.
;;  (add-hook 'c-mode-hook
;;            (lambda () (yas-minor-mode)))
;;  (add-hook 'c++-mode-hook
;;            (lambda () (yas-minor-mode)))
;;  (add-hook 'cuda-mode-hook
;;            (lambda () (yas-minor-mode)))
;;  ;; Add CUDA to lsp.
;;  (with-eval-after-load 'lsp-mode
;;    (add-to-list 'lsp-language-id-configuration '(cuda-mode . "cuda")))
;;  )


(provide 'init-cpp)
;;; init-cpp.el ends here
