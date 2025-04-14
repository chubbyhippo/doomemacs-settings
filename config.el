;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-acario-dark)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.2)

;; Enable relative line numbers globally
(setq display-line-numbers-type 'relative) ;; Set line numbers to relative
(global-display-line-numbers-mode 1)       ;; Enable line numbers globally

;; Custom C-u and C-d behavior in evil mode
(defun my-c-u-and-zz ()
  "Perform C-u action (scroll up) and then call zz."
  (interactive)
  (evil-scroll-up nil)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defun my-c-d-and-zz ()
  "Perform C-d action (scroll down) and then call zz."
  (interactive)
  (evil-scroll-down nil)
  (evil-scroll-line-to-center (line-number-at-pos)))

(with-eval-after-load 'evil
  ;; Replace C-u behavior
  (define-key evil-normal-state-map (kbd "C-u") 'my-c-u-and-zz)
  (define-key evil-motion-state-map (kbd "C-u") 'my-c-u-and-zz)

  ;; Replace C-d behavior
  (define-key evil-normal-state-map (kbd "C-d") 'my-c-d-and-zz)
  (define-key evil-motion-state-map (kbd "C-d") 'my-c-d-and-zz))

;; Rebind `n` and `N` to center after jumping to search matches
(with-eval-after-load 'evil
  ;; Rebind `n` to jump to the next search match and center the screen
  (define-key evil-normal-state-map (kbd "n")
    (lambda ()
      (interactive)
      (evil-search-next)
      (evil-scroll-line-to-center (line-number-at-pos))))

  ;; Rebind `N` to jump to the previous search match and center the screen
  (define-key evil-normal-state-map (kbd "N")
    (lambda ()
      (interactive)
      (evil-search-previous)
      (evil-scroll-line-to-center (line-number-at-pos)))))

