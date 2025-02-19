;; User name and email
(setq user-full-name "Valerio Formato")
(setq user-mail-address "valerio.formato@gmail.com")

;; ---------------------------------------------------------
;; Packages
;; ---------------------------------------------------------

(package-initialize)
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/") t)

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

(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil) (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)) 

(use-package lsp-ui
  :commands lsp-ui-mode
  :defer t
  :ensure t)
(use-package ccls
  :ensure t
  :defer t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))
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
(use-package lsp-treemacs
  :defer t
  :ensure t)

;;; This will enable emacs to compile a simple cpp single file without any makefile by just pressing [f9] key
(defun code-compile()
  (interactive)
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
	 (let ((file (file-name-nondirectory buffer-file-name)))
	   (format "%s -o %s %s"
		   (if (equal (file-name-extension file) "cpp") "g++" "gcc")
		   (file-name-sans-extension file)
		   file)))
    (compile compile-command)))
(global-set-key [f9] 'code-compile)
(set 'lsp-keymap-prefix "M-l")

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
