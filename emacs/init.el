
(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

;;
;;;; Essential options
;;(setq inhibit-startup-message t)
;;
;;(scroll-bar-mode -1)
;;(tool-bar-mode -1)
;;(tooltip-mode -1)
;;(set-fringe-mode 10)
;;
;;;; Package setup
;;(require 'package)
;;
;;(setq package-archives '(
;;("melpa" . "https://melpa.org/packages/")
;;("org" . "https://orgmode.org/elpa/")
;;("elpa" . "https://elpa.gnu.org/packages/")
;;))
;;
;;(package-initialize)
;;
;;(setq use-package-always-ensure t)              ;; Always use :ensure by default
;;
;;(unless (package-installed-p 'use-package)
;;(package-refresh-contents)
;;(package-install 'use-package)
;;)
;;(eval-when-compile (require 'use-package))      ;; Use 'use-package'
;;
;;;; Packages
;;(use-package evil
;;:init
;;(setq evil-want-integration t)
;;(setq evil-want-keybinding nil)
;;(setq evil-want-C-u-scroll t)
;;(setq evil-want-C-i-jump nil)
;;:config
;;(evil-mode 1)
;;(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;;(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
;;
;;;; Use visual line motions even outside of visual-line-mode buffers
;;(evil-global-set-key 'motion "j" 'evil-next-visual-line)
;;(evil-global-set-key 'motion "k" 'evil-previous-visual-line)
;;
;;(evil-set-initial-state 'messages-buffer-mode 'normal)
;;(evil-set-initial-state 'dashboard-mode 'normal))
;;
;;(use-package evil-collection
;;:after evil
;;:config
;;(evil-collection-init))
;;
;;(use-package helm
;;:bind (
;;("C-x b" . helm-buffers-list)
;;("C-x C-f" . helm-find-files)
;;("M-x" . helm-M-x)
;;)
;;:config
;;(helm-mode t)
;;)
;;
;;(use-package doom-themes
;;:config
;;(load-theme 'doom-vibrant t)
;;)
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(package-selected-packages
   ;; '(org-bullets scroll-on-jump general which-key use-package helm evil-collection doom-themes))
 ;; '(pixel-scroll-mode t))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(scroll-on-jump ivy which-key doom-modeline org-bullets doom-themes general evil-collection evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
