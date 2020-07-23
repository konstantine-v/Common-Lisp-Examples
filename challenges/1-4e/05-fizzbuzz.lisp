;; Loop 100 times

(defun fizzbuzz()
  (loop for x upto 100 do
    (princ (cond
             ((zerop (mod x 15)) "fizzbuzz")
             ((zerop (mod x 5))  "fizz")
             ((zerop (mod x 3))  "buzz")
             (t x)))
 (terpri)))
(fizzbuzz)

;; Notes
;; Learning about mod vs / when dividing, and using zerop as well
;; I need to read more into princ vs other print macros
