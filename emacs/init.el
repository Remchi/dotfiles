(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	      ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; PACKAGES

;; SWITCH KEYS FOR C-X
(keyboard-translate ?\C-n ?\C-x)
(keyboard-translate ?\C-x ?\C-n)
(keyboard-translate ?\C-i ?\C-c)
(keyboard-translate ?\C-c ?\C-i)

;; BASIC SETTINGS
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(electric-indent-mode t)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(when (window-system)
  (tooltip-mode -1)
  ;;(menu-bar-mode -1)
  (set-fringe-style -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))
(electric-pair-mode t)
(electric-indent-mode t)
(setq-default cursor-type 'bar)
(global-visual-line-mode t)
(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)

;; SAVEPLACE
(save-place-mode 1)

;; AVY
(avy-setup-default)
(global-set-key (kbd "M-;") 'avy-goto-char)

;; ORG-MODE
(setq org-startup-indented t)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-src-tab-acts-natively t)
(setq org-agenda-files '("~/Dropbox/Org/notes.org"))


;; HELM
;;(require 'helm-config)
;;(helm-mode 1)

;; IVY
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key "\C-s" 'swiper)
(setq projectile-completion-system 'ivy)
(setq ivy-re-builders-alist
      '((swiper . ivy--regex-plus)
        (t      . ivy--regex-fuzzy)))

;; JAVASCRIPT
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(setq js-indent-level 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)

;; VUE
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))

;; EDITING HELPERS
(global-set-key (kbd "M-RET") 'line-above)
(defun line-above()
  "Inserts line above current one"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

;; NEO TREE
(global-set-key (kbd "M-\\") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(require 'all-the-icons)

;; PROJECTILE
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; EXPAND REGION
(require 'expand-region)
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "C-O") 'er/mark-html-attribute)
(global-set-key (kbd "C-M-o") 'er/mark-inner-tag)
(global-set-key (kbd "C-M-O") 'er/mark-outer-tag)

;; Swap command with alt
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(org-capture-templates
   (quote
    (("c" "Code block" plain
      (file+headline "~/Dropbox/Org/notes.org" "Notes")
      "
#+BEGIN_SRC %^{language}
%i
#+END_SRC

 %?")
     ("n" "Note" plain
      (file+headline "~/Dropbox/Org/notes.org" "Notes")
      ""))))
 '(package-selected-packages
   (quote
    (markdown-mode expand-region ivy projectile all-the-icons neotree vue-mode js2-mode helm popup avy dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Input Mono" :foundry "FBI " :slant normal :weight normal :height 120 :width normal)))))
