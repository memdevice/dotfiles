;;
;; LM init file -- 20210209 --
;;

;; random first, alea later
(random t) ; seed random number

;; time is an illusion, lunchtime doubly so

;; Format yyyy-mm-dd
;(format-time-string "%Y-%m-%d")
;; unix time
;(format-time-string "%s") ; "1291104066"

;;(insert (current-time-string))
;; funziona ma scrive sullo scratch, cancellenado il fortune

;; (insert (format-time-string "%s"))

;;  ___________________ UTF-8 ________________________________________


;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; e altro
;; (prefer-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
;; (if (boundp 'buffer-file-coding-system)
;;     (setq-default buffer-file-coding-system 'utf-8)
;;   (setq default-buffer-file-coding-system 'utf-8))

;; make unix lineendings default
(setq default-buffer-file-coding-system 'utf-8-unix)
;; Verify with C-h v buffer-file-coding-system.
;; It should say "global value is utf-8-unix".


;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

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

;; aggiungo la direcotry dei temi alla variabile specifica
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; NB:
;; per aggiungere le subdir guarda qui, in basso:
;; https://www.emacswiki.org/emacs/CustomThemes

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

;; ―――――――――――――――――――  LM emacs standard add on  ―――――――――――――――――――――――――――――

;; LM configurazioni di Emacs standard, senza installare pacakge
;; ovvero "emacs with batteeries included"...

;; Kill Other Buffers
;; Here is a simple function that kills all buffers, except the current one.
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

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

;; Here's a command to open a new empty buffer, without prompting for a name.

(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

It returns the buffer (for elisp programing).

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2017-11-01"
  (interactive)
  (let (($buf (generate-new-buffer "fourtytwo")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    $buf
    ))

;; reload emacs dofile (init.el) keybind
;; It would be handy to have a global key binding to reload .emacs
;; rather than go through the incredibly laborious process of
;; M-x load-file (delete a long string if I'm deep into some directory)
;;  ~/.emacs <RET>.
(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

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
;;     keybindings
;; ___________________________________________________________________

(load "~/.emacs.d/keybinding.el")

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

;; LM:________________________________________________________________
;;
;;     cose sperimentali da testare prima
;; ___________________________________________________________________

(load "~/.emacs.d/sandbox.el")

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

;; LM:________________________________________________________________

;; LM private or personal configuration
;; (load "~/.emacs.d/lm-config")

;; ___________________________________________________________________


;;    ________________________________________________________________
;; LM:
;;                             T h e   E n d
;; ___________________________________________________________________
