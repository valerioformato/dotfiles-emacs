;; User name and email
(setq user-full-name "Valerio Formato")
(setq user-mail-address "valerio.formato@gmail.com")

;; ---------------------------------------------------------
;; Packages
;; ---------------------------------------------------------

(package-initialize)
(require 'package)

(add-to-list 'package-archives
    '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/") t)

(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(use-package magit
  :defer t
  :ensure t
  )

(use-package python
  :defer t
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  )

(use-package yaml-mode
  :defer t
  :ensure t
  )

;; ---------------------------------------------------------
;; C/C++
;; ---------------------------------------------------------
(use-package clang-format
  :defer t
  :ensure t
  :commands (clang-format-buffer clang-format-on-save-mode)
  :hook (c-mode c++-mode)
  :config
  (clang-format-on-save-mode))

(use-package company
  :defer t
  :ensure t
  :config (company-mode))

(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil) (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)) 

;; (add-hook 'c++-mode-hook 'lsp)
;; (add-hook 'c++-mode-hook 'company-mode)

(use-package lsp-ui
  :commands lsp-ui-mode
  :defer t
  :ensure t)


(use-package flycheck
  :defer t
  :ensure t)

(use-package yasnippet
  :defer t
  :ensure t
  :config (yas-global-mode))

(use-package which-key
  :defer t
  :ensure t
  :config (which-key-mode))

(use-package helm-lsp
  :defer t
  :ensure t)

(use-package helm
  :defer t
  :ensure t
  :config (helm-mode))

;; (use-package lsp-treemacs
;;   :defer t
;;   :ensure t)

(set 'lsp-keymap-prefix "M-l")
(set 'lsp-log-io t)

;; ---------------------------------------------------------
;; Themes
;; ---------------------------------------------------------

;; Adding nord-theme 
(add-to-list 'custom-theme-load-path (expand-file-name "~/.config/emacs/themes/nord-theme"))
(load-theme 'nord t)

;; Enable line numbers for  C modes
(add-hook 'c-mode-common-hook (lambda () (display-line-numbers-mode 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(clang-format yaml-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
