;;
;; LM init file -- 20210209 -- 1612885245
;;

;; LM: random first, alea later
(random t) ; seed random number

;; LM:________________________________________________________________
;;
;;     architettura del file system
;; ___________________________________________________________________

;;  le configurazioni che emacs salva in autonomia (font etc.),
;;  non devono finire nel mio file init.el, ma in uno apposito
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)   ; necessario per essere sicuri che venga caricato

;;  niente backup file di emacs in giro, meglio tutti da una parte
(setq backup-directory-alist '(("" . "~/.backup/emacs")))

;;  Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; aggiungo la directory dei temi alla variabile specifica
;; NB: per aggiungere le subdir guarda qui, in basso:
;; https://www.emacswiki.org/emacs/CustomThemes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; LM function, progetto di configurazione di Emacs standard
(load "~/.emacs.d/function.el")

;; LM keybindings, sia associati alle funzioni sopra, sia indipendenti
(load "~/.emacs.d/keybinding.el")

;; LM sandbox (cose sperimentali da testare, prima di inserirle in init.el)
(load "~/.emacs.d/sandbox.el")

;; LM private or personal configuration and data
;; (load "~/.emacs.d/lm-config")

;; LM:________________________________________________________________
;;
;;     interazione utente i.e. "better default"
;; ___________________________________________________________________

;; no lock file (#filename.ext#)
;; (setq create-lockfiles nil)
;; LM: questi preferisco tenerli e cancellarli a mano
;;   finche' non trovo il modo di spostare anche questi altrove

;; breviter
(defalias 'yes-or-no-p 'y-or-n-p)

;;  delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;  dimensione della riga standard a 78 caratteri
(setq-default fill-column 72)    ; M-q per applicarla

;; Make kill/yank work with the X clipboard
;;(setq x-select-enable-clipboard t)
;;  LM  non sembra necessario...

;; View mode (M-x view-mode)
;;
;; Provide pager-like keybindings. Makes navigating read-only buffers a breeze.
;; Move down and up with SPC and delete (backspace) or S-SPC,
;; half a page down and up with d and u, and isearch with s.
(setq view-read-only t)   ; LM NB: il view-mode classico si attiva con C-c C-q

;; auto close bracket insertion.
;; typing any left bracket automatically insert the right matching bracket
(electric-pair-mode 1)

;; default incremental search: case insensitive
(setq case-fold-search t) ; make searches case insensitive

;;
;; Similarly, for replacing, the variable case-replace determines
;; whether replacements preserve case.
;; You can also toggle case sensitivity at will in isearch with M-c.

;; avvio condizionale del server, se non gia' attivo
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

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

;; LM:________________________________________________________________
;;
;;    package installed by hand
;; ___________________________________________________________________

;; lorem ipsum etc.
(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)

;; sinvirt!
;;(require 'sinvirt)

;; genratore di password pronunciabili by EXE
;; (require 'mpwgen)

;; word-count minor mode
;; cfr. https://github.com/tomaszskutnik/word-count-mode
;; word-count.el - Counting word for Emacsen.
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)

;;  ___________________ cygwin shell _________________________________

;; LM: usare la bash di cygwin
;; da: https://www.masteringemacs.org/article/running-shells-in-emacs-overview
;;
;; (setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
;; (setq shell-file-name "bash")
;; (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
;; (setenv "SHELL" shell-file-name)
;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; Supply a random fortune cookie as the *scratch* message.
;; (using internal function.el...)
 (when (executable-find "fortune")
   (setq initial-scratch-message
         (with-temp-buffer
           (shell-command "fortune" t)
           (let ((comment-start ";;"))
             (comment-region (point-min) (point-max)))
           (concat (buffer-string) "\n"))))
;;           (concat (buffer-string) "\n;"'(insert (current-time-string))"\n"))))


;; using thesaurus offline in d:\home\dict
(require 'mthesaur)

;; password pronunciabili
;; grazie Exedre!
;; (mpwgen)  ; visualizzane una in message buffer

;; LM:________________________________________________________________
;;
;;     interfaccia utente
;; ___________________________________________________________________

;; la settimana inizia di lunedí
(setq calendar-week-start-day 1)

;; visualizza le coppie di parentesi (in attesa di trovar di meglio)
(show-paren-mode 1)

;; Non-nil means draw block cursor as wide as the glyph under it.
;; For example, if a block cursor is over a tab, it will be drawn as
;; wide as that tab on the display.
(setq x-stretch-cursor t)

;; LM: always on word wrap / truncate long lines
(setq-default word-wrap t)
; (setq-default truncate-lines t)

;; Do not show the startup screen.
(setq inhibit-startup-message t)

;; Disable tool bar, menu bar, scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(menu-bar-mode -1)

;; mostra il numero di colonna, oltre al numero di riga
(setq column-number-mode t)

;; Highlight current line
(global-hl-line-mode t)


;; Time in the modeline - I like having the clock.
;; (display-time-mode 1)
;; LM allineato a dx e senza secondi centesimi etc.

;; NB: scelgo l'opzione alternativa ‘-fh’ ‘--fullheight’ da command line
;; finestra verticale quasi 4:3 (chars x lines)
;; (when window-system
;;  (set-frame-position (selected-frame) 42 42)
;;  (set-frame-size (selected-frame) 72 52))

;; da attivare se si preferisce partire con un file vuoto "fourthytwo"
;; invece che con lo scratch buffer (cfr. piu' sotto)
; (setq initial-buffer-choice 'xah-new-empty-buffer)

;; title bar
;;(setq frame-title-format '(" ――――――  |    EscMetaAltControlShift  42   |  ――――――――――――――――― ")); LM own (64 char)
(setq frame-title-format '(" ――――――  | EscMetaAltControlShift - 42   |  ――――――――――――――――― ")) ; LM own (64 char)

;;(setq frame-title-format '("%b"))
;; inserisce il nome del buffer, ma non riesco a integrarlo sopra


;; LM:________________________________________________________________
;;
;;     custom-themes installed by hand
;; ___________________________________________________________________

;; none

;; ___________________________________________________________________
;; LM:
;; LM:                            T h e   E n d
;; ___________________________________________________________________
