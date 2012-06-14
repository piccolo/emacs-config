(load-file "~/.emacs.d/cedet-1.0.1/common/cedet.el")

(add-to-list 'load-path "~/.emacs.d/cedet-1.0.1/")
(semantic-load-enable-gaudy-code-helpers)

;;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(global-semantic-mru-bookmark-mode 1)

(require 'semantic-lex-spp)
(global-ede-mode t)
(ede-enable-generic-projects)
(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
(require 'semantic-decorate-include)
;; gcc setup
(require 'semantic-gcc)
;; smart completions
(require 'semantic-ia)
(setq-mode-local c-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
             '(project unloaded system recursive))
(require 'eassist)
(require 'semanticdb)
(global-semanticdb-minor-mode 1)
;; gnu global support
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
;; ctags
(require 'semanticdb-ectag)
;;(semantic-load-enable-primary-exuberent-ctags-support)
(global-semantic-tag-folding-mode)
(global-semantic-idle-completions-mode)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;;semantic gtk gdk
(defun my-semantic-hook ()
(semantic-add-system-include "/usr/include/gtk-3.0/gtk/" 'c-mode)
(semantic-add-system-include "/usr/include/gtk-3.0/gdk/" 'c-mode))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(require 'eassist)

(ede-cpp-root-project "ovd-proxy"
                :name "ovd-proxy"
                :file "~/work/src/ovd-proxy/CMakeLists.txt"
                :include-path '("/"
                                "/common"
                                "/rdpproxy/include"
                                "/gui/include"
                               )
				)

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook) 

;; (require 'semantic-lex-spp)
;; (ede-enable-generic-projects)
;; (setq senator-minor-mode-name "SN")
;; (setq semantic-imenu-auto-rebuild-directory-indexes nil)
;; (global-srecode-minor-mode 1)
;; (global-semantic-mru-bookmark-mode 1)
;; (require 'semantic-decorate-include)
;; ;; gcc setup
;; (require 'semantic-gcc)
;; ;; smart completions
;; (require 'semantic-ia)
;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;              '(project unloaded system recursive))
;; (setq-mode-local c++-mode semanticdb-find-default-throttle
;;              '(project unloaded system recursive))
;; (setq-mode-local erlang-mode semanticdb-find-default-throttle
;;              '(project unloaded system recursive))
;; (require 'eassist)
;; (require 'semanticdb)
;; (global-semanticdb-minor-mode 1)
;; ;; gnu global support
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
;; ;; ctags
;; (require 'semanticdb-ectag)
;; ;;(semantic-load-enable-primary-exuberent-ctags-support)
;; (global-semantic-tag-folding-mode)

;; (defun my-cedet-hook ()
;; (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;; (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;; (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;; (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)


;; END CEDET
;;----------------------------------------------------------------------------