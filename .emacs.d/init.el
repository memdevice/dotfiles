;;     init.el
;; LM :        2021-02-19 | 2021-050 | 1613749572
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
;;(setq case-fold-search t)         ;; make searches case insensitive
(setq delete-by-moving-to-trash t)  ;; files deleted via Emacs are moved to the Recycle Bin
(ffap-bindings)                     ;; find-file-at-point:
                                    ;; smarter C-x C-f (point on path or URL)

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; ...before saving

(setq frame-title-format '(
      "  ――――――  | EscMetaAltControlShift - 42   |  ――――――――――――――――― "
			   )) ;; (64 char)

;; ―――――――――――――――――――  directory e file  ――――――――――――――――――――――――――――

;; EMACS write config here...
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)             ;; sic

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

;; ―――――――――――――――――――      unicode       ――――――――――――――――――――――――――――

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
