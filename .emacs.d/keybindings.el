;;     keybindings.el
;; LM:               2021-057
;;     keybindings.el

(global-set-key "\M-Z" 'zap-up-to-char)           ;; M-z resta mappato su zap-to-char originale
;; questo invece non elimina il carattere marcatore

;;  ____________ LM own keybindings  _________________________________
;;                        C-c <k>

(global-set-key (kbd "C-c o") 'occur)             ;; M-x occur shortcut
(global-set-key "\C-c\C-a" 'mark-whole-buffer)    ;; make C-c C-a “select all”
(global-set-key (kbd "C-c C-k") 'copy-line)       ;; copy line
(global-set-key (kbd "C-c y") 'duplicate-line)    ;; duplicate line (yyp in VI)
(global-set-key (kbd "C-c d") 'kill-whole-line)   ;; kill line - Xah usa "M-9" (dd in VI)

;;(global-set-key (kbd "<C-tab>") 'bury-buffer)     ;; cycle through buffers

(global-set-key (kbd "C-<tab>") 'next-buffer) ;; TAB is for switching
(global-set-key (kbd "C-S-<tab>") 'previous-buffer) ;; idem

;; [from package columnize.el]
(global-set-key (kbd "C-c z") 'columnize-text)
;;(global-set-key (kbd "C-c Z") 'columnize-strings)

(global-set-key (kbd "C-c r") 'query-replace-regexp) ;; default C-M-%
(global-set-key (kbd "C-c b") 'ding)    ;; keybinding test: bell!

(define-key global-map (kbd "C-c +") 'text-scale-increase) ;; C-c + increse font size
(define-key global-map (kbd "C-c -") 'text-scale-decrease) ;; C-c - decrese font size

;; ―――――――――――  C-x : remap!  ――――――――――――――――――――――――――――――――――――――――

;; C-x k --  kill current buffer, no question!
;; cfr: https://stackoverflow.com/questions/6467002/how-to-kill-buffer-in-emacs-without-answering-confirmation
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;;                                  ^^^^^^^
;; LM NB: "current, not this!"


;; ―――――――――――  C-<something> : more remap!!  ――――――――――――――――――――――――


;;  _______________  LM own function: insert  ________________________
;;                        C-c i <k>

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


;;  _______________  LM own function: www  ___________________________
;;                        C-c C-w <k>

;; C-c C-w y -- www.youtube.com
;; C-c C-w g -- www.google.com

(global-set-key (kbd "C-c C-w y") #'er-youtube)  ;; Y for YouTube
(global-set-key (kbd "C-c C-w g") #'er-google)   ;; G for Google

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

;; [columnize]  ---> C-c XXXX


;; [google-this]
;; google-this is a package that provides a set of functions and
;; keybindings for launching google searches from within Emacs.

;; cfr. http://pragmaticemacs.com/emacs/google-search-from-inside-emacs/
;;      https://github.com/Malabarba/emacs-google-this


;; The main function is `google-this' (bound to C-c / g). It does a
;; google search using the currently selected region, or the
;; expression under point. All functions are bound under "C-c /"
;; prefix, in order to comply with Emacs' standards. If that's a
;; problem see `google-this-keybind'. To view all keybindings type "C-c
;; / C-h".
;;
;; If you don't like this keybind, just reassign the
;; `google-this-mode-submap' variable.
;; My personal preference is "C-x g":
;;
;;        (global-set-key (kbd "C-x g") 'google-this-mode-submap)
;;
;; Or, if you don't want google-this to overwrite the default ("C-c /")
;; key insert the following line BEFORE everything else (even before
;; the `require' command):
;;
;;        (setq google-this-keybind (kbd "C-x g"))
;;

;; or C-c g ??
(global-set-key (kbd "C-x g") 'google-this-mode-submap)
;; LM questo dovrebbe essere il ramo di keybindings

;; The full list of commands is:
;;
;; C-c / SPC 	google-this-region
;; C-c / a 	google-this-ray
;; C-c / c 	google-this-translate-query-or-region
;; C-c / e 	google-this-error
;; C-c / f 	google-this-forecast
;; C-c / g 	google-this-lucky-search
;; C-c / i 	google-this-lucky-and-insert-url
;; C-c / l 	google-this-line
;; C-c / m 	google-maps
;; C-c / n 	google-this-noconfirm
;; C-c / r 	google-this-cpp-reference
;; C-c / s 	google-this-symbol
;; C-c / t 	google-this
;; C-c / w 	google-this-word
;; C-c / <return> 	google-this-search
