;; Temperature conversion from F->C
(defparameter *temp* 0)
(defparameter *unit* "")

(defun temp-conv (temp unit)
  (cond
    ((= unit 0) (setq *temp* (* (- temp 32) 0.56)) (setq *unit* "C"))  ; F -> C
    ((= unit 1) (setq *temp* (+ (* temp 1.8) 32)) (setq *unit* "F"))) ; C -> F
  (format t "~%~a ~a~%" *temp* *unit*))                   ; print

;; Notes
;; To include kelvin or others I would just rewrite the (temp-conv) to include another unit,
;; then have nested conditionals to evaluate for each case.

;; Tests
(temp-conv 200 0)
(temp-conv 200 1)
(temp-conv 78 1)
(temp-conv 45 1)
(temp-conv 45 0)
