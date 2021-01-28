I hate it when I accidentally type C-z and iconify my frame.

(when window-system (global-unset-key "\C-z"))

(global-set-key [M-f4]          'kill-emacs)

(global-set-key (kbd "C-w")     'kill-this-buffer) ;; meglio forse un tasto funzione

;; swap windows
(global-set-key (kbd "C-c s") 'swap-windows)


;; duplicate the current line or region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; rename buffer & visited file
(global-set-key (kbd "C-c r") 'rename-file-and-buffer)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;; Fetch the contents at a URL, display it raw.
(global-set-key (kbd "C-x C-h") 'view-url)


; cycle through buffers
(global-set-key (kbd "<C-tab>") 'bury-buffer)

(global-set-key "\M-n"  'next-buffer)
(global-set-key "\M-p"  'previous-buffer)
(global-set-key (kbd "C-c w") (quote copy-word))
(global-set-key (kbd "C-c l") (quote copy-line))
(global-set-key (kbd "C-c p") (quote copy-paragraph))
(global-set-key (kbd "C-c s") (quote thing-copy-string-to-mark))
(global-set-key (kbd "C-c a") (quote thing-copy-parenthesis-to-mark))

(global-set-key "\C-o"  'other-window)
(global-set-key "\M-o"  'other-window)

;; da: https://stackoverflow.com/questions/3124844/what-are-your-favorite-global-key-bindings-in-emacs
