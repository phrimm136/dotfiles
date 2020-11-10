;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smartparens
  :straight t
  :init (require 'smartparens-config)
  :setq ((sp-ignore-modes-list . '())
         (sp-escape-quotes-after-insert . nil))
  :config (progn (smartparens-global-strict-mode)
                 (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)))


;;; evil-mode integration

(leaf evil-smartparens
  :straight t
  :after smartparens
  :hook ((smartparens-enabled-hook . evil-smartparens-mode)))


;;; keymap

(defhydra hydra-smartparens-menu (:color cyan :hint nil)
  "
^Move^           ^Slurp/Barf^       ^Misc^
^^^^^^----------------------------------------------
_h_: beginning   _f_: slurp-for    _a_: absorb
_j_: next        _b_: slurp-back   _c_: concat
_k_: prev        _F_: barf-for     _r_: raise
_l_: end         _B_: barf-back    _s_: split
_H_: backward    ^ ^               _t_: transpose
_J_: down        ^ ^               _T_: transpose-hybrid
_K_: up          ^ ^               _p_: push
_L_: forward     ^ ^               ^ ^

"
  ("h" sp-beginning-of-sexp)
  ("j" sp-next-sexp)
  ("k" sp-previous-sexp)
  ("l" sp-end-of-sexp)
  ("H" sp-backward-sexp)
  ("J" sp-down-sexp)
  ("K" sp-backward-up-sexp)
  ("L" sp-forward-sexp)
  ("f" sp-forward-slurp-sexp)
  ("b" sp-backward-slurp-sexp)
  ("F" sp-forward-barf-sexp)
  ("B" sp-backward-barf-sexp)
  ("a" sp-absorb-sexp)
  ("c" sp-join-sexp) ; concat
  ("d" sp-kill-sexp)
  ("D" sp-kill-hybrid-sexp)
  ("r" sp-raise-sexp)
  ("s" sp-split-sexp)
  ("t" sp-transpose-sexp)
  ("T" sp-transpose-hybrid-sexp)
  ("p" sp-push-hybrid-sexp)
  ("u" undo "undo")
  ("q" nil "quit"))

(evil-leader/set-key
  "s" 'hydra-smartparens-menu/body)


;;; init-smartparens.el ends here
