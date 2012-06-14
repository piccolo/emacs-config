(load-file "~/.emacs.d/cedet-1.0.1/common/cedet.el")

(add-to-list 'load-path "~/.emacs.d/cedet-1.0.1/")

(require 'semantic-load)
(require 'semantic-decorate-include)
(require 'semanticdb)
(require 'semantic-gcc)
(require 'semantic-ia)
(require 'ede)
(require 'ede-locate)

(semantic-gcc-setup)
(setq semantic-load-turn-everything-on t)
(semantic-load-enable-excessive-code-helpers)

(global-ede-mode 1)
(global-semantic-idle-completions-mode nil)

(defvar semantic-tags-location-ring (make-ring 20))

(when (cedet-gnu-global-version-check t)
  (require 'semanticdb-global)
  (add-to-list 'ede-locate-setup-options 'ede-locate-global)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

(when (cedet-cscope-version-check t)
  (require 'semanticdb-cscope)
  (semanticdb-enable-cscope-databases)
  (add-to-list 'ede-locate-setup-options 'ede-locate-cscope))

(require 'semanticdb-ectag)
(when (semantic-ectag-version)
  (semantic-load-enable-primary-exuberent-ctags-support)
  (semantic-load-enable-secondary-exuberent-ctags-support))

(when (cedet-idutils-version-check t)
  (add-to-list 'ede-locate-setup-options 'ede-locate-idutils))


(when (executable-find "locate")
  (add-to-list 'ede-locate-setup-options 'ede-locate-locate))

;; (global-set-key "\C-\M-x" 'semantic-analyze-proto-impl-toggle)
;; (global-set-key [(control  <)] 'semantic-goto-definition)
;; (global-set-key [(control  >)] 'semantic-pop-tag-mark)

(global-semantic-tag-folding-mode)
(global-semantic-idle-completions-mode)
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
(global-srecode-minor-mode 1)
(global-semantic-idle-completions-mode nil nil (semantic-idle))
(global-semantic-idle-local-symbol-highlight-mode 
       t nil (semantic-idle))
(global-semantic-idle-summary-mode 
       t nil (semantic-idle))
(global-semantic-idle-tag-highlight-mode 
       t nil (semantic-idle))
(global-semantic-stickyfunc-mode 
       nil nil (semantic-util-modes))
(semantic-idle-scheduler-work-idle-time 15)
(semanticdb-default-save-directory 
       "~/.emacs.d/cache")
(semanticdb-default-system-save-directory 
       "~/.emacs.d/cache/system")