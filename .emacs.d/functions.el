;;     function.el
;; LM:             2021-057
;;     function.el

;; "emacs with batteeries included"...


;; ------------------------------------------------------------------ ;;
;;                      B O N U S   T R A C K
;; ------------------------------------------------------------------ ;;

;; METTO QUI LE FUNZIONI PIU' UTILI E GENERICHE
;; PER FARNE UNA B.T. PER IL CORSO; PIU' SOTTO LE MIE STRAMBERIE



;; ------------------------------------------------------------------ ;;

;; SEARCH : Google!
;; cfr. https://emacsredux.com/blog/2013/03/28/google/
(defun er-google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
         (read-string "Google: "))))))


;; SEARCH : YouTube!
;; cfr. idem
(defun er-youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.youtube.com/results?search_query="
    (url-hexify-string (if mark-active
                         (buffer-substring (region-beginning) (region-end))
                         (read-string "Search YouTube: "))))))


;; copy line           (una delle tante soluzioni)
(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
;; C-c C-k

;; duplicate line (yyp)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)(yank)(open-line 1)(next-line 1)(yank)
)
;; C-c y

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
;; <F8>

;; This calls another custom command of mine, revert-this-buffer. It does
;; exactly what the name implies: it reverts (reloads from file) the current
;; buffer without asking any questions. It will notify you in the minibuffer
;; area that it did it. (da https://www.masteringemacs.org/)
(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))
;;<F6>

;; reload emacs dofile (init.el) keybind
;; It would be handy to have a global key binding to reload .emacs
;; rather than go through the incredibly laborious process of
;; M-x load-file (delete a long string if I'm deep into some directory)
;;  ~/.emacs <RET>.
(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;; <F5>

;; inserire al volo data e orario
;; from: https://www.masteringemacs.org/article/mastering-key-bindings-emacs
;; cfr: http://ergoemacs.org/emacs/elisp_datetime.html

(defun mp-insert-date ()
  (interactive)
  (insert (format-time-string "%F")))

(defun mp-insert-ordinal-date ()
  (interactive)
  (insert (format-time-string "%Y-%j")))

(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%T %z")))
;;
;; C-c i d/o/t

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


;; recentf on --- keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)    ;; LM questo aggiunge il menu in File
(setq recentf-max-saved-items 256)
(setq recentf-max-menu-items 42)
;; <F9>

;; Kill Other Buffers --- here is a simple function that kills all buffers, except the current one.
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
;; <F12>
