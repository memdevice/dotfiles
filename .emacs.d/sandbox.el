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
