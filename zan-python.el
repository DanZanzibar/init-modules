;; All things Python.


;; A run python command that allows specifying the interpreter version.

(defun zanf-run-python--get-interpreter ()
  (completing-read "Which version? (default python3) :"
		   (directory-files "/usr/bin/" nil "^python.+")
		   nil t "python3" nil "python3"))

(defun zanf-run-python ()
  (interactive)
  (run-python (zanf-run-python--get-interpreter) nil t))


;; Pyvenv

(setenv "WORKON_HOME" "~/sync-general/.venvs/")
(zanm-package pyvenv)


;; Keybindings
(with-eval-after-load 'python
  (keymap-set python-mode-map "C-c v" 'pyvenv-workon)
  (keymap-set python-mode-map "C-c p" 'zanf-run-python))


(provide 'zan-python)
