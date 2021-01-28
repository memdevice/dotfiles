;;  F1 F2 F5 F6 F8 F9 F12
;;
;;  C-x k

;; better keybindings
;; cfr: https://www.masteringemacs.org/article/my-emacs-keybindings

;; <F1> M-x shell (basta C-h per l'help!)
(global-set-key [f1] 'shell) ; F1
;; NB: ho configurato la bash di cygwin come inferior shell (M-x shell)

;; <F2> M-x rgrep (lo split windows si puo' fare con C-x 6)
;;(global-set-key [f2] 'xxxxxxxxx) ; F2

;; reload emacs dofile (init.el) keybind
(global-set-key [f5] 'reload-dotemacs)  ; F5

;; <F6> revert-this-buffer (reload from file)
(global-set-key [f6] 'revert-this-buffer) ; F6

;; <F7> mpwgen (pronounceable passphrase)
(global-set-key [f7] 'mpwgen) ; F7

;; kill other buffer (elimina tutti tranne quello corrente)
;; forse sarebbe meglio usare un keybinding diverso (<F8>?)
;; (global-set-key (kbd "C-x C-b") 'kill-other-buffers)   ; C-x C-b
(global-set-key [f8] 'kill-other-buffers) ; F8

;; To open a new empty buffer, without prompting for a name
(global-set-key [f9] 'xah-new-empty-buffer) ; F9

;; recentf on: file aperti di recente (M-x recentf-open-files)
(global-set-key (kbd "<f12>") 'recentf-open-files)      ;   F12

;; kill current buffer
;; cfr: https://stackoverflow.com/questions/6467002/how-to-kill-buffer-in-emacs-without-answering-confirmation
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;; LMNB: "current" e non "this"!

;; ――――――――――――――――――― LM from package  ―――――――――――――

;; lorem-ipsum
;; C-c l p 	lorem-ipsum-insert-paragraphs
;; C-c l s 	lorem-ipsum-insert-sentences
;; C-c l l 	lorem-ipsum-insert-list

;; mthesaur
(global-set-key "\C-ct" 'mthesaur-search)
(global-set-key "\C-c\C-t" 'mthesaur-search-append)

;; ――――――――――― C-c : user defined keybindings――――――――――

;;;  C-c i branch : insert


;; by XAH insert random string(16), num (8), hexadecimal (12)
(global-set-key (kbd "C-c i r n") 'xah-insert-random-number)
(global-set-key (kbd "C-c i r s") 'xah-insert-random-string)
(global-set-key (kbd "C-c i r h") 'xah-insert-random-hex)

;; (s)memorandum

;; to insert a tab in text mode
;;(global-set-key (kbd "TAB") 'self-insert-command) ;; or C-q <TAB>
