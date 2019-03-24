;; -*- coding: utf-8; lexical-binding: t; -*-

;;; setup-snippets --- Snippets
;;; Commentary:

;; ease your life with snippets

;;; Code:


(bk/install-maybe 'yasnippet)
(bk/install-maybe 'yasnippet-snippets)
(bk/install-maybe 'clojure-snippets)
(bk/install-maybe 'react-snippets)
(bk/install-maybe 'go-snippets)

(require 'yasnippet)

(yas-global-mode 1)

(require 'yasnippet-snippets)
(require 'clojure-snippets)
(require 'react-snippets)

;; inter-field navigation
(defun yas/goto-end-of-active-field ()
  "Go to the end of the active field."
  (interactive)
  (let* ((snippet (car (yas-active-snippets)))
         (position (yas--field-end (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))

(defun yas/goto-start-of-active-field ()
  "Go to the beginning of the active field."
  (interactive)
  (let* ((snippet (car (yas-active-snippets)))
         (position (yas--field-start (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))

(define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field)
(define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field)

;; jump to end of snippet definition
(define-key yas-keymap (kbd "<return>") 'yas-exit-all-snippets)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "C-M-<return>") 'yas-expand)


(setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))
(setq yas-verbosity 1)
(setq yas-wrap-around-region t)


;;; auto-yasnippet
(bk/install-maybe 'auto-yasnippet)


(provide 'setup-snippets)
;;; setup-snippets.el ends here
