;; -*- coding: utf-8 -*-

;; (global-set-key (kbd "<s-return>") 'ansi-term)

;; (setq kill-ring-max 100) ;; default is 60

;; (w32-send-sys-command 61490) ;; -mm in Win32 (if other methods fails...)

;; --------------------------------------


(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
;; (set-selection-coding-system 'utf-8-unix) ;; to leave Windows use UTF-16
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding
(set-keyboard-coding-system 'utf-8-unix)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; --------------------------------------

;; mnemonic for utf-8 is "U", which is defined in the mule.el
;; (setq eol-mnemonic-dos ":CRLF ")
;; (setq eol-mnemonic-mac ":CR ")
;; (setq eol-mnemonic-undecided ":?? ")
;; (setq eol-mnemonic-unix ":LF ")
;;
;; (setq eol-mnemonic-dos ":[CRLF] ")
;; (setq eol-mnemonic-mac ":[CR] ")
;; (setq eol-mnemonic-undecided ":[??] ")
;; (setq eol-mnemonic-unix ":[LF] ")

;; (setq-default buffer-file-coding-system 'utf-8-unix)
;; (setq-default default-buffer-file-coding-system 'utf-8-unix)
;; (set-default-coding-systems 'utf-8-unix)

;;(set-language-environment "UTF-8") ;; UTF-8 as default encoding
;; (setq default-buffer-file-coding-system 'utf-8-unix)
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8-unix)
;;(prefer-coding-system 'utf-8-unix)



;; ------------ UTF-8 coding sistem and termination line -------------

;; To see invisible characters, you can try whitespace-mode. Spaces and tabs will be displayed with a symbol in a different face. If the coding system is automatically being detected as dos (showing (DOS) on the status bar), carriage returns at the end of a line will be hidden as well. Run revert-buffer-with-coding-system to switch it to Unix or binary (e.g. C-x RET r unix) and they'll always show up as ^M. The binary coding system will display any non-ASCII characters as control characters as well.


;; IMPOSTA IL CODING SYSTEM PER UN FILE

;; C-x RET f

;; Il coding system definisce volendo anche l'EOL!
;;
;; M-x lset-buffer-file-coding-system unix
;; M-x set-buffer-file-coding-system dos

;; List emacs file encoding systems
;;
;; Alt+x list-coding-systems

;; How to find out what encoding system was used to decode current file
;;
;; C-h v buffer-file-coding-system (mostra il valoro corrente per il buffer)
;; Alt+x describe-coding-system

;; How to set a encoding system for saving file
;;
;; Alt+x set-buffer-file-coding-system, then type the encoding system you want.
;; Press Tab to see a list of possible values.

;; How to open file with specific encoding
;;
;; Open it normally, then
;; Alt+x revert-buffer-with-coding-system, then type a coding system.
;; Press Tab to list possible ones.

;; C-h C RET
;; M-x describe-current-coding-system



;;(set-language-environment "UTF-8") ;; UTF-8 as default encoding

;;(set-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (set-locale-environment "en.UTF-8")
;; (prefer-coding-system 'utf-8)

;; (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
;; (set-language-environment 'utf-8)
;; ;;(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
;; (setq locale-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)



;; (add-to-list 'file-coding-system-alist '("\\.tex" . utf-8-unix) )
;; (add-to-list 'file-coding-system-alist '("\\.txt" . utf-8-unix) )
;; (add-to-list 'file-coding-system-alist '("\\.el" . utf-8-unix) )
;; (add-to-list 'file-coding-system-alist '("\\.scratch" . utf-8-unix) )
;; (add-to-list 'file-coding-system-alist '("user_prefs" . utf-8-unix) )

;; (add-to-list 'process-coding-system-alist '("\\.txt" . utf-8-unix) )

;; (add-to-list 'network-coding-system-alist '("\\.txt" . utf-8-unix) )

;; (add-to-list 'file-coding-system-alist '("\\.org" . utf-8-unix) )

;; (prefer-coding-system 'utf-8-unix)
;; (set-default-coding-systems 'utf-8-unix)
;; (set-terminal-coding-system 'utf-8-unix)
;; (set-keyboard-coding-system 'utf-8-unix)
;; (set-selection-coding-system 'utf-8-unix)
;; (setq-default buffer-file-coding-system 'utf-8-unix)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; (setq-default buffer-file-coding-system 'utf-8-unix)
;; (setq-default default-buffer-file-coding-system 'utf-8-unix)
;; (set-default-coding-systems 'utf-8-unix)
;; (prefer-coding-system 'utf-8-unix)



;; NON MI PIACE L'UNDECIDED...

;; (defun dos2unix ()
;;   "Convert a DOS formatted text buffer to UNIX format"
;;   (interactive)
;;   (set-buffer-file-coding-system 'undecided-unix nil))

;; (defun unix2dos ()
;;   "Convert a UNIX formatted text buffer to DOS format"
;;   (interactive)
;;   (set-buffer-file-coding-system 'undecided-dos nil))


;; FUNZIONANO BENE ENTRAMBI
;;(message-box ".emacs.el says hello")

;;(animate-birthday-present user-full-name)

;; ELIMINATO PERCHE' AGGIUNGE CENTESIMI
;;(setq display-time-24hr-format t)
;;(setq display-time-format "  %H:%M ")
;;(display-time-mode 1)
