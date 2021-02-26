;;     init.el
;; LM :        2021-02-26 | 2021-057
;;     init.el

(random t)                          ;; random first, alea later
(setq inhibit-startup-message t)    ;; no startup screen, only scratch buffer
(tool-bar-mode -1)                  ;; no tool bar
;;(menu-bar-mode -1)                ;; no menu bar
(scroll-bar-mode -1)                ;; no scroll bar
(global-hl-line-mode t)             ;; highlight current line
(setq column-number-mode t)         ;; column number on
(setq-default word-wrap t)          ;; visual line mode on
(setq x-stretch-cursor t)           ;; block cursor as wide as the glyph under it
(show-paren-mode 1)                 ;; evidenzia le parentesi a coppie
(electric-pair-mode 1)              ;; auto close bracket insertion
(setq calendar-week-start-day 1)    ;; la settimana inizia di (l)unodì
(setq view-read-only t)             ;; M-x view-mode (C-c C-q = view-mode)
(defalias 'yes-or-no-p 'y-or-n-p)   ;; breviter
(setq-default fill-column 72)       ;; fill column: 72 (M-q)
(setq-default tab-width 4)          ;; reduce to four, default is eight
(setq-default indent-tabs-mode nil) ;; use spaces instead of tabs when indenting
;;(setq case-fold-search t)         ;; make searches case insensitive
(setq delete-by-moving-to-trash t)  ;; files deleted via Emacs are moved
                                    ;; to the Recycle Bin
(setq sentence-end-double-space nil);; sentences end with a single space.
                                    ;; this makes sentence navigation work
(ffap-bindings)                     ;; find-file-at-point:
                                    ;; smarter C-x C-f (point on path or URL)

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; ...before saving

(when (eq system-type 'windows-nt) (w32-send-sys-command 61488)) ;; -mm


;;(setq x-select-enable-clipboard t)
;; Make cut/copy/paste set/use the X CLIPBOARD in preference to the X PRIMARY. Unbreaks cut and paste between Emacs and well-behaved applications like Mozilla, KDE, and GNOME, but breaks cut and paste between Emacs and old applications like terminals.

(auto-compression-mode 1)           ;; abilita l'apertura di file compressi
                                    ;; and .dict files are UTF-8, so
;;(add-to-list 'file-coding-system-alist '("\\.dict\\'" . utf-8))


(setq frame-title-format '(
      "  ―――――  |  %b  |  EscMetaAltControlShift  42  | ――――――――――――――――― "
			   )) ;; (64 char)
;(setq frame-title-format '(" the ultimate...")) ;; alternative
;(setq frame-title-format "%b - emacs") ;; include buffer name in the title bar

;; (global-linum-mode 1)            ;; show line numbers everywhere
(set-cursor-color "black")          ;; cursor color

;; ―――――――――――――――――――  EOL mode line info ―――――――――――――――――――――――――――

;; mnemonic for utf-8 is "U", which is defined in the mule.el
(setq eol-mnemonic-unix ":[LF] ")
(setq eol-mnemonic-dos  ":[CRLF] ")
(setq eol-mnemonic-mac  ":[CR] ")
(setq eol-mnemonic-undecided ": [??] ")


;; ―――――――――――――――――――  directory e file  ――――――――――――――――――――――――――――

;; EMACS write config here...
(setq custom-file "~/.emacs.d/custom-file.el")
;; (load-file custom-file)             ;; sic
(ignore-errors (load custom-file)) ;; it may not yet exist...

;; ...and put backup files here...
(setq backup-directory-alist '(("" . "~/.backup/emacs")))

;;  ...looks here for personal elisp lib dir (package)...
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; EMACS looks here for fuctions...
(load "~/.emacs.d/functions.el")

;; ...and here for keybindings.
(load "~/.emacs.d/keybindings.el")

;; LISP code test here
(load "~/.emacs.d/sandbox.el")

;; frame appearence at start up here
;; (ignore-errors (load "~/.emacs.d/boot.el"))

;; LM private and data
(ignore-errors (load "~/.emacs.d/lm-data"))

;; aggiungo la directory dei temi alla variabile specifica
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; NB: per aggiungere le subdir guarda qui, in basso:
;; https://www.emacswiki.org/emacs/CustomThemes

;; ―――――――――――――――――――      unicode DB    ――――――――――――――――――――――――――――

;; Update emacs unicode data database
;;
;; download: https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt
;; Put that file in your emacs init dir. Put this in your emacs init file:
(when (file-exists-p "~/.emacs.d/UnicodeData.txt")
  (setq describe-char-unicodedata-file "~/.emacs.d/UnicodeData.txt"))

;; ―――――――――――――――――――      package       ――――――――――――――――――――――――――――

;; lorem ipsum etc.
(require 'lorem-ipsum)
(lorem-ipsum-use-default-bindings)

;; (require 'sinvirt)           ;; sinvirt!
;; (require 'mpwgen)            ;; genratore di password pronunciabili (by EXE)

;; using thesaurus offline in d:\home\dict
(require 'mthesaur)

;; word-count minor mode
;; word-count.el - Counting word for Emacsen.
;; cfr. https://github.com/tomaszskutnik/word-count-mode
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)

;; beacon
(require 'beacon)
(beacon-mode 1)                      ;; beacon on
;(setq beacon-push-mark 35)          ;;
;(setq beacon-color "#00008B")       ;;

;; mediawiki.el --- mediawiki frontend
;(require 'mediawiki.el)
;; Howto:
;;  M-x customize-group RET mediawiki RET
;;  *dink* *dink*
;;  M-x mediawiki-site RET Wikipedia RET
;;
;; Open a wiki file:    M-x mediawiki-open
;; Save a wiki buffer:  C-x C-s
;; Save a wiki buffer with a different name:  C-x C-w

;; columnize
(autoload 'columnize-text "columnize"
              "Formats a list of items into columns (pillars)" t)
;; `columnize-text' is an interactive autoload function for formatting words
;; numbers etc into an evenly spaced series of columns (pillars).  A trivial
;; wrapper `columnize-strings' similarly formats a list of quoted strings.
;;
;; See C-h f columnize-text <ret> for a complete description.
;;
;; 1) Put columnize.el on your load path.
;; 2) Put one of the following two lines in your .emacs
;;    (autoload 'columnize-text "columnize"
;;              "Formats a list of items into columns (pillars)" t)
;;    (load "columnize" nil t)
;;
;; Optionally add a key mapping like this.
;;    (global-set-key [?\C-x ?c] 'columnize-text)


;;  ___________________ cygwin shell _________________________________

;; LM: usare la bash di cygwin
;; da: https://www.masteringemacs.org/article/running-shells-in-emacs-overview
;;
(setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; ―――――――――――――――――――  fortune scratch   ――――――――――――――――――――――――――――

;; Supply a random fortune cookie as the *scratch* message.
;; (using internal function.el...)
 (when (executable-find "fortune")
   (setq initial-scratch-message
         (with-temp-buffer
           (shell-command "fortune" t)
           (let ((comment-start ";;"))
             (comment-region (point-min) (point-max)))
           (concat (buffer-string) "\n"))))

;; ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
