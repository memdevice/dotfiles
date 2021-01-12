;;
;; LM init file -- 20210108
;;

;; LM: configurazioni fondamentali

;; niente backup file di emacs in giro,
;; meglio tutti da una parte (e non in ~/.emacs.d)
(setq backup-directory-alist '(("" . "~/.backup/emacs")))

;; le configurazioni che emacs salva in autonomia (font etc.),
;; non devono finire nel mio file init.el, ma in uno apposito
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)   ; necessario per essere sicuri che venga caricato...

;; LM: interfaccia utente

;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)

;; mostra anche il numero di colonna
(setq column-number-mode t)

;; LM: interazione utente

;; breviter
(defalias 'yes-or-no-p 'y-or-n-p)

;; LM: Word wrap always on: "visual line mode"
(setq-default word-wrap t)

;; LM: "better default"

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dimensione della riga standard a 78 caratteri
(setq-default fill-column 78)   ; M-q per applicarla

;; LM test rapido: configurazione standard vs. LM own

;; Use your name in the frame title. :)
;;
;;(setq frame-title-format (format " ――――――     %s's Emacs Emacs     ――――――――――― " (capitalize user-login-name))) ; standard
(setq frame-title-format (format " ――――――  |    EscMetaAltControlShift  42   |  ―――――――――――――――――― ")) ; LM own (64 char)
