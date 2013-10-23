;; unicad
(add-to-list 'load-path
	     "~/.emacs.d/plugins/unicad")
(require 'unicad)


;; =============================
;; autocomplete and yasnippet
;; =============================
;; yasnippet
(add-to-list 'load-path
	                   "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;; To use YASnippet as a non-global minor mode, replace (yas-global-mode 1) 
;; with (yas-reload-all) to load the snippet tables. Then add a call to 
;; (yas-minor-mode) to the major-modes where you to enable YASnippet.
;; (add-hook 'prog-mode-hook
;;           '(lambda ()
;;              (yas-minor-mode)))


;; auto-complete
(add-to-list 'load-path
              "~/.emacs.d/plugins/popup-el")
(require 'popup)

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/")
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-show-menu 0.3)
(auto-complete-mode)

(setq ac-modes
      (append ac-modes '(org-mode 
                         text-mode)))

;; =============================
;; el-get
;; =============================
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(el-get 'sync)


;; =====================
;; markdown
;; =====================

;; (define-key map (kbd "C-M-n") 'outline-next-visible-heading)
;; (define-key map (kbd "C-M-p") 'outline-previous-visible-heading)


;; =====================
;; 支持连续的non-prefix键
;; =====================
(require 'smartrep)


;; xcscope
(require 'xcscope)



;; =============================
;; others
;; =============================

(require 'ido)
(ido-mode t)

(require 'ecb)
(setq stack-trace-on-error t)
(setq ecb-layout-name 'left3)
;; (ecb-activate)

;; =============================
;; eclim
;; =============================
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-eclim/")
(require 'eclim)
(setq eclim-auto-save t)
(global-eclim-mode)

(custom-set-variables
 '(eclim-eclipse-dirs '("/opt/eclipse")))
(setq eclim-executable "/opt/eclipse/eclim") 
;;Displaying compilation error messages in the echo area

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; Configuring auto-complete-mode
;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;; ;; Configuring company-mode
;; (require 'company)
;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)
;; (global-company-mode t)



;; =============================
;; Ruby and Rails
;; =============================

;; rvm
(require 'rvm)
;; (rvm-use-default)
(rvm-use "ruby-1.9.3-p0" "rails3") 

(require 'haml-mode)
(require 'yaml-mode)
(require 'sass-mode)
(require 'feature-mode)
(require 'rspec-mode)
(require 'coffee-mode)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)

;; Files Types

;;coffee
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;rails
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

;; Yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(require 'color-theme)
(color-theme-railscasts)



;; org-mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(setq org-log-done 'time)
;; (setq org-log-done 'note)
(setq org-startup-indented t)

;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;; (setq org-agenda-files (list "~/gtd/work.org"
;;                              "~/gtd/study.org" 
;;                              "~/gtd/home.org"))

 
;; redo+
;; can not find in el-get, WHY???
;;(require 'redo+)
;;(global-set-key (kbd "C-?") 'redo)


;; ess
(add-to-list 'load-path "~/.emacs.d/plugins/ess/lisp")
(require 'ess-site)

;; can not find pymacs, so disable id. WHY?
;; python
;; (require 'pymacs)
;;   (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-shortcuts nil)
;;   (setq ropemacs-local-prefix "C-c C-p")
;; (ac-ropemacs-initialize)
;; (add-hook 'python-mode-hook
;;       (lambda ()
;;     (add-to-list 'ac-sources 'ac-source-ropemacs)))

;; ;; ===========================================
;; ;; 输入法
;; ;; 使用ibus来作为输入法，这样就可以使用google拼音
;; ;; F12开启 F11关闭
;; ;; ============================================
;; (require 'ibus)
;; ;; Turn on ibus-mode automatically after loading .emacs
;; (add-hook 'after-init-hook 'ibus-mode-on)
;; ;; Use C-SPC for Set Mark command
;; (ibus-define-common-key ?\C-\s nil)
;; ;; Use C-/ for Undo command
;; (ibus-define-common-key ?\C-/ nil)
;; ;; Change cursor color depending on IBus status
;; ;; (setq ibus-cursor-color '("red" "blue" "limegreen"))
;; (global-set-key [f12] 'ibus-enable)
;; (global-set-key [f11] 'ibus-disable)

;; essh 
(require 'essh)                                                    ;;
(defun essh-sh-hook ()                                             ;;
  (define-key sh-mode-map "\C-c\C-r" 'pipe-region-to-shell)        ;;
  (define-key sh-mode-map "\C-c\C-b" 'pipe-buffer-to-shell)        ;;
  (define-key sh-mode-map "\C-c\C-j" 'pipe-line-to-shell)          ;;
  (define-key sh-mode-map "\C-c\C-n" 'pipe-line-to-shell-and-step) ;;
  (define-key sh-mode-map "\C-c\C-f" 'pipe-function-to-shell)      ;;
  (define-key sh-mode-map "\C-c\C-d" 'shell-cd-current-directory)) ;;
(add-hook 'sh-mode-hook 'essh-sh-hook)  

;; ================================
;; 窗口管理
;; ================================
(add-to-list 'load-path
	     "~/.emacs.d/plugins/windresize-extension")
;; 使用windmove来移动窗口
;; 比如：
;;    S-<up>、S-<right>跳转到上面、右边的窗口
(windmove-default-keybindings)

;; S-up not work on terminal , so rebind
;; (global-set-key (kbd "C-c <left>")  'windmove-left)
;; (global-set-key (kbd "C-c <right>") 'windmove-right)
;; (global-set-key (kbd "C-c <up>")    'windmove-up)
;; (global-set-key (kbd "C-c <down>")  'windmove-down)


;; 打开winner-mode
;; 可以用C-x <left>和C-x <right>来对窗口布局实现undo/redo
(winner-mode t)

(require 'windresize-extension)

;;
;; 定义调节窗口的快捷键
;;

(define-prefix-command 'my-Cz-map)
(global-set-key (kbd "C-z") 'my-Cz-map)
(smartrep-define-key
    global-map "C-z" '(
                       ;; windows大小调整
                       ("C-+" . 'outward-window)
                       ("C--" . 'inward-window)
                       ("<C-kp-add>" . 'outward-window)
                       ("<C-kp-subtract>" . 'inward-window)
                       ;; windows的undo和redo
                       ("<C-left>" . 'winner-undo)
                       ("<C-right>" . 'winner-redo)
                       ;; windows間移動
                       ;; ("<M-left>" . 'win-prev-window)
                       ;; ("<M-right>" . 'win-next-window)
											 ))

(define-key
 global-map (kbd "C-z w") 'windresize)

;; end of 窗口管理

;; ;; =============================
;; ;; misc
;; ;; =============================



;; auto reload updated files
(global-auto-revert-mode t)

(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(setq column-number-mode t) 
(setq kill-ring-max 200)
(setq default-fill-column 60)
(setq scroll-margin 3
      scroll-conservatively 10000)
(set-scroll-bar-mode nil)
(mouse-wheel-mode t)
(setq auto-fill-mode nil)
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "%n%F/%b")
(auto-image-file-mode)
(global-font-lock-mode t)
(setq user-full-name "hongqing.chen")
(setq user-mail-address "hongqing.chen at gmail.com")

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
;;(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(display-time)

;;设置 sentence-end 可以识别中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil) 



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Auto-completion
;; ;;; Integrates:
;; ;;; 1) Rope
;; ;;; 2) Yasnippet
;; ;;; all with AutoComplete.el
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun prefix-list-elements (list prefix)
;;   (let (value)
;;     (nreverse
;;      (dolist (element list value)
;;       (setq value (cons (format "%s%s" prefix element) value))))))
;; (defvar ac-source-rope
;;   '((candidates
;;      . (lambda ()
;;          (prefix-list-elements (rope-completions) ac-target))))
;;   "Source for Rope")
;; (defun ac-python-find ()
;;   "Python `ac-find-function'."
;;   (require 'thingatpt)
;;   (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
;;     (if (null symbol)
;;         (if (string= "." (buffer-substring (- (point) 1) (point)))
;;             (point)
;;           nil)
;;       symbol)))
;; (defun ac-python-candidate ()
;;   "Python `ac-candidates-function'"
;;   (let (candidates)
;;     (dolist (source ac-sources)
;;       (if (symbolp source)
;;           (setq source (symbol-value source)))
;;       (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
;;              (requires (cdr-safe (assq 'requires source)))
;;              cand)
;;         (if (or (null requires)
;;                 (>= (length ac-target) requires))
;;             (setq cand
;;                   (delq nil
;;                         (mapcar (lambda (candidate)
;;                                   (propertize candidate 'source source))
;;                                 (funcall (cdr (assq 'candidates source)))))))
;;         (if (and (> ac-limit 1)
;;                  (> (length cand) ac-limit))
;;             (setcdr (nthcdr (1- ac-limit) cand) nil))
;;         (setq candidates (append candidates cand))))
;;     (delete-dups candidates)))
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;                  (auto-complete-mode 1)
;;                  (set (make-local-variable 'ac-sources)
;;                       (append ac-sources '(ac-source-rope)))
;;                  (set (make-local-variable 'ac-find-function) 'ac-python-find)
;;                  (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;;                  (set (make-local-variable 'ac-auto-start) nil)))



;; ;;;
;; ;; Smart Tab
;; ;; Taken from http://www.emacswiki.org/cgi-bin/wiki/TabCompletion
;; (global-set-key [(tab)] 'smart-tab)
;; (defvar smart-tab-completion-functions
;;   '((emacs-lisp-mode lisp-complete-symbol)
;;     (lisp-mode slime-complete-symbol)
;;     (python-mode rope-code-assist)
;;     (text-mode dabbrev-completion))
;;   "List of major modes in which to use a mode specific completion
;; function.")

;; (defun get-completion-function()
;;   "Get a completion function according to current major mode."
;;   (let ((completion-function
;;          (second (assq major-mode smart-tab-completion-functions))))
;;     (if (null completion-function)
;;         'dabbrev-completion
;;         completion-function)))

;; (defun smart-tab (prefix)
;;   "Needs `transient-mark-mode' to be on. This smart tab is
;; minibuffer compliant: it acts as usual in the minibuffer.

;; In all other buffers: if PREFIX is \\[universal-argument], calls
;; `smart-indent'. Else if point is at the end of a symbol,
;; expands it. Else calls `smart-indent'."
;;   (interactive "P")
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (smart-tab-must-expand prefix)
;;         (let ((dabbrev-case-fold-search t)
;;               (dabbrev-case-replace nil))
;;           (funcall (get-completion-function))))
;;     (smart-indent)))

;; (defun smart-tab-must-expand (&optional prefix)
;;   "If PREFIX is \\[universal-argument], answers no.
;; Otherwise, analyses point position and answers."
;;   (unless (or (consp prefix)
;;               mark-active)
;;     (looking-at "\\_>")))
;; (defun smart-indent ()
;;   "Indents region if mark is active, or current line otherwise."
;;   (interactive)
;;   (if mark-active
;;       (indent-region (region-beginning)
;;                      (region-end))
;;     (indent-for-tab-command)))










;;-------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left3")
 '(ecb-options-version "2.40")
 '(org-agenda-files (quote ("~/Org-mode.org" "~/gtd/work.org" "~/gtd/study.org" "~/gtd/home.org")))
 '(py-shell-name "ipython"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
