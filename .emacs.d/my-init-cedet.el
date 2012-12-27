(require 'cedet)
(semantic-mode 1)
(global-ede-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-stickyfunc-mode -1)
(global-semantic-idle-summary-mode 1)
(global-semantic-mru-bookmark-mode 1)
(require 'semantic)
(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(require 'semantic/db)
(require 'semantic/db-global)

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)


(defun my-cedet-hook ()
  ;; Intellisense menu
  (local-set-key (read-kbd-macro "C-<return>") 'semantic-ia-complete-symbol-menu)
  ;;  jump to declaration of variable or function, whose name is under point
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle) ; swith to/from declaration/implement
  ;;
  (local-set-key "\C-ch" 'semantic-decoration-include-visit) ; visit the header file under point
  ;;
  ;; shows documentation for function or variable, whose names is under point
  (local-set-key "\C-cd" 'semantic-ia-show-doc)     ; in a separate buffer
  (local-set-key "\C-cs" 'semantic-ia-show-summary) ; in the mini-buffer
  (local-set-key (kbd "\C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "\C-c <right>") 'semantic-tag-folding-show-block)
  )

(add-hook 'c-mode-common-hook   'my-cedet-hook)
(add-hook 'lisp-mode-hook       'my-cedet-hook)
(add-hook 'scheme-mode-hook     'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)

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


(when (file-exists-p "~/work/src/new-ovd-proxy/ovd-proxy/CMakeLists.txt")
  (setq cpp-tests-project
	(ede-cpp-root-project "new-ovd-proxy"
			      :name "new-ovd-proxy"
			      :file "~/work/src/new-ovd-proxy/ovd-proxy/CMakeLists.txt"
			      :include-path '("~/work/src/new-ovd-proxy/ovd-proxy/"
					      "~/work/src/new-ovd-proxy/ovd-proxy/common"
					      "~/work/src/new-ovd-proxy/ovd-proxy/rdpproxy/include"
					      "~/work/src/new-ovd-proxy/ovd-proxy/gui/include")
			      )))

(when (file-exists-p "~/work/src/LightProxy/CMakeLists.txt")
  (setq cpp-tests-project
	(ede-cpp-root-project "light-proxy"
			      :name "light-proxy"
			      :file "~/work/src/LightProxy/CMakeLists.txt"
			      :include-path '("~/work/src/LightProxy/"
					      "~/work/src/LightProxy/common"
					      "~/work/src/LightProxy/rdpproxy/include"
					      "~/work/src/LightProxy/gui/include")
			      )))

(when (file-exists-p "~/work/src/xrdp/Makefile.am")
  (setq cpp-tests-project
		(ede-cpp-root-project "xrdp"
							  :name "xrdp"
							  :file "~/work/src/xrdp/Makefile.am"
							  :include-path '("~/work/src/xrdp/"
											  "~/work/src/xrdp/common"
											  "~/work/src/xrdp/libxrdp"
											  "~/work/src/xrdp/xrdp"
											  "~/work/src/xrdp/rdp")
							  )))
  
;; cpp-tests project definition
(when (file-exists-p "~/work/src/FreeRDP/CMakeLists.txt")
  (setq cpp-tests-project
	(ede-cpp-root-project "FreeRDP"
			      :name "FreeRDP"
			      :file "~/work/src/FreeRDP/CMakeLists.txt"
			      :include-path '("~/work/src/FreeRDP/"
								  "~/work/src/FreeRDP/channels"
								  "~/work/src/FreeRDP/include"
								  "~/work/src/FreeRDP/libfreerdp-cache"
								  "~/work/src/FreeRDP/libfreerdp-channels"
								  "~/work/src/FreeRDP/libfreerdp-codec"
								  "~/work/src/FreeRDP/libfreerdp-core"
								  "~/work/src/FreeRDP/libfreerdp-crypto"
								  "~/work/src/FreeRDP/libfreerdp-gdi"
								  "~/work/src/FreeRDP/libfreerdp-locale"
								  "~/work/src/FreeRDP/libfreerdp-rail"
								  "~/work/src/FreeRDP/libfreerdp-sspi"
								  "~/work/src/FreeRDP/libfreerdp-utils"
								  )
			      )))
;; cpp-tests project definition                                                                                                                                                                                                                                                                                                
(when (file-exists-p "~/work/src/ffmpeg")
  (setq cpp-tests-project
        (ede-cpp-root-project "ffmpeg"
                              :name "ffmpeg"
                              :file "~/work/src/ffmpeg/configure"
                              :include-path '("~/work/src/ffmpeg"
                                                                  "~/work/src/ffmpeg/libavcodec"
                                                                  "~/work/src/ffmpeg/libavdevice"
                                                                  "~/work/src/ffmpeg/libavfilter"
                                                                  "~/work/src/ffmpeg/libavutil"
                                                                  "~/work/src/ffmpeg/libpostproc"
                                                                  "~/work/src/ffmpeg/libswresample"
                                                                  "~/work/src/ffmpeg/libswscale"
                                                                  "~/work/src/ffmpeg/mt-work"
                                                                  "~/work/src/ffmpeg/presets"
                                                                  "~/work/src/ffmpeg/tests"
                                                                  "~/work/src/ffmpeg/tools"
                                                                  )
                              )))


;; --------------------------------
;; === ECB (Emacs Code Browser) ===
;; see http://ecb.sourceforge.net/
;; or  http://www.emacswiki.org/emacs/EmacsCodeBrowser
;; or  http://www.emacswiki.org/emacs/PracticalECB
(require 'ecb)

;; /!\ Caution on ECB variable configuration
;; see http://ecb.sourceforge.net/docs/setq-or-customize.html#setq-or-customize 
;; for the options that shouldn't be configured via setq ;(

;; --- ECB layout
(setq ecb-create-layout-file "~/.emacs.d/.ecb-user-layout.el") ; where my layout are saved
(setq ecb-windows-width 50)

;; create a simple special layout "falkor1"
;; +------+-------+--------------------------------------+
;; |              |                                      |
;; |              |                                      |
;; | Directories  |                                      |
;; |              |          Edit                        |
;; |              |                                      |
;; +------+-------+                                      |
;; |   History    |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+
(ecb-layout-define "falkor1" left nil
                   ;; The frame is already splitted side-by-side and point stays in the
                   ;; left window (= the ECB-tree-window-column)
                   
                   ;; Here is the creation code for the new layout
                   ;; 1. Defining the current window/buffer as ECB-methods buffer
                   (ecb-set-directories-buffer)
                   ;; 2. Splitting the ECB-tree-windows-column in two windows
                   (ecb-split-ver 0.75 t)
                   ;; 3. Go to the second window
                   (other-window 1)
                   ;; 4. Defining the current window/buffer as ECB-history buffer
                   (ecb-set-history-buffer)
                   ;; 5. Make the ECB-edit-window current (see Postcondition above)
                   (select-window (next-window)))

;; create another simple special layout "falkor2"
;; +------+-------+--------------------------------------+
;; |              |                                      |
;; | Directories  |                                      |
;; |              |                                      |
;; +------+-------+                                      |
;; |   History    |              Edit                    |
;; +------+-------+                                      |
;; |   Methods    |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+
(ecb-layout-define "falkor2" left nil
                   ;; The frame is already splitted side-by-side and point stays in the
                   ;; left window (= the ECB-tree-window-column)
                   
                   ;; Here is the creation code for the new layout
                   ;; 1. Defining the current window/buffer as ECB-methods buffer
                   (ecb-set-directories-buffer)
                   ;; 2. Splitting the ECB-tree-windows-column in two windows
                   (ecb-split-ver 0.5 t)
                   ;; 3. Go to the second window
                   (other-window 1)
                   ;; 4. Defining the current window/buffer as ECB-history buffer
                   (ecb-set-history-buffer)
                   ;; 5. Splitting the ECB-tree-windows-column in two windows
                   (ecb-split-ver 0.25 t)
                   ;; 6. Go to the third window
                   (other-window 1)
                   ;; 7. Defining the current window/buffer as ECB-y buffer
                   (ecb-set-methods-buffer)
                   ;; 8. Make the ECB-edit-window current (see Postcondition above)
                   (select-window (next-window)))

;;(setq ecb-show-sources-in-directories-buffer "falkor1")
(setq ecb-show-sources-in-directories-buffer "falkor")

;; see http://ecb.sourceforge.net/docs/Changing-the-ECB-layout.html for default
;; layout alternatives.
;; My personnal ECB layout (falkor), is as follows:
;; +------+-------+--------------------------------------+
;; |      |       |                                      |
;; | Dir  | Src   |                                      |
;; |      |       |                                      |
;; |      |       |                                      |
;; +------+-------+                                      |
;; |   History    |                 Edit                 |
;; |              |                                      |
;; +--------------+                                      |
;; |              |                                      |
;; |  Methods     |                                      |
;; |              |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+
;; You can easily create your own layout using M-x ecv-create-new-layout
;; see ~/emacs.d/custom.el for the configuration of my own layout

(setq ecb-history-sort-method nil)  ; No sorting, means the most recently used
                                        ; buffers are on the top of the history
                                        ; and the seldom used buffers at the bottom
(setq ecb-vc-enable-support t)          ; show versionning status of the files
                                        ; in the sources/hstory (SVN etc.)
;; autostart ECB on emacs startup (put to nil to desactivate)
;; (setq ecb-auto-activate t)

;; --- Annoyances
;; use the primary button to navigate in the source tree -- middle button otherwise (!?!)
(setq ecb-tip-of-the-day nil)           ; disable tips of the day

(global-set-key (kbd "\C-cm") 'ecb-goto-window-methods)
(global-set-key (kbd "\C-cE") 'ecb-goto-window-edit1)
(global-set-key (kbd "\C-cf") 'ecb-goto-window-sources)
(global-set-key (kbd "\C-cd") 'ecb-goto-window-directories)


(provide 'my-init-cedet)
;; ----------------------------------------------------------------------
;; eof
;;
;; Local Variables:
;; mode: lisp
;; End:

