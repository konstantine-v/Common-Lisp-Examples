
(defparameter n1 0)
(defparameter n2 0)
(defparameter love 0)

(defun love-calc (name1 name2)
  "Love Calculator, that pointless thing that people make for sites or their portfolio"
  (setq n1 (length name1))
  (setq n2 (length name2))
  (cond
    ((= n1 n2)
     (setq love 100))
    (t (setq love (* n1 n2 1.045))))
  (cond ((> love 100) (setq love 100))
        ((< love 25) (setq love (random 100))))
  (format t "~%~a loves ~a about ~a\%~%" name1 name2 love))
