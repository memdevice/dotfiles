;; -*- coding: utf-8 -*-


;; NON FUNZIONA MI PARE
;;
;; tentativo di avere un tasto Hyper in Emacs, usando il Right Win (Menu/App key)
;; NB: sulla mia tastiera e' 'option'

;; (setq w32-pass-lwindow-to-system nil
;;       w32-pass-rwindow-to-system nil
;;       w32-pass-apps-to-system nil
;;       w32-lwindow-modifier 'super ;; Left Windows key
;;       w32-rwindow-modifier 'super ;; Right Windows key
;;       w32-apps-modifier 'hyper) ;; Menu key

;; integra con:

;; (when (eq window-system 'w32)
;;  (setq w32-apps-modifier 'super))


;;(autoload 'nc "nc" "Emulate MS-DOG file shell" t) ;; Norton Commander


;; CFR: https://stackoverflow.com/questions/7394289/how-can-i-more-easily-switch-between-buffers-in-emacs

;; All of the features of iswitchdb are now provided by ido. Ross provided a link to the documentation in his answer. You can activate with the following in your .emacs (or use the customization interface as Ross suggests):

;; (require 'ido)
;; (ido-mode 'buffers) ;; only use this line to turn off ido for file names!
;; (setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
;;                "*Messages*" "Async Shell Command"))

;; By default, ido provides completions for buffer names and file names. If you only want to replace the features of iswitchb, the second line turns off this feature for file names. ido will ignore any buffers that match the regexps listed in ido-ignore-buffers.

;; The behaviour described below for iswitchb-mode applies equally to ido for switching buffers.

(require 'google-this)
(google-this-mode 1)
(global-set-key (kbd "C-x g") 'google-this-mode-submap)
;; If you don't like this keybind, just reassign the
;; `google-this-mode-submap' variable.
;; My personal preference is "C-x g":
;;
;;        (global-set-key (kbd "C-x g") 'google-this-mode-submap)
;;
;; Or, if you don't want google-this to overwrite the default ("C-c /")
;; key insert the following line BEFORE everything else (even before
;; the `require' command):
;;
;;        (setq google-this-keybind (kbd "C-x g"))

;; To start a blank search, do google-search (C-c / RET). If you want more control of what "under point" means for the google-this command, there are the google-word, google-symbol, google-line and google-region functions, bound as w, s, l and SPC, respectively.

;; ------------------------------------------------------------------ ;;


;; ------------------------------------------------------------------ ;;

;; unwrapline

;; On InternetRelayChat, you sometimes quote stuff from other sources that include linebreaks. This function removes all linebreaks in the current “paragraph” – that is, until the next empty line or until the end of the buffer. (But read on for alternative solutions.)

(defun unwrap-line ()
  "Remove all newlines until we get to two consecutive ones.
Or until we reach the end of the buffer.
Great for unwrapping quotes before sending them on IRC."
  (interactive)
  (let ((start (point))
        (end (copy-marker (or (search-forward "\n\n" nil t)
                              (point-max))))
        (fill-column (point-max)))
    (fill-region start end)
    (goto-char end)
    (newline)
    (goto-char start)))

;; Houston...
;;(global-set-key (kbd "C-c d n") 'unwrap-line) ;; mnemonico <D> delete, <N> newline


;; NON FUNZIONANO ??
;; (require 'levenshtein) NB Non serve più, c'è 'string-distance' in Emacs 27
(require 's)

;; RANDOM LINE FROM TEXT FILE
  (defun enlightenment-for-today ()
    (interactive)
    (let* ((thing (random-thing-from-a-file "~/random.fortune")))
	   (message
	    (concat "Random from text file. \n"
		    "===============================================\n"
		    thing))))

;; IDEM FROM ANY FILE
  (defun random-thing-from-a-file (f)
    (interactive "fLoad Thing from: ")
    (random t)
    (save-excursion
     (find-file f)
     (let ((line-num (random (count-lines (point-min) (point-max)))))
       (goto-line line-num)
       (let ((result (buffer-substring (line-beginning-position) (line-end-position))))
         (kill-buffer (current-buffer))
	     result))))

;; cfr: https://stackoverflow.com/questions/6707758/inverse-of-m-q-an-unfill-paragraph-function
;;      https://github.com/purcell/unfill
;; (defun unfill-paragraph ()
;;   "Replace newline chars in current paragraph by single spaces.
;; This command does the reverse of `fill-paragraph'."
;;   (interactive)
;;   (let ((fill-column 90002000))
;;     (fill-paragraph nil)))

;; (defun unfill-region (start end)
;;   "Replace newline chars in region by single spaces.
;; This command does the reverse of `fill-region'."
;;   (interactive "r")
;;   (let ((fill-column 90002000))
;;     (fill-region start end)))

;; [unfill]
;;
;;Functions providing the inverse of Emacs' fill-paragraph and fill-region
;;(add-to-list 'load-path "/dir/containing/unfill")
(require 'unfill)
;; Usage
;;
;; M-x unfill-region
;; M-x unfill-paragraph
;; M-x unfill-toggle



;; (global-set-key (kbd "<s-return>") 'ansi-term)

;; (setq kill-ring-max 100) ;; default is 60

;; (w32-send-sys-command 61490) ;; -mm in Win32 (if other methods fails...)

;; (global-font-lock-mode 1)                      ; Color enabled
;; (set-background-color "darkblue")              ; Background color
;; (set-face-background 'region "gray80")         ; Color for selected lines
;; (global-hl-line-mode t)                        ; Highlight cursor line
;; (add-to-list 'default-frame-alist '(font . "")); Change fonts

;; (setq european-calendar-style 't)              ; European style calendar
 ;; (setq calendar-week-start-day 1)               ; Week starts monday
 (setq ps-paper-type 'a4)                       ; Specify printing format
 ;; (setq ispell-dictionary "english")             ; Set ispell dictionary
 ;; (setq shell-file-name "/bin/bash")             ; Set Shell for M-| command
 ;; (setq tex-shell-file-name "/bin/bash")         ; Set Shell used by TeX
 ;; (setq grep-command "grep -i -nH -e ")          ; Set grep command options
 ;; (setq exec-path (append exec-path '("/bin")))  ; Change binary path


;; cfr:
;; https://www.emacswiki.org/emacs/EmacsCrashCode
(global-set-key "\C-x\C-b" 'buffer-menu)    ; CxCb puts point on buffer list
(icomplete-mode t)                             ; Completion in mini-buffer
(setq read-buffer-completion-ignore-case 't)    ; Ignore case when completing buffer names
;; --------------------------------------

(auto-compression-mode 1)           ;; abilita l'apertura di file compressi
;;(add-to-list 'file-coding-system-alist '("\\.dict\\'" . utf-8))
;; and .dict files are UTF-8, so

;; forse dovrei usarlo prima del CUA mode

;;(when window-system (global-unset-key "\C-z")) ;; iconify-or-deiconify-frame (C-x C-z)


;; better defaults - cfr.   https://github.com/technomancy/better-defaults/blob/master/better-defaults.el
(global-set-key (kbd "M-/") 'hippie-expand) ;; remap!
;;(global-set-key (kbd "C-x C-b") 'ibuffer) ;; remap!
;; (global-set-key (kbd "M-z") 'zap-up-to-char) ;; remap!

(global-set-key (kbd "C-s") 'isearch-forward-regexp) ;; swap remap!!
(global-set-key (kbd "C-r") 'isearch-backward-regexp) ;; swap remap!!
(global-set-key (kbd "C-M-s") 'isearch-forward) ;; swap remap!!
(global-set-key (kbd "C-M-r") 'isearch-backward) ;; swap remap!!


;; additional ‘C-x LETTER’ key bindings for useful commands (notice uppercase)
(global-set-key "\C-xB" 'bury-buffer)
(global-set-key "\C-xE" 'apply-macro-to-region-lines)
(global-set-key "\C-xI" 'insert-buffer)

;; Additional ‘C-c LETTER’ key bindings for useful commands

(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cG" 'goto-char)
(global-set-key "\C-cw" 'delete-region) ; ala C-w and M-C-w
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

;; pop up the Speedbar when Emacs is running under a window system
;; (when window-system (speedbar 1)) ; not just X!

;; LM: non funzionano, almeno il secondo!
;;(setq require-final-newline 't);; make sure your text files end in a newline
;;(setq require-final-newline 'query) ;; Emacs ask about any time it is needed

;; --------------------------------------

;;(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
;; (set-language-environment 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; ;; (set-selection-coding-system
;; ;;     (if (eq system-type 'windows-nt)
;; ;;         'utf-16-le  ;; https://rufflewind.com/2014-07-20/pasting-unicode-in-emacs-on-windows
;; ;;       'utf-8))
;; (prefer-coding-system 'utf-8)
;; (setq-default buffer-file-coding-system 'utf-8)

;; (set-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8)
;; ;;(set-default-coding-systems 'utf-8-unix)
;; (prefer-coding-system 'utf-8-unix)
;; (set-terminal-coding-system 'utf-8-unix)
;; (set-keyboard-coding-system 'utf-8-unix)
;; (setq-default buffer-file-coding-system 'utf-8-unix)
;; ;; (set-selection-coding-system 'utf-8-unix) ;; to leave Windows use UTF-16

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
;;(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; (prefer-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; ;;(set-selection-coding-system 'utf-8-unix)
;; (setq-default buffer-file-coding-system 'utf-8)


;; Treat clipboard input as UTF-8 string first; compound text next, etc.
;;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; --------------------------------------

;;(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding


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


  ;; (defconst animate-n-steps 3)
  ;; (defun emacs-reloaded ()
  ;;   (animate-string (concat ";; Initialization successful, welcome to "
  ;; 			  (substring (emacs-version) 0 16)
  ;;       		  ".")
  ;;       	  0 0)
  ;;   (newline-and-indent)  (newline-and-indent))

  ;; (add-hook 'after-init-hook 'emacs-reloaded)
