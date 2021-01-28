;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Auto-wrap at 80 characters
;;(setq-default auto-fill-function 'do-auto-fill)
;;(setq-default fill-column 80)
;;(turn-on-auto-fill)
;; Disable auto-fill-mode in programming mode
;;(add-hook 'prog-mode-hook (lambda () (auto-fill-mode -1)))

;; Non-nil means draw block cursor as wide as the glyph under it.
;; For example, if a block cursor is over a tab, it will be drawn as
;; wide as that tab on the display.
;; (setq x-stretch-cursor t)

;;;;;;;;


;; using thesaurus offline in d:\home\dict
;; (require 'mthesaur)
;; (global-set-key "\C-ct" 'mthesaur-search)
;; (global-set-key "\C-c\C-t" 'mthesaur-search-append)

;; password pronunciabili
;; grazie Exedre!
(mpwgen)  ; visualizzane una in message buffer

;; gentilmente by Exedre,
;; autore anche del nome della funzione

(defun menizza ()
  (interactive)
  (kill-new
   (replace-regexp-in-string
    " " "-"
    (buffer-substring-no-properties
     (region-beginning) (region-end)))
   nil))

(global-set-key (kbd "C-c m") 'menizza)

    (defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; optional key binding
(global-set-key "\C-c\C-k" 'copy-line)


;; from: https://www.masteringemacs.org/article/mastering-key-bindings-emacs
(defun mp-insert-date ()
  (interactive)
  (insert (format-time-string "%x")))

(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%X")))

(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)


