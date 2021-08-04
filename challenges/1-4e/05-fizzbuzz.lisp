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

;; Trying out using loop logic
(defun alt-fizzbuzz ()
  (loop :for x :from 1 :upto 100
        :when (zerop (mod x 15))
          :do (format t "~a, " "fizzbuzz")
        :when (zerop (mod x 5))
          :do (format t "~a, " "fizz")
        :when (zerop (mod x 3))
          :do (format t "~a, " "buzz")
        :do (format t "~a, " x)))

;; Better method for the loop logic
;; It's obviously nicer to return a list rather than formated text in most cases
(defun better-alt-fizzbuzz ()
  (loop :for x :from 1 :upto 100
        :when (zerop (mod x 15))
          :collect "fizzbuzz"
        :when (zerop (mod x 5))
          :collect "fizz"
        :when (zerop (mod x 3))
          :collect "buzz"
        :collect x))
