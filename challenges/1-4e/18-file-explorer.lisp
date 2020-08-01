;; Simple File Explorer
;; Utilizing UIOP within SBCL
(defun ls (&optional dir)
  (if (null dir) (setq dir "."))
  (uiop:directory-files dir))
