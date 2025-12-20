;;; init-cpp.el --- Configuration options C/C++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Old C/C++ modes:
;; Disable indentation for C++ namespaces.
(add-hook 'c++-mode-hook
          (lambda () (c-set-offset 'innamespace 0)))
(setq c-default-style "bsd"
      c-basic-offset 2)

;; Treesitter modes:
(setq c-ts-mode-indent-style 'bsd
      c-ts-mode-indent-offset 2)
;; Disable namespace indentation:
(add-hook 'c++-ts-mode-hook
          (lambda ()
            (push '((n-p-gp nil "declaration_list" "namespace_definition") parent-bol 0)
                  (alist-get 'cpp treesit-simple-indent-rules))))

(provide 'init-cpp)
;;; init-cpp.el ends here
