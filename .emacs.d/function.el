;;    function.el
;;
;; ―――――――――――――――――――  LM emacs standard add on  ―――――――――――――――――――――――――――――

;; LM configurazioni di Emacs standard, senza installare pacakge ovvero "emacs with batteeries included"...

;; NB: all'ultima riga di commento di ogni blocco il keybinding associato alla funzione

;; recentf on --- keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)    ;; LM questo aggiunge il menu in File
(setq recentf-max-saved-items 256)
(setq recentf-max-menu-items 42)
;; <F9>

;; Kill Other Buffers
;; Here is a simple function that kills all buffers, except the current one.
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
;; <F12>

;; reload emacs dofile (init.el) keybind
;; It would be handy to have a global key binding to reload .emacs
;; rather than go through the incredibly laborious process of
;; M-x load-file (delete a long string if I'm deep into some directory)
;;  ~/.emacs <RET>.
(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;; <F5>

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
