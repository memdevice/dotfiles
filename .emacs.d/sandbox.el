;; (defalias 'qrr 'query-replace-regexp)
;; M-x qrr


;; EOL function


;; Here's a function that – I think – shows how to check from elisp what Emacs has determined to be the type of line endings. If it looks inordinately complicated, perhaps it is.

;; (defun describe-eol ()
;;   (interactive)
;;   (let ((eol-type (coding-system-eol-type buffer-file-coding-system)))
;;     (when (vectorp eol-type)
;;       (setq eol-type (coding-system-eol-type (aref eol-type 0))))
;;     (message "Line endings are of type: %s"
;;              (case eol-type
;;                (0 "Unix") (1 "DOS") (2 "Mac") (t "Unknown")))))

;; ———————————————————————————————————————————————————————————————————

;; Recycle Bin
;; The following line configures Emacs so that files deleted via Emacs are moved to the Recycle.
(setq delete-by-moving-to-trash t)


;; Emacs rather than starting a new instance for each file.Putting these two lines in .emacs creates a menu item File -> Open recent.
;;(require 'recentf)
;;(recentf-mode 1)

;; Enabling commands to change case
;; The commands for converting the text in a region to upper or lower case are disabled by default. (The GNU Emacs manual says beginners find these commands confusing and so you have turn them on. That seems very strange. Many other Emacs commands are more confusing.) The following turns the commands on.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;;Once this is enabled, you can make the text in a region
;;lowercase with C-x C-l or uppercase with C-x C-u.


;; da: https://www.johndcook.com/blog/emacs_windows/


;; time is an illusion, lunchtime doubly so

;; Format yyyy-mm-dd
;(format-time-string "%Y-%m-%d")
;; unix time
;(format-time-string "%s") ; "1291104066"

;;(insert (current-time-string))
;; funziona ma scrive sullo scratch, cancellenado il fortune

;; (insert (format-time-string "%s"))

;;  ___________________ UTF-8 ________________________________________


;; Xah Lee - Set default encoding system for opening and saving
;; UTF-8 as default encoding
(set-language-environment "UTF-8")
;; e forse in aggiunta basta solo questo
;; (per lasciare ad Emacs maggiore flessibilita')
;;(prefer-coding-system 'utf-8) ;; LM: se attivo questo, ORG non si visulaizza bene

;;
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
;; (if (boundp 'buffer-file-coding-system)
;;     (setq-default buffer-file-coding-system 'utf-8)
;;   (setq default-buffer-file-coding-system 'utf-8))

;; make unix lineendings default
;; (setq default-buffer-file-coding-system 'utf-8-unix)
;; Verify with C-h v buffer-file-coding-system.
;; It should say "global value is utf-8-unix".


;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))



;;  ___________________     org mode     ____________________________________

;; di default in org la selezione con shift e' disabilitata
;; ho provato ad abilitarla, vediamo che accade (ci sono controindicazioni)


;;  _______________   LM own function     ___________________________________

(global-set-key (kbd "C-c u")
                '(lambda ()
                   (interactive)
                   (insert (format-time-string "%s"))))

 ;; devo pensare a qualcosa di meglio per i tasti C-c t u oppure C-c i t u

;;  __________________ UNICODE DB update ____________________________________

;; Update emacs unicode data database
;;
;; download: https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt
;; Put that file in your emacs init dir. Put this in your emacs init file:
(when (file-exists-p "~/.emacs.d/UnicodeData.txt")
  (setq describe-char-unicodedata-file "~/.emacs.d/UnicodeData.txt"))

;;  ___________________ fill mode ____________________________________

;; If you keep hitting M-q to fill your paragraphs (see FillParagraph),
;; then auto-fill-mode is for you.
;; It doesn’t get rid of M-q altogether but it is a
;; very good approximation: Type M-x auto-fill-mode to activate the
;; MinorMode for the current buffer, or put the following in your .emacs
;; to activate it for all text mode buffers:
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; <---AUT AUT
;;If you want Emacs to ask you whether to use Auto Fill Mode when opening
;;a text file, you can do:
;; (add-hook 'text-mode-hook
;;           (lambda ()
;;             (when (y-or-n-p "Auto Fill mode? ")
;;               (turn-on-auto-fill))))
;; AUT AUT --->

;; cfr. https://www.emacswiki.org/emacs/AutoFillMode

;;;; LM: decido di eliminare entrambi e tornare al word wrap e ""una linea un paragrafo""

;; copiare la riga corrente, una delle tante soluzioni
(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key "\C-c\C-k" 'copy-line)

;; inserire al volo data e orario
;; from: https://www.masteringemacs.org/article/mastering-key-bindings-emacs
(defun mp-insert-date ()
  (interactive)
  (insert (format-time-string "%F")))

(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%T %z")))

(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)

;; Insert Random Number
(defun xah-insert-random-number (NUM)
  "Insert NUM random digits.
NUM default to 5. LM: now is 8.
Call `universal-argument' before for different count.
URL `http://ergoemacs.org/emacs/elisp_insert_random_number_string.html'
Version 2017-05-24"
  (interactive "P")
  (let (($charset "1234567890" )
        ($baseCount 10))
    (dotimes (_ (if (numberp NUM) (abs NUM) 8 ))
      (insert (elt $charset (random $baseCount))))))

;; Insert Random Hexadecimal
(defun xah-insert-random-hex (NUM)
  "Insert NUM random hexadecimal digits.
NUM default to 12.
Call `universal-argument' before for different count.
URL `http://ergoemacs.org/emacs/elisp_insert_random_number_string.html'
Version 2017-08-03"
  (interactive "P")
  (let (($n (if (numberp NUM) (abs NUM) 12 )))
    (insert (format  (concat "%0" (number-to-string $n) "x" ) (random (1- (expt 16 $n)))))))

;; Insert Random String
(defun xah-insert-random-string (NUM)
  "Insert a random alphanumerics string of length 16.
The possible chars are: A to Z, a to z, 0 to 9.
Call `universal-argument' before for different count.
URL `http://ergoemacs.org/emacs/elisp_insert_random_number_string.html'
Version 2018-08-03"
  (interactive "P")
  (let* (($charset "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
         ($baseCount (length $charset)))
    (dotimes (_ (if (numberp NUM) (abs NUM) 16))
      (insert (elt $charset (random $baseCount))))))

(defun date (arg)
   (interactive "P")
   (insert (if arg
               (format-time-string "%d.%m.%Y")
             (format-time-string "%Y-%m-%d"))))

(defun timestamp ()
   (interactive)
   (insert (format-time-string "%Y-%m-%dT%H:%M:%S")))


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)


(defun menizza ()
  (interactive)
  (kill-new
   (replace-regexp-in-string
    " " "-"
    (buffer-substring-no-properties
     (region-beginning) (region-end)))
   nil))
