;;; setup-appearance.el --- Appearance
;;; Commentary:
;;; Code:

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq custom-safe-themes t
      font-lock-maximum-decoration t
      truncate-partial-width-windows nil
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      use-file-dialog nil
      use-dialog-box nil
      visible-bell nil
      ring-bell-function 'ignore)

(setq initial-scratch-message "")

;; set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))
(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(or-protected
 (not (set-frame-font "Monaco 14"))
 (not (set-frame-font "Source Code Pro 14"))
 (not (set-frame-font "Inconsolata 12")))


(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;;; don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;;; highlight long lines
(use-package whitespace
  :hook (prog-mode . whitespace-mode)
  :config
  (setq whitespace-style '(face trailing lines-tail tabs))
  (setq whitespace-line-column nil))

;; change some colors for the diff-mode
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t
        sml/theme 'respectful)
  (sml/setup))

(global-hl-line-mode +1)
(set-face-background 'hl-line "#292b2e")

;; set cursor color
(set-cursor-color "#edac2c")

;; Initialize in full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;Beacon minor mode
(use-package beacon
  :ensure t
  :diminish beacon-mode
  :init
  (setq beacon-color "#edac2c")
  (setq beacon-size 25)
  (setq beacon-blink-delay 0.3)
  :config
  (beacon-mode 1))

(provide 'setup-appearance)
;;; setup-appearance.el ends here
