(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notify readonly ring stamp track)))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(whitespace-mode t)
 '(hl-line-mode t))

(global-auto-revert-mode t)

(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
  )

(global-set-key [f5] 'refresh-file)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(set-foreground-color "white")
(set-background-color "black")
(setq mail-self-address "vincent.roullier@ulteo.com")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-log-mode 'time)
(setq load-path (cons "~/.emacs.d" load-path))
(setq hl-line-mode t)

;;;
;;; New File Creation  from Template
;;;
;;; note: to add a new template file
;;;
;;; 1- create the template file in the .emacs.d/template folder
;;;     e.g., insert.lsp ( a lisp template file)
;;;     In the template you can use:
;;;         %u is replaced by user's login name
;;;         %U is user's full name
;;;         %h is the name of the user's machine
;;;         %a is the user's mail address (from the variable mail-self-address)
;;;         %f is the file name (without directory part)
;;;         %F is the file name capitalised
;;;         %b is the base file name, without suffix
;;;         %B is the base file name capitalised
;;;         %e is the file's suffix (extension)
;;;         %E is the file's suffix capitalised
;;;         %p is the full path name of the file
;;;         %P is the directory part of the file name
;;;         %d is the current date
;;;         %y is the current year
;;;         %Y is the last two digits of the current year
;;;         %D is the day of the month
;;;         %M is the month in figures
;;;         %m is the month in words
;;;         %o is the user's Organisation (from the variable auto-insert-organisation)
;;;         %( and %) bound an ELisp form that is evalled and deleted.
;;;         %{ and %} bound a comment which will be removed.
;;;         $[ and %] bound a string which will be used to prompt user for a replacement.
;;;         %1-%9 refer to the nth strings prompted for with %[ %]
;;;         %< and %> bound a value for fill-prefix
;;;         %^ centres the current line
;;;         %+ fills the current paragraph
;;;         %= justifies the current paragraph
;;;         %% is a % 
;;;         %@ sets the initial position of `point'."
;;;
;;;
;;; 2- if needed, add an entry if the auto-insert-alist
;;;    The auto-insert-alist consists of dotted pairs of{
;;;    ( REGEXP . TYPE ) where REGEXP is a regular expression, and
;;;    TYPE is the type of file which is to be inserted into
;;;    all new files matching the regular expression with which it is
;;;    paired.
;;;     e.g., ("\\.lsp$" . "Lisp")
;;;
;;; 3- add an entry in the auto-insert-type-alist
;;;    The auto-insert-type-alist consists of dotted pairs of
;;;    ( TYPE . FILENAME ) where TYPE is a file type obtained from
;;;    auto-insert-alist, or by querying the user and filename is the
;;;    name of a file to be found in one of the directories listed in
;;;    auto-insert-path.
;;;     e.g., ("Lisp" . "insert.lsp")
;;;
(require 'auto-insert-tkld)

(setq auto-insert-path (cons "~/.emacs.d/template" auto-insert-path))
(setq auto-insert-automatically t)

(setq auto-insert-alist
      '(("\\.txt$" . "Text")		; text file
	("\\.c$" . "C")		; C
	("\\.h$" . "Cinclude")		; C include
	("\\.cpp$" . "Cpp")		; Cpp
;	("[Mm]akefile$" . "Makefile")	; Makefile 
;	("[Rr][Ee][Aa][Dd][Mm][Ee]$" . "Readme")       ; Readme
	("\\.sh$" . "Shell")		; Shell
	("CMakeLists\\.txt$" . "CMake")     ; CMake
	))

(setq auto-insert-type-alist
      '(("C" . "insert.c")
	("Cinclude" . "insert.h")
	("Cpp" . "insert.cpp")
	("Shell" . "insert.sh")
	("CMake" . "CMakeLists.txt")
	))


;; cmake mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))


;; Artistic Style
(defun astyle (pmin pmax)
  (interactive "r")
  (shell-command-on-region pmin pmax "astyle --style=java --indent=tab --break-blocks --delete-empty-lines"
    (current-buffer) t (get-buffer-create "*Astyle Errors*") t))

(setq-default c-basic-offset 4
	      tab-width 4)

(require 'blank-mode)   
(autoload 'blank-mode           "blank-mode" "Toggle blank visualization."        t)
(autoload 'blank-toggle-options "blank-mode" "Toggle local `blank-mode' options." t)

(require 'whitespace)
(setq whitespace-style '(trailing face tabs newline tab-mark))
(global-whitespace-mode t)

(provide 'cc-config)

(require 'magit)

;;(load "~/.emacs.d/emacs-rc-cedet.el")

;; (load "~/.emacs.d/emacs-rc-cedet.el")

;; cedet 

;;(load-file "~/.emacs.d/cedet/common/cedet.el")
(add-to-list 'load-path "~/.emacs.d/cedet")
(load-file "~/.emacs.d/cedet/common/cedet.el")

(global-ede-mode t)

(semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)

(require 'ecb)
;;; emacs-rc-cedet.el ---
