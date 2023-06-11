(defmacro zanm-package (package &rest args)
  `(progn
     (unless (package-installed-p ',package)
       (package-install ',package))
     (require ',package)
     ,@args))


;; Seperate out custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error)


;; Add a directory for init modules
(add-to-list 'load-path "~/.emacs.d/emacs-init-modules")


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; Basic UI stuff

(toggle-frame-fullscreen)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
		eshell-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode -1))))

(setq visible-bell t)
(setq vc-follow-symlinks t)
(add-hook 'Info-mode-hook 'visual-line-mode) ; get word wrap on all help docs
(setq initial-scratch-message nil)

;; Autosave and backup
(setq kill-buffer-delete-auto-save-files t)
(setq make-backup-files nil)

;; To extend the authinfo hiding of passwords to other stuff
(setq authinfo-hidden (rx (or "password"
			      "client-id"
			      "client-secret"
			      "refresh-token")))


;; Packages

(zanm-package diminish)

(zanm-package which-key)
(which-key-mode)
(diminish 'which-key-mode)
(which-key-setup-minibuffer) ; to help with echo area covering which-key

(zanm-package eglot)
(add-hook 'python-mode-hook 'eglot-ensure)

(require 'text-property-search) ; Potential short term workaround for eglot

(zanm-package corfu)
(setq corfu-auto t)
(global-corfu-mode)

;; (use-package pcmpl-args) ; this probably isn't doing anything...?

(zanm-package git-gutter)
(diminish 'git-gutter)
(add-hook 'prog-mode-hook 'git-gutter-mode)
(setq git-gutter:update-interval 0.02)

(zanm-package git-gutter-fringe)
(define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)

(setenv "WORKON_HOME" "~/.venvs/")
(zanm-package pyvenv)
(define-key global-map (kbd "C-c v") 'pyvenv-workon)

(zanm-package magit)
(setq magit-repository-directories
      '(("~/" . 1)
	("~/.emacs.d/" . 1)
	("~/orghome/" . 1)
	("~/codehome/python/projects/" . 1)))

;; Themes
(zanm-package ef-themes)
(load-theme 'ef-cherie :no-confirm)


;; Load init modules

(require 'zan-email)

(require 'zan-org-capture)

(require 'zan-org-functions)
