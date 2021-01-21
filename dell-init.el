;;find-file-at-point, smarter C-x C-f when point on path or URL
(ffap-bindings)

;; Use your name in the frame title. :)
(setq  frame-title-format (format "%s's Emacs" (capitalize user-login-name)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Delete whitespace just when a file is saved.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Require and initialize `package`.
;;(require 'package)
;;(package-initialize)

;; Add `melpa` to `package-archives`.
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Use the `spacemacs-dark` theme.
;;(load-theme 'spacemacs-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ――――――――――――――――― LM package installed by hand  ―――――――――――――――――――――――――

(require 'sinvirt)
