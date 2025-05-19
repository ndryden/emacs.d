;;; init-cpp.el --- Configuration options C/C++ -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Disable indentation for C++ namespaces.
(add-hook 'c++-mode-hook
          (lambda () (c-set-offset 'innamespace 0)))
(setq c-default-style "bsd"
      c-basic-offset 2)
(setq c-ts-mode-indent-style "bsd"
      c-ts-mode-indent-offset 2)

(provide 'init-cpp)
;;; init-cpp.el ends here
