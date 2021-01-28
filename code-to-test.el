Per semplificare il transito del codice da valutare ed, eventualmente, aggiungere, 
creo un file separato in cui accumulare questi pezzi di LISP presi in giro.
Questo e' diverso dalle funzioni "astratte" che si vorrebbe avere in Emacs, 
ma che bisogna ancora cercare o creare.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ---------------------------------
; Activate Package's Configurations
; ---------------------------------

; load shortcut keys
(load "~/.emacs.d/shortcuts.el")

; load org-mode config
(load "~/.emacs.d/org-mode.el")

;; LM private and personal configuration
;; (load "~/.emacs.d/myconfig")



OPPURE

You can do (require 'foo) and that will load the first "foo.el" elisp finds in your load path, 
or (require 'foo "/home/user/experimental/foo.el") for something outside your load path. 
It will report an error if "foo.el" does not contain the expression (provide 'foo). 
In a perverse situation you could do (require 'foo "bar.el"), and this would work as long as "bar.el" had a (provide 'foo) clause.

;;;; gennaio 2021

;; da Dell PC Xubuntu

;; Auto-wrap at 80 characters
;;(setq-default auto-fill-function 'do-auto-fill)
;;(setq-default fill-column 80)
;;(turn-on-auto-fill)
;; Disable auto-fill-mode in programming mode
;;(add-hook 'prog-mode-hook (lambda () (auto-fill-mode -1)))

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


