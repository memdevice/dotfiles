Per semplificare il transito del codice da valutare ed, eventualmente, aggiungere, 
creo un file separato in cui accumulare questi pezzi di LISP presi in giro.
Questo e' diverso dalle funzioni "astratte" che si vorrebbe avere in Emacs, 
ma che bisogna ancora cercare o creare.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; gennaio 2021

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
  (insert (format-time-string "%x")))

(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%X")))

(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)

;; da Dell PC Xubuntu

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

;;  ___________________ cygwin shell _________________________________

;; LM: usare la bash di cygwin
;; da: https://www.masteringemacs.org/article/running-shells-in-emacs-overview
;;
(setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)


;; LM private and personal configuration
;; (load "~/.emacs.d/myconfig")


;; Supply a random fortune cookie as the *scratch* message.
;; (using internal function.el...)
 (when (executable-find "fortune")
   (setq initial-scratch-message
         (with-temp-buffer
           (shell-command "fortune" t)
           (let ((comment-start ";;"))
             (comment-region (point-min) (point-max)))
           (concat (buffer-string) "\n"))))


;; using thesaurus offline in d:\home\dict
;; (require 'mthesaur)
;; (global-set-key "\C-ct" 'mthesaur-search)
;; (global-set-key "\C-c\C-t" 'mthesaur-search-append)

;; password pronunciabili
;; grazie Exedre!
(mpwgen)  ; visualizzane una in message buffer


;; finestra verticale quasi 4:3 (chars x lines)
;; (when window-system
;;   (set-frame-position (selected-frame) 42 42)
;;   (set-frame-size (selected-frame) 72 52))
;; NB: alternativa l'opzione ‘-fh’ ‘--fullheight’ da command line

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


