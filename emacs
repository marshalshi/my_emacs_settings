;(require 'package)
;(add-to-list 'package-archives
;             '("marmalade" . "https://marmalade-repo.org/packages/") t)
;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/") t)


(setq-default indent-tabs-mode nil)

(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(global-set-key (kbd "RET") 'newline-and-indent)

;---------------auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)

(require 'python-mode)
; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)
;===============================yasnippet-bundle
(require 'yasnippet-bundle) 
;===============================gdb=================================
(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
  (c-toggle-auto-hungry-state 1)
  ;;按键定义
  ;(define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  ;(define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;(define-key c-mode-base-map [(tab)] 'hippie-expand);....
  ;(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  ;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(global-set-key [(f5)] 'speedbar)
;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)
;==================================gdb end=======================
;==================linum.el==================
(add-to-list 'load-path "~/.emacs.d/linum/linum.el")
(require 'linum)
;(global-linum-mode 1)
;=======================linum.el end===========
;------------------artist
(require 'artist)
;------------------artist end


(add-to-list 'load-path "~/.emacs.d/elpa/dash-2.11.0")
(add-to-list 'load-path "~/.emacs.d/elpa/s-1.10.0")

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/.virtualenvs/")



(add-to-list 'load-path "~/.emacs.d/plugins/ESS/lisp/")
(load "ess-site")

;(add-to-list 'load-path ".emacs.d/elpa/ein-20150914.1116/")
;(require 'ein)



; html 4 spaces indentation
(add-hook 'html-mode-hook
    (lambda ();; Default indentation is usually 2 spaces, changing to 4.
        (set (make-local-variable 'sgml-basic-offset) 4)))


(load "~/.emacs.d/site-lisp/tuareg-site-file")
