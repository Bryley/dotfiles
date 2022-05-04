(require 'package)

(setq package-archives '(
    ("melpa" . "https://melpa.org/packages/")
    ("org" . "https://orgmode.org/elpa/")
    ("elpa" . "https://elpa.gnu.org/packages/")
))

(package-initialize)

(setq use-package-always-ensure t)              ;; Always use :ensure by default

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
)
(eval-when-compile (require 'use-package))      ;; Use 'use-package'

(use-package evil
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil) ;; This will make tab work correctly in org mode
  (evil-mode t)
)
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init)
)

(defun bryley/org-mode-setup ()
  ;;(org-indent-mode)
  ;; (variable-pitch-mode t)
  (visual-line-mode t)
  ;;(globaldisplay-line-numbers-mode t)
)

(use-package org
  :init
  (setq org-startup-indented t) ;; Indenting is handled automatically by org
  :hook (org-mode . bryley/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
)

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
)

(use-package evil-org
  :after (evil org)
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :init
  (setq projectile-switch-project-action #'projectile-dired)
)

(use-package counsel-projectile
  :config (counsel-projectile-mode)
)

;;    (use-package lsp-mode
;;      :commands (lsp lsp-deferred)
;;      :hook (lsp-mode . efs/lsp-mode-setup)
;;      :init
;;      (setq lsp-keymap-prefix "SPC l")
;;      :config
;;      (lsp-enable-which-key-integration t)
;;    )
    (use-package lsp-mode
      :init
      ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
      (setq lsp-keymap-prefix "SPC l")
      :hook (
	      (python-mode . lsp)
	      (lsp-mode . lsp-enable-which-key-integration))
      :commands lsp
    )
  (use-package lsp-ui
    :after general
    :commands lsp-ui-mode
    :config
    :general
      (general-nmap
	:predicate 'lsp-mode
	      "K" 'lsp-ui-doc-glance)
      (general-nmap
	:predicate 'lsp-mode
	      "gs" 'lsp-signature-activate)
      (general-nmap
	:predicate 'lsp-mode
	      "gr" 'lsp-ui-peek-find-references)
      (general-nmap
	:predicate 'lsp-mode
	      "gd" 'lsp-ui-peek-find-definitions)
      )
  (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
  ;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package lsp-pyright
:ensure t
:hook (python-mode . (lambda ()
                        (require 'lsp-pyright)
                        (lsp))))  ; or lsp-deferred

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
)

(use-package general
  :config
  (general-evil-setup t)
)

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key)
)

(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t)
)

(use-package doom-modeline
  :config
  (doom-modeline-mode t)
)

(use-package which-key
  :init
  (setq which-key-idle-delay 0.3)
  :config
  (which-key-mode)
)

(use-package ivy
  :config
  (ivy-mode)
)

(use-package ivy-rich
  :init
  (ivy-rich-mode t)
)

(use-package counsel
:bind (("M-x" . counsel-M-x)
       ("C-x b" . counsel-ibuffer)
       ("C-x C-f" . counsel-find-file)
       :map minibuffer-local-map
       ("C-r" . 'counsel-minibuffer-history))
)

(use-package all-the-icons
  :config
  (unless (package-installed-p 'all-the-icons)
    (all-the-icons-install-fonts)
  )
)

;; (use-package scroll-on-jump)

;; (with-eval-after-load 'evil
;;   (scroll-on-jump-advice-add evil-undo)
;;   (scroll-on-jump-advice-add evil-redo)
;;   (scroll-on-jump-advice-add evil-jump-item)
;;   (scroll-on-jump-advice-add evil-jump-forward)
;;   (scroll-on-jump-advice-add evil-jump-backward)
;;   (scroll-on-jump-advice-add evil-ex-search-next)
;;   (scroll-on-jump-advice-add evil-ex-search-previous)
;;   (scroll-on-jump-advice-add evil-forward-paragraph)
;;   (scroll-on-jump-advice-add evil-backward-paragraph)
;;   (scroll-on-jump-advice-add evil-goto-mark)
;; 
;;   ;; Actions that themselves scroll.
;;   (scroll-on-jump-with-scroll-advice-add evil-goto-line)
;;   (scroll-on-jump-with-scroll-advice-add evil-scroll-down)
;;   (scroll-on-jump-with-scroll-advice-add evil-scroll-up)
;;   (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-center)
;;   (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-top)
;;   (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-bottom)
;; )

(setq inhibit-startup-message t)  ;; Removes the startup page

(scroll-bar-mode -1)              ;; Disables scrollbar
(tool-bar-mode -1)                ;; Disables tool-bar
(tooltip-mode -1)                 ;; Disables tooltips

(setq display-line-numbers-type 'visual)  ;; Use relative line numbers (visually shown)
(setq-default left-fringe-width  10)
  (global-display-line-numbers-mode t)                 ;; Enable line numbers

(setq scroll-margin 3)
(setq scroll-step 1)

(global-hl-line-mode t)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-S-V") 'clipboard-yank)

(nvmap :keymaps 'override :prefix "SPC"
       "SPC"   '(counsel-M-x :which-key "M-x")
       "f f"   '(projectile-find-file :which-key "Find file")
       "r" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :which-key "Reload emacs config")
       "p"     '(projectile-command-map :which-key "Projectile Commands")
       ;; "l"     '((lambda () (interactive) (lsp-command-map) :which-key "LSP Commands" :predicate '(lsp-mode))
)
(nvmap :keymaps 'override :prefix "SPC"
       "m *"   '(org-ctrl-c-star :which-key "Org-ctrl-c-star")
       "m +"   '(org-ctrl-c-minus :which-key "Org-ctrl-c-minus")
       "m ."   '(counsel-org-goto :which-key "Counsel org goto")
       "m e"   '(org-export-dispatch :which-key "Org export dispatch")
       "m f"   '(org-footnote-new :which-key "Org footnote new")
       "m h"   '(org-toggle-heading :which-key "Org toggle heading")
       "m i"   '(org-toggle-item :which-key "Org toggle item")
       "m n"   '(org-store-link :which-key "Org store link")
       "m o"   '(org-set-property :which-key "Org set property")
       "m t"   '(org-todo :which-key "Org todo")
       "m x"   '(org-toggle-checkbox :which-key "Org toggle checkbox")
       "m B"   '(org-babel-tangle :which-key "Org babel tangle")
       "m I"   '(org-toggle-inline-images :which-key "Org toggle inline imager")
       "m T"   '(org-todo-list :which-key "Org todo list")
       "o a"   '(org-agenda :which-key "Org agenda")
)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(set-frame-font "Hack Nerd Font 14" nil t)
  (set-face-attribute 'default nil
    :font "Hack Nerd Font 14"
    :weight 'medium
  )
