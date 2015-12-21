;; spacemacs-private/c-c++-enhance/packages.el
;;; packages.el --- C/C++ Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar c-c++-enhance-packages
  '(
    cc-mode
    cmake-mode
    company
    company-c-headers
    flycheck
    stickyfunc-enhance
    ;; my custom package
    ; irony
    ; company-irony
    ; flycheck-irony
    google-c-style
    helm-make
    helm-gtags
    ggtags
    rtags
    ws-butler
    gdb-mi
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(unless (version< emacs-version "24.4")
  (add-to-list 'c-c++-enhance-packages 'srefactor)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))


(defun c-c++-enhance/init-cc-mode ()
  (use-package cc-mode
    :defer
    :config
    (progn
      (require 'compile)
      ;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
      (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
      (semantic-mode 1)
      (c-toggle-auto-newline 1)
      (setq srecode-map-save-file (concat spacemacs-cache-directory "srecode-map.el"))
      (setq semanticdb-default-save-directory (concat spacemacs-cache-directory "semanticdb/"))
      (evil-leader/set-key-for-mode 'c-mode
        "mga" 'projectile-find-other-file
        "mgA" 'projectile-find-other-file-other-window
        "mc" 'projectile-compile-project
        "mp" 'projectile-run-project)
      (evil-leader/set-key-for-mode 'c++-mode
        "mga" 'projectile-find-other-file
        "mgA" 'projectile-find-other-file-other-window
        "mc" 'projectile-compile-project
        "mp" 'projectile-run-project)

      ;; http://emacswiki.org/emacs/CompileCommand
      ;; auto generate configuration 

      ;; set innamespace indent to 0
      (defconst my-cc-style
        '("cc-mode"
          (c-offset-alist , ((innamespace . [0])))))
      (c-add-style "my-cc-style" my-cc-style)
      (add-hook 'c-mode-hook
                (lambda ()
                  (unless (file-exists-p "Makefile")
                    A
                    (set (make-local-variable 'compile-command)
                         ;; emulate make's .c.o implicit pattern rule, but with
                         ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                         ;; variables:
                         ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
                         (let ((file (file-name-nondirectory buffer-file-name)))
                           (format "%s -o %s.o %s %s %s"
                                   (or (getenv "CC") "clang")
                                   (file-name-sans-extension file)
                                   (or (getenv "CPPFLAGS") "-DDEBUG=9")
                                   (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
                                   file))))))
      (add-hook 'c++-mode-hook
                (lambda ()
                  (unless (file-exists-p "Makefile")
                    (set (make-local-variable 'compile-command)
                         ;; emulate make's .c.o implicit pattern rule, but with
                         ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                         ;; variables:
                         ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
                         (let ((file (file-name-nondirectory buffer-file-name)))
                           (format "%s -o %s.o %s %s %s"
                                   (or (getenv "CC") "g++")
                                   (file-name-sans-extension file)
                                   (or (getenv "CPPFLAGS") " -DDEBUG=9")
                                   (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g -std=c++11")
                                   file))))))
      )))

(defun c-c++-enhance/init-cmake-mode ()
  (use-package cmake-mode
    :mode (("CMakeLists\\.txt\\'" . cmake-mode) ("\\.cmake\\'" . cmake-mode))
    :init (push 'company-cmake company-backends-cmake-mode)))

(defun c-c++-enhance/post-init-flycheck ()
  (spacemacs/add-to-hooks 'flycheck-mode '(c-mode-hook c++-mode-hook)))

; (defun c-c++-enhance/init-srefactor ()
;   (use-package srefactor
;     :defer t
;     :init
;     (progn
;       (evil-leader/set-key-for-mode 'c-mode
;         "mr" 'srefactor-refactor-at-point)
;       (evil-leader/set-key-for-mode 'c++-mode
;         "mr" 'srefactor-refactor-at-point))))

(defun c-c++-enhance/init-stickyfunc-enhance ()
  (use-package stickyfunc-enhance
    :defer t
    :init
    (progn
      (defun spacemacs/lazy-load-stickyfunc-enhance ()
        "Lazy load the package."
        (require 'stickyfunc-enhance))
      (spacemacs/add-to-hooks 'spacemacs/lazy-load-stickyfunc-enhance
                    '(c-mode-hook c++-mode-hook)))))
;;define my init hook
(defun c-c++-enhance/post-init-google-c-style ()
  (use-package google-c-style
    :init (add-hook 'c-mode-common-hook 'google-set-c-style)))
; (defun c-c++-enhance/init-irony ()
;   (use-package irony 
;     :diminish irony-mode
;     :defer t
;     :init
;     (progn
;       (add-hook 'c++-mode-hook 'irony-mode)
;       (add-hook 'c-mode-hook 'irony-mode)
;       ;;see https://github.com/Sarcasm/irony-mode/issues/154#issuecomment-100649914
;       ;;just use .clang_complete from now on
;       ;; cannnot support json format. it is unstable at <2015-05-11 一>


;       ;; replace the 'completion at point ' and 'complete-symbol' bindings in
;       ;; irony mode's buffers ny irony-mode's function
;       (defun my-irony-mode-hook ()
;         (define-key irony-mode-map [remap completion-at-point]
;           'irony-completion-at-point-async)
;         (define-key irony-mode-map [remap complete-symbol]
;           'irony-completion-at-point-async))
;       (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;       (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;       (spacemacs|diminish irony-mode " Ⓘ" " I"))))

; (defun c-c++-enhance/init-company-irony ()
;   (use-package company-irony
;     :defer t))
; (when (configuration-layer/layer-usedp 'syntax-checking)
;   (defun c-c++-enhance/init-flycheck-irony ()
;     (use-package flycheck-irony
;       :if (configuration-layer/package-usedp 'flycheck)
;       :defer t
;       :init (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))))
; (defun c-c++-enhance/post-flycheck-irony ()
;   (use-package flycheck
;     :defer t
;     :config (add-hook 'flycheck-mode-hook 'flycheck-irony-hook)))
(defun c-c++-enhance/init-ggtags ()
  (use-package ggtags
    :defer t))
(defun c-c++-enhance/init-rtags ()
  (use-package rtags
    :init (require 'company-rtags)
    :config
    (progn
      (evil-leader/set-key-for-mode 'c-mode "mi" 'rtags-imenu)
      (evil-leader/set-key-for-mode 'c++-mode "mi" 'rtags-imenu)
      (define-key evil-normal-state-map (kbd "<C-return>") 'rtags-show-target-in-other-window)
      (define-key evil-normal-state-map (kbd "M-.") 'rtags-find-symbol-at-point))))
(defun c-c++-enhance/init-helm-make ()
  (use-package helm-make
    :defer t))

(defun c-c++-enhance/init-ws-butler ()
  (use-package ws-butler
    :diminish ws-butler-mode
    :init(progn
           (add-hook 'c-mode-common-hook 'ws-butler-mode)
           (add-hook 'cython-mode-hook 'ws-butler-mode))))

;; no auto-complete-mode at all
(when (configuration-layer/layer-usedp 'auto-completion)
  (defun c-c++-enhance/post-init-company ()
    ;; push this backend by default

    ; (push 'company-irony company-backends-c-mode-common)
    (spacemacs|add-company-hook c-mode-common)
    (spacemacs|add-company-hook cmake-mode)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 1)
    ; (push '(company-irony :with company-yasnippet)
    (push '(company-yasnippet company-keywords company-gtags company-etags company-dabbrev-code)
          company-backends-c-mode-common)


    (setq company-clang-prefix-guesser 'company-mode/more-than-prefix-guesser))

  (defun c-c++-enhance/init-company-c-headers ()
    (use-package company-c-headers
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :init (push 'company-c-headers company-backends-c-mode-common)))
  (defun c-c++-enhance/init-gdb-mi ()
    (use-package gdb-mi
      :defer t
      :init
      (setq
       ;; use gdb-many-windows by default when `M-x gdb'
       gdb-many-windows t
       ;; Non-nil means display source file containing the main routine at startup
       gdb-show-main t))))
(defun c-c++-enhance/post-init-srefactor ()
  (evil-leader/set-key-for-mode 'c-mode "mr" 'srefactor-refactor-at-point)
  (evil-leader/set-key-for-mode 'c++-mode "mr" 'srefactor-refactor-at-point)
  (spacemacs/add-to-hooks 'spacemacs/lazy-load-srefactor '(c-mode-hook c++-mode-hook)))

(defun c-c++-enhance/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'c-mode)
  (spacemacs/helm-gtags-define-keys-for-mode 'c++-mode)
  (define-key evil-normal-state-map (kbd "M-,") 'helm-gtags-dwim))




