;;     keybindings.el
;; LM:               2021-050 | 1613749530
;;     keybindings.el


(global-set-key (kbd "C-c C-k") 'copy-line)       ;; copy line
(global-set-key (kbd "C-c y") 'duplicate-line)    ;; duplicate line (yyp in VI)
(global-set-key (kbd "C-c d") 'kill-whole-line)   ;; kill line - Xah usa "M-9" (dd in VI)

(global-set-key (kbd "<C-tab>") 'bury-buffer)     ;; cycle through buffers

;; ―――――――――――  C-<something> : more remap!!  ――――――――――――――――――――――――

(define-key global-map (kbd "C-+") 'text-scale-increase) ;; C-+ increse font size
(define-key global-map (kbd "C--") 'text-scale-decrease) ;; C-- decrese font size


;;  _______________  LM own function: insert  ________________________
;;                        C-c i <K>

;;  C-c i d/o/t/u


;; C-c i d -- date ISO format   (2021-02-19)
;; C-c i o -- odinal data       (2021-050)
;; C-c i t -- time              (14:58:25 +0100)
(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i o") 'mp-insert-ordinal-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)


;; C-c i u -- seconds since the Epoch: UNIX time (1613743116)

(global-set-key (kbd "C-c i u")
                '(lambda ()
                   (interactive)
                   (insert (format-time-string "%s"))))

;;  _______________ LM own function: insert random  __________________
;;                        C-c i r <K>

;; C-c i r n/s/h

;; by XAH insert random string(16), num (8), hexadecimal (12)
(global-set-key (kbd "C-c i r n") 'xah-insert-random-number)
(global-set-key (kbd "C-c i r s") 'xah-insert-random-string)
(global-set-key (kbd "C-c i r h") 'xah-insert-random-hex)

;; by XAH insert random string(16), num (8), hexadecimal (12)
(global-set-key (kbd "C-c i n") 'xah-insert-random-number)
(global-set-key (kbd "C-c i s") 'xah-insert-random-string)
(global-set-key (kbd "C-c i h") 'xah-insert-random-hex)


;; ―――――――――――――――――――  re-enable keys ―――――――――――――――――――――――――――――――

(put 'downcase-region 'disabled nil)      ;; lowercase region with C-x C-l
(put 'upcase-region 'disabled nil)        ;; uppercase region with C-x C-u.

;; ―――――――――――――――――――  function keys  ―――――――――――――――――――――――――――――――

;; better keybindings
;;
;; cfr: https://www.masteringemacs.org/article/my-emacs-keybindings

;; <F1> M-x shell (basta C-h per l'help!)
(global-set-key [f1] 'shell) ; F1
;; NB: ho configurato la bash di cygwin come inferior shell (M-x shell)

;; <F2> M-x rgrep (lo split windows si puo' fare con C-x 6)
;;(global-set-key [f2] 'xxxxxxxxx) ; F2

;; <F5> reload emacs dofile (init.el) keybind
(global-set-key [f5] 'reload-dotemacs)  ; F5

;; <F6> revert-this-buffer (reload from file)
(global-set-key [f6] 'revert-this-buffer) ; F6

;; <F7>
;; (global-set-key [f7] 'xxxxx) ; F7

;; <F8> to open a new empty buffer, without prompting for a name
(global-set-key [f8] 'xah-new-empty-buffer) ; F8

;; <F9> recentf on: file aperti di recente (M-x recentf-open-files)
(global-set-key [f9] 'recentf-open-files)      ;   F9

;; <F10> no way! menu

;; <F11>

;; <F12> kill other buffer (elimina tutti tranne quello corrente)
;; forse sarebbe meglio usare un keybinding diverso (<F8>?)
;; (global-set-key (kbd "C-x C-b") 'kill-other-buffers)   ; C-x C-b
(global-set-key (kbd "<f12>") 'kill-other-buffers) ; F12

;; ―――――――――――  C-x : remap!  ――――――――――――――――――――――――――――――――――――――――

;; C-x k --  kill current buffer, no question!
;; cfr: https://stackoverflow.com/questions/6467002/how-to-kill-buffer-in-emacs-without-answering-confirmation
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;;                                  ^^^^^^^
;; "current, not this!"

;; ―――――――――――  from package and mode  ――――――――――――――――――――――――――――――――

;; [lorem-ipsum]
;; C-c l p 	lorem-ipsum-insert-paragraphs
;; C-c l s 	lorem-ipsum-insert-sentences
;; C-c l l 	lorem-ipsum-insert-list

;; [mthesaur]
(global-set-key "\C-ct" 'mthesaur-search)
(global-set-key "\C-c\C-t" 'mthesaur-search-append)    ;; ??

;; [word count] minor mode



(global-set-key "\M-+" 'word-count-mode)
