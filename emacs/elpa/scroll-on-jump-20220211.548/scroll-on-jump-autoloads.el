;;; scroll-on-jump-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "scroll-on-jump" "scroll-on-jump.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from scroll-on-jump.el

(autoload 'scroll-on-jump "scroll-on-jump" "\
Main macro that wraps BODY in logic that reacts to change in `point'.

\(fn &rest BODY)" nil t)

(autoload 'scroll-on-jump-interactive "scroll-on-jump" "\
Macro that wraps interactive call to function FN.

Use if you want to use `scroll-on-jump' for a single `key-binding',
without changing behavior anywhere else.

\(fn FN)" nil t)

(autoload 'scroll-on-jump-advice-add "scroll-on-jump" "\
Add advice to FN, to instrument it with scrolling capabilities.

\(fn FN)" nil t)

(autoload 'scroll-on-jump-advice-remove "scroll-on-jump" "\
Remove advice on FN added by `scroll-on-jump-advice-add'.

\(fn FN)" nil t)

(autoload 'scroll-on-jump-with-scroll "scroll-on-jump" "\
Main macro wrapping BODY, handling change `point' and vertical scroll.

\(fn &rest BODY)" nil t)

(autoload 'scroll-on-jump-with-scroll-interactive "scroll-on-jump" "\
Macro that wraps interactive call to function FN.

Use if you want to use `scroll-on-jump-with-scroll' for a single `key-binding',
without changing behavior anywhere else.

\(fn FN)" nil t)

(autoload 'scroll-on-jump-with-scroll-advice-remove "scroll-on-jump" "\
Remove advice on FN added by `scroll-on-jump-with-scroll-advice-add'.

\(fn FN)" nil t)

(autoload 'scroll-on-jump-with-scroll-advice-add "scroll-on-jump" "\
Add advice to FN, to instrument it with scrolling capabilities.

\(fn FN)" nil t)

(register-definition-prefixes "scroll-on-jump" '("scroll-on-jump-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; scroll-on-jump-autoloads.el ends here
