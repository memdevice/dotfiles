;; ―――――――――――――――――――     LM defaults     ―――――――――――――――――――――――――――――

;; Disabilita l'auto-save!

;; Visual Line Mode on
(global-visual-line-mode t)

;; recentf on --- keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 512)
(setq recentf-max-menu-items 64)

;; da verificare...
(prefer-coding-system 'utf-8)

;; aggiungo al load-path la directory dei package installati a mano

(add-to-list 'load-path "~/.emacs.d/lisp")

;; ―――――――――――――――――――     LM keybind      ―――――――――――――――――――――――――――――

;;file aperti di recente (M-x recentf-open-files)
(global-set-key (kbd "<f5>") 'recentf-open-files)      ;   F5

;;;;
;;(global-set-key (kbd "<f9>") 'whitespace-mode)

;; ――――――――――――――――――― Use better defaults ―――――――――――――――――――――――――――――

;;find-file-at-point, smarter C-x C-f when point on path or URL
(ffap-bindings)


;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight current line.
(global-hl-line-mode t)

;; Display column number in mode line.
(column-number-mode t)

;; Delete whitespace just when a file is saved.
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

 ;; Use your name in the frame title. :)
(setq  frame-title-format (format "%s's Emacs" (capitalize user-login-name)))

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Do not put 'customize' config in init.el; give it another file.
(setq  custom-file "~/.emacs.d/custom-file.el")

;; Assuming that the code in custom-file is execute before the code
;; ahead of this line is not a safe assumption. So load this file
;; proactively.
(load-file custom-file)

 ;; Emacs can automatically create backup files. This tells Emacs to put all backups in
 ;; ~/.emacs.d/backups. More info:
 ;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq  backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Delete whitespace just when a file is saved.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Require and initialize `package`.
;;(require 'package)
;;(package-initialize)

;; Add `melpa` to `package-archives`.
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Use the `spacemacs-dark` theme.
;;(load-theme 'spacemacs-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Auto-wrap at 80 characters
;;(setq-default auto-fill-function 'do-auto-fill)
;;(setq-default fill-column 80)
;;(turn-on-auto-fill)
;; Disable auto-fill-mode in programming mode
;;(add-hook 'prog-mode-hook (lambda () (auto-fill-mode -1)))

;; Non-nil means draw block cursor as wide as the glyph under it.
;; For example, if a block cursor is over a tab, it will be drawn as
;; wide as that tab on the display.
;; (setq x-stretch-cursor t)

;; ――――――――――――――――― LM package installed by hand  ―――――――――――――――――――――――――

;; lorem ipsum etc.
(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)
;;
;; Key Binding 	Function
;; C-c l p 	lorem-ipsum-insert-paragraphs
;; C-c l s 	lorem-ipsum-insert-sentences
;; C-c l l 	lorem-ipsum-insert-list

(require 'sinvirt)
