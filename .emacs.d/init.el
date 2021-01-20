;;
;; LM init file -- 20210115
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

;; Disable tool bar, menu bar, scroll bar
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)

;; mostra anche il numero di colonna
(setq column-number-mode t)

;; LM: Word wrap always on: "visual line mode"
;; (setq-default word-wrap t)
(setq-default truncate-lines t)

;; Highlight current line
(global-hl-line-mode t)

;; Time in the modeline - I like having the clock.
(display-time-mode 1)

;; finestra verticale quasi 4:3 (chars x lines)
(when window-system
;  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 72 52))
;; NB: alternativa l'opzione ‘-fh’ ‘--fullheight’ da command line

;; LM test rapido: configurazione standard vs. LM own

;; (setq  frame-title-format (format "%s's Emacs" (capitalize user-login-name)))
;; (setq frame-title-format (format " ――――――     %s's Emacs Emacs     ――――――――――― " (capitalize user-login-name))) ; standard
(setq frame-title-format (format " ――――――  |    EscMetaAltControlShift  42   |  ―――――――――――――――――― ")) ; LM own (64 char)


;;  ――――――――――――― LM: interazione utente i.e. "better default"  ――――――――――――――

;; breviter
(defalias 'yes-or-no-p 'y-or-n-p)

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dimensione della riga standard a 78 caratteri
(setq-default fill-column 72)    ; M-q per applicarla

;; Make kill/yank work with the X clipboard
;;(setq x-select-enable-clipboard t)
;;  LM  non sembra necessario...

;; View mode (M-x view-mode)

;; Provide pager-like keybindings. Makes navigating read-only buffers a breeze.
;; Move down and up with SPC and delete (backspace) or S-SPC,
;; half a page down and up with d and u, and isearch with s.

(setq view-read-only t)   ; LM NB: il view-mode classico si attiva con C-c C-q

;; Kill Other Buffers
;; Here is a simple function that kills all buffers, except the current one.
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; ――――――――――――――――――― LM interazione con utente (completamento) ―――――――――――――

;;find-file-at-point, smarter C-x C-f when point on path or URL
(ffap-bindings)

;; Minibuffer completion styles (C-h v completion-styles) The minibuffer can
;; match by substrings, regexps, initials and even (as of Emacs 27+) fuzzily,
;; and it can do all of them at once if you don’t mind a giant pile of
;; matches.

;; (setq completion-styles '(initials partial-completion flex)) ; > Emacs 27.1
;; (setq completion-cycle-threshold 10)

;; Fake Ido ( M-x fido-mode)
;; Improves the other half of the default minibuffer experience: interacting
;; with selection candidates. Navigating to, from and inside the default
;; completions buffer takes too many key presses. fido-mode brings ido like
;; selection to every command in Emacs that uses completing-read, which is
;; most of them.
;; NB: fido mode e' alternativo a icomplete mode (

;; (setq fido-mode t) ; LM o lo abiliti a mano con "M-x fido-mode"
;; C-s/C-r per navigare tra i candidati, C-j per approvare la scelta

;; ―――――――――――――――――――  LM emacs standard add on  ―――――――――――――――――――――――――――――

;; LM configurazioni di Emacs standard, senza installare pacakge
;; (emacs with batteeries included)

;; recentf on --- keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 256)
(setq recentf-max-menu-items 42)


;; This calls another custom command of mine, revert-this-buffer. It does
;; exactly what the name implies: it reverts (reloads from file) the current
;; buffer without asking any questions. It will notify you in the minibuffer
;; area that it did it. (da https://www.masteringemacs.org/)

(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

;; ―――――――――――――――――――     LM keybind      ―――――――――――――――――――――――――――――

;; better keybindings
;; cfr: https://www.masteringemacs.org/article/my-emacs-keybindings

;; <F1> M-x shell (basta C-h per l'help!)
;; (global-set-key [f1] 'shell) ; F1

;; <F2> M-x rgrep (lo split windows si puo' fare con C-x 6)
;;(global-set-key [f2] 'xxxxxxxxx) ; F2

;; recentf on: file aperti di recente (M-x recentf-open-files)
(global-set-key (kbd "<f5>") 'recentf-open-files)      ;   F5

;; <F6> revert-this-buffer (reload from file)
(global-set-key [f6] 'revert-this-buffer) ; F6

;; kill other buffer (elimina tutti tranne quello corrente)
;; forse sarebbe meglio usare un keybinding diverso (<F8>?)
;; (global-set-key (kbd "C-x C-b") 'kill-other-buffers)   ; C-x C-b
(global-set-key [f8] 'kill-other-buffers) ; F8

;; LMNB: "current" e non "this"!
;; cfr: https://stackoverflow.com/questions/6467002/how-to-kill-buffer-in-emacs-without-answering-confirmation
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; ―――――――――――――― LM custom-themes installed by hand  ―――――――――――――――――――――――――

;; aggiungo la direcotry dei temi alla variabile specifica
;;
;; per aggiungere le subdir guard qui, in basso:
;; https://www.emacswiki.org/emacs/CustomThemes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; ――――――――――――――――― LM package installed by hand  ―――――――――――――――――――――――――

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; lorem ipsum etc.
(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)
;;
;; Key Binding 	Function
;; C-c l p 	lorem-ipsum-insert-paragraphs
;; C-c l s 	lorem-ipsum-insert-sentences
;; C-c l l 	lorem-ipsum-insert-list

;; sinvirt!
;;(require 'sinvirt)

;; LM private and personal configuration
;; (load "~/.emacs.d/myconfig")


;;  UTF-8

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
;; (if (boundp 'buffer-file-coding-system)
;;     (setq-default buffer-file-coding-system 'utf-8)
;;   (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; make unix lineendings default
(setq-default buffer-file-coding-system 'utf-8-unix)
;; Verify with C-h v buffer-file-coding-system. It should say "global value is utf-8-unix".
