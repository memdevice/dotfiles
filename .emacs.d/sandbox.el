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
