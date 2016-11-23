;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting home directory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cd "c:/Users/takuya/Skydrive")
(setq gtags-path-style 'relative)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-language-environment "Japanese")

(prefer-coding-system 'utf-8)
;(prefer-coding-system 'cp932)

;; enable-BackSpace
(load "term/bobcat")
(global-set-key "\C-h" 'delete-backward-char)


;; $B%U%)%s%H@_Dj(B
(when (eq system-type 'windows-nt)
  ;; ascii$B%U%)%s%H$r(BConsolas$B$K(B
  (set-face-attribute 'default nil
                      :family "Consolas"
                      :height 120)
  ;; $BF|K\8l%U%)%s%H$r%a%$%j%*$K(B
  (set-fontset-font
   nil
   'japanese-jisx0208
   (font-spec :family "Meiryo"))
  ;; $B%U%)%s%H$N2#I}$rD4@a$9$k(B
  (setq face-font-rescale-alist
        '((".*Consolas.*" . 1.0)
          (".*Meiryo.*" . 1.15)
          ("-cdac$" . 1.3))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting frame/window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq visible-bell 1)
;;; $B%D!<%k%P!<$rI=<($7$J$$(B
(tool-bar-mode 0)


;; $B=i4|%U%l!<%`$N@_Dj(B
(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "#000033")
		    '(border-color . "white")
		    '(mouse-color . "pink")
		    '(cursor-color . "#ffffcc")
		    '(width . 84)
		    '(height . 44)
		    '(top . 10)
		    '(alpha . 80)
		    '(left . 10))
	      default-frame-alist))

;; $B%U%l!<%`$K%U%!%$%k$N@dBP%Q%9I=<((B
(setq frame-title-format "%f")


;; isearch $B$G$9$0$K%O%$%i%$%H$9$k(B
(setq lazy-highlight-initial-delay 0)

;;$B9T4V$rD4@a(B
(setq-default line-spacing 1)


;;$B0J2<$ODI2C$5$l$?9`L\$J$I$N%a%b(B
;;$B9TKv$N%9%Z!<%9$r6/D4I=<(!%$?$@$7!$%P%C%U%!%m!<%+%k(B
(setq-default show-trailing-whitespace t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting load-path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-path (append '("~/.emacs.d/elisp/" "~/.emacs.d/") load-path))
;; user-emacs-directory$BJQ?t$,L$Dj5A$N$?$a<!$N@_Dj$rDI2C(B
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; load-path $B$rDI2C$9$k4X?t$rDj5A(B
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; $B0z?t$N%G%#%l%/%H%j$H$=$N%5%V%G%#%l%/%H%j$r(Bload-path$B$KDI2C(B
(add-to-load-path "elisp" "conf" "public_repos")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; setting shell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;; Cygwin $B$N(B bash $B$r;H$&>l9g(B
;;(setq explicit-shell-file-name "bash.exe")
;;(setq shell-file-name "sh.exe")
;;(setq shell-command-switch "-c") 

;; shell $B$N%3%^%s%I$N8e$K(B ^M $B$,IU2C$5$l$F$7$^$&LdBj$N2r7h(B 
(modify-coding-system-alist 'process ".*sh\\.exe" '(undecided-dos . undecided-unix))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; setting indent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B2~9T8e%$%s%G%s%H(B
(global-set-key "\C-m" 'newline-and-indent)

;; C$B!"(BC++$B!"(BJAVA$B!"(BPHP$B$J$I$N%$%s%G%s%H(B
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "bsd")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; setting hilight                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; P100 $B8=:_9T$N%O%$%i%$%H(B
(defface my-hl-line-face
  ;; $BGX7J$,(Bdark$B$J$i$PGX7J?'$r:0$K(B
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; $BGX7J$,(Blight$B$J$i$PGX7J?'$rNP$K(B
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; P101 $B3g8L$NBP1~4X78$N%O%$%i%$%H(B
;; paren-mode$B!'BP1~$9$k3g8L$r6/D4$7$FI=<($9$k(B
(setq show-paren-delay 0) ; $BI=<($^$G$NIC?t!#=i4|CM$O(B0.125
(show-paren-mode t) ; $BM-8z2=(B
;; paren$B$N%9%?%$%k(B: expression$B$O3g8LFb$b6/D4I=<((B
(setq show-paren-style 'expression)
;; $B%U%'%$%9$rJQ99$9$k(B
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;$B%F%s%W%l!<%HA^F~(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;time-stamp
(define-key global-map [f5]
  '(lambda()
     (interactive)
     (insert (format-time-string "%Y/%m/%d %H:%M:%S"))))


;;partition
(define-key global-map [f6]
  '(lambda()
     (interactive)
     (insert  ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")))














;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B2hA|%U%!%$%k$rI=<((B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; find-file $B$G2hA|$,8+$l$^$9(B
(auto-image-file-mode)

;;;add;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;emacs-lisp-mode-hook$BMQ$N4X?t$rDj5A(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiple-p t)
    (turn-on-eldoc-mode)))

;;emacs-lisp-mode$B$N%U%C%/$r%;%C%H(B
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-install$B@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (add-to-list 'load-path auto-install-directory)
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;package.el$B@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6.2 anything
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B"'MW3HD%5!G=%$%s%9%H!<%k"'(B
;;; P122-129 $B8uJdA*Br7?%$%s%?%U%'!<%9(!(!(BAnything
;; (auto-install-batch "anything")
(when (require 'anything nil t)
  (setq
   ;; $B8uJd$rI=<($9$k$^$G$N;~4V!#%G%U%)%k%H$O(B0.5
   anything-idle-delay 0.3
   ;; $B%?%$%W$7$F:FIA<L$9$k$^$G$N;~4V!#%G%U%)%k%H$O(B0.1
   anything-input-idle-delay 0.2
   ;; $B8uJd$N:GBgI=<(?t!#%G%U%)%k%H$O(B50
   anything-candidate-number-limit 100
   ;; $B8uJd$,B?$$$H$-$KBN46B.EY$rAa$/$9$k(B
   anything-quick-update t
   ;; $B8uJdA*Br%7%g!<%H%+%C%H$r%"%k%U%!%Y%C%H$K(B
   anything-enable-shortcuts 'alphabet)

  (when (require 'anything-config nil t)
    ;; root$B8"8B$G%"%/%7%g%s$r<B9T$9$k$H$-$N%3%^%s%I(B
    ;; $B%G%U%)%k%H$O(B"su"
    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)

  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (require 'anything-migemo nil t))

  (when (require 'anything-complete nil t)
    ;; lisp$B%7%s%\%k$NJd408uJd$N:F8!:w;~4V(B
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    ;; describe-bindings$B$r(BAnything$B$KCV$-49$($k(B
    (descbinds-anything-install)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; smart-compile
;; (require 'smart-compile)
;; (define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
;; (define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  howm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; howm$B%a%bJ]B8$N>l=j(B
(setq howm-directory (concat user-emacs-directory "howm"))
;; howm-menu$B$N8@8l$rF|K\8l$K(B
(setq howm-menu-lang 'ja)
;; howm$B%a%b$r#1F|#1%U%!%$%k$K$9$k(B
(setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-mode$B$rFI$_9~$`(B
(when (require 'howm-mode nil t)
  ;; C-c,,$B$G(Bhowm-menu$B$r5/F0(B
  (define-key global-map (kbd "C-c ,,") 'howm-menu))







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;emacsclient$B;H$($k$h$&$K$9$k(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (require 'server)
 (unless (server-running-p)
   (server-start))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting esup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'esup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js2-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting elscreen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; $B%W%l%U%#%/%9%-!<$O(BC-z
;; (setq elscreen-prefix-key (kbd "C-z"))
;; (elscreen-start)
;; ;;; $B%?%V$N@hF,$K(B[X]$B$rI=<($7$J$$(B
;; (setq elscreen-tab-display-kill-screen nil)
;; ;;; header-line$B$N@hF,$K(B[<->]$B$rI=<($7$J$$(B
;; (setq elscreen-tab-display-control nil)
;; ;;; $B%P%C%U%!L>!&%b!<%IL>$+$i%?%V$KI=<($5$;$kFbMF$r7hDj$9$k(B($B%G%U%)%k%H@_Dj(B)
;; (setq elscreen-buffer-to-nickname-alist
;;       '(("^dired-mode$" .
;;          (lambda ()
;;            (format "Dired(%s)" dired-directory)))
;;         ("^Info-mode$" .
;;          (lambda ()
;;            (format "Info(%s)" (file-name-nondirectory Info-current-file))))
;;         ("^mew-draft-mode$" .
;;          (lambda ()
;;            (format "Mew(%s)" (buffer-name (current-buffer)))))
;;         ("^mew-" . "Mew")
;;         ("^irchat-" . "IRChat")
;;         ("^liece-" . "Liece")
;;         ("^lookup-" . "Lookup")))
;; (setq elscreen-mode-to-nickname-alist
;;       '(("[Ss]hell" . "shell")
;;         ("compilation" . "compile")
;;         ("-telnet" . "telnet")
;;         ("dict" . "OnlineDict")
;;         ("*WL:Message*" . "Wanderlust")))


;;;
;;; end of file
;;;



(global-set-key (kbd "C-c a") 'align)
(setq make-backup-files nil)
(setq inhibit-startup-message t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; setting Ruby
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;
;; ;;(setq auto-mode-alist
;; ;;       (cons (cons "\\.rb$" 'ruby-mode) auto-mode-alist))
;; ;; (autoload 'ruby-mode "ruby-mode" "Mode for editing ruby sources" t)

;; ;; ;; CGI $B$b(B ruby-mode $B$GJT=8$9$k(B
;; ;; (setq auto-mode-alist
;; ;;       (cons (cons "\\.cgi$" 'ruby-mode) auto-mode-alist))
;; ;; (autoload 'ruby-mode "ruby-mode" "Mode for editing CGI sources" t)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; setting YaTeX
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq auto-mode-alist
;;       (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; (setq load-path (cons (expand-file-name "/usr/local/Meadow/site-lisp/yatex") load-path))
