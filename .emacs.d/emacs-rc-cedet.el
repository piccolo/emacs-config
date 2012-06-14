;; Handles the CEDET configuration
(load-file "~/.emacs.d/cedet-1.0.1/common/cedet.el")
 
(semantic-load-enable-excessive-code-helpers)
(global-srecode-minor-mode 1)

(require 'semantic-ia)

(require 'semantic-gcc)

;; custom key bindings for smart completion
(global-set-key "\C-x\C-m" 'semantic-ia-complete-symbol-menu)
;; Loading EDE package
(require 'ede)

(global-ede-mode t)

;; cpp-tests project definition
(when (file-exists-p "~/work/src/ovd-proxy/CMakeLists.txt")
  (setq cpp-tests-project
	(ede-cpp-root-project "ovd-proxy"
						  :name "ovd-proxy"
						  :file "~/work/src/ovd-proxy/CMakeLists.txt"
						  :include-path '("~/work/src/ovd-proxy/"
										  "~/work/src/ovd-proxy/common"
										  "~/work/src/ovd-proxy/rdpproxy/include"
										  "~/work/src/ovd-proxy/gui/include")
						  )))
