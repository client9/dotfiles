(defun buffer-untabify ()
  "Untabify an entire buffer"
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace))

(defun buffer-indent()
  "Reindent an entire buffer"
  (interactive)
  (indent-region (point-min) (point-max) nil))

(defun buffer-cleanup()
  "Untabify and re-indent an entire buffer"
  (interactive)
  (if (equal buffer-file-coding-system 'undecided-unix )
      nil
    (set-buffer-file-coding-system 'undecided-unix))
  (buffer-untabify)
  (buffer-indent)
  (delete-trailing-whitespace))

;;
;; go-lang
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/go")
(require 'go-mode)

;;
;; javascript
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/javascript")
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
;; tabs must die
(add-hook 'espresso-mode-hook (lambda ()
                                (setq indent-tabs-mode nil)))

;; configure aspell
;;(setq ispell-program-name "/opt/local/bin/aspell")

;;(menu-bar-mode nil)

;; setup status bar
(setq display-time-day-and-date t)
(display-time)
(column-number-mode t)

;;
;; tabs and whitespace
;;

;; No Tabs!
(setq indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)

;; Draw tabs with the same color as trailing whitespace
(add-hook 'font-lock-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\t" 0 'trailing-whitespace prepend)))))


;; Control-G == goto-line
(global-set-key "\C-g" 'goto-line)

;; Turn off initial screen
(setq inhibit-splash-screen t)

;; Type "y" or "n" instead of "yes" or "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; trick for emacs 22
;; if script has first line starting with "#!..." then do chmod a+x on it
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


(defun insert-header-core (headertag headerfile)
  "insert a source file header"
  (interactive)
  (goto-char (point-min))
  (kill-region (point-min)
               (progn (search-forward headertag nil t 1)
                      (point)))
  (insert-file headerfile)
  )

(defun insert-header ()
  (interactive)
  (insert-header-core "/* HEADER END */\n" "header.txt")
  )

;; php
(add-to-list 'load-path "~/.emacs.d/site-lisp/php")
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(defun pear/php-mode-init()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close '0)
)
(add-hook 'php-mode-hook 'pear/php-mode-init)


(setq-default indent-tabs-mode nil)
(setq c-default-style "stroustrup"
      c-basic-offset 4)
(setq-default c-basic-offset 4)
