;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)


(add-to-list 'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")t)

(package-initialize)

(require 'multi-term)

;;to make auctex runs properly	
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/:/usr/local/bin/"))  
(setq exec-path (append exec-path '(":/Library/TeX/texbin/:/usr/local/bin/")))
(setq preview-gs-command
       "/usr/local/bin/gs")
;;auto-complete and yasnippet for Latex
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete)
(add-to-list 'ac-modes 'latex-mode)



(require 'ac-math)
(defun my-ac-latex-mode () ; add ac-sources for latex
   (setq ac-sources
         (append '(ac-source-math-unicode
           ac-source-math-latex
           ac-source-latex-commands)
                 ac-sources)))

(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)

(ac-flyspell-workaround)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'prolog-mode)
(defun ac-org-mode-setup()
  add-to-list 'ac-sources 'ac-math-symbols-unicode)
(add-hook 'org-mode-hook 'ac-org-mode-setup)
(require 'auto-complete-config)
(ac-config-default)
;;enable yasnippet in auto-complete in all modes
(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

(setq ac-auto-show-menu t)
(global-auto-complete-mode t)


;;useful setting
(setq show-paren-delay 0)
(show-paren-mode 1)
(column-number-mode 1)
(electric-pair-mode 1)
(global-flycheck-mode 1)
(blink-cursor-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)

;;nlinum setting
(global-nlinum-mode 1)
;;avoid horizontal jump on scrolling
;; Preset `nlinum-format' for minimum width.
(defun my-nlinum-mode-hook ()
  (when nlinum-mode
    (setq-local nlinum-format
                (concat "%" (number-to-string
                             ;; Guesstimate number of buffer lines.
                             (ceiling (log (max 1 (/ (buffer-size) 80)) 10)))
                        "d"))))
(add-hook 'nlinum-mode-hook #'my-nlinum-mode-hook)
(setq nlinum-highlight-current-line t)

;;use c++11 for c++ mode
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

;;hightlight TODO in code
(defun highlight-todo()
  (font-lock-add-keywords nil '(("\\<\\(TODO\\):" 1 font-lock-warning-face prepend))))
(add-hook 'prog-mode-hook 'highlight-todo)

;;all-the-icons setting
(require 'all-the-icons)
(setq inhibit-compacting-font-caches t)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;;neotree setting
(global-set-key [f1] 'neotree-toggle)
(setq neo-theme 'icons)
;;doom-theme setting
(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-vibrant t)
(doom-themes-neotree-config)
(doom-themes-org-config)
;;org-mode setting
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;paragraph up/down keybinding
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<down>") 'forward-paragraph)

;;auctex setting
(setq TeX-auto-save t)
(setq TeX-parse-self t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1c1f24" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#DFDFDF"])
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a7e7804313dbf827a441c86a8109ef5b64b03011383322cbdbf646eb02692f76" "73e35ffa5ca98b57a9923954f296c3854ce6d8736b31fdbdda3d27502d4b4d69" "6be42070d23e832a7493166f90e9bb08af348a818ec18389c1f21d33542771af" default)))
 '(fci-rule-color "#62686E")
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet ac-math auctex multi-term zenburn-theme solarized-theme solaire-mode nlinum neotree flycheck doom-themes blackboard-theme auto-complete all-the-icons-dired)))
 '(vc-annotate-background "#1c1f24")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7bc275")
    (cons 40 "#a6c677")
    (cons 60 "#d1ca79")
    (cons 80 "#FCCE7B")
    (cons 100 "#f4b96e")
    (cons 120 "#eda461")
    (cons 140 "#e69055")
    (cons 160 "#db8981")
    (cons 180 "#d082ae")
    (cons 200 "#C57BDB")
    (cons 220 "#d874b0")
    (cons 240 "#eb6d86")
    (cons 260 "#ff665c")
    (cons 280 "#d15e59")
    (cons 300 "#a35758")
    (cons 320 "#754f56")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
