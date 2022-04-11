;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)
(require 'solarized-theme)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(sanityinc-solarized-dark))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

;; Didn't end up working right...
;; Apply different theme for terminal or GUI (mostly for macOS issues).
;;(defun apply-term-or-gui-theme ()
;;  "Apply either a terminal or GUI theme."
;;  (if (display-graphic-p)
;;      (enable-theme 'sanityinc-solarized-dark)
;;    (enable-theme 'solarized-dark)))
;;
;;(add-hook 'after-init-hook 'apply-term-or-gui-theme)
;;(add-hook 'after-make-frame-functions 'apply-term-or-gui-theme)


;; Toggle between light and dark

(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(solarized-light))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(solarized-dark))
  (reapply-themes))


;;(when (maybe-require-package 'dimmer)
;;  (setq-default dimmer-fraction 0.15)
;;  (add-hook 'after-init-hook 'dimmer-mode)
;;  (with-eval-after-load 'dimmer
;;    ;; TODO: file upstream as a PR
;;    (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all))))
;;  (with-eval-after-load 'dimmer
;;    ;; Don't dim in terminal windows. Even with 256 colours it can
;;    ;; lead to poor contrast.  Better would be to vary dimmer-fraction
;;    ;; according to frame type.
;;    (defun sanityinc/display-non-graphic-p ()
;;      (not (display-graphic-p)))
;;    (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)))


(provide 'init-themes)
;;; init-themes.el ends here
