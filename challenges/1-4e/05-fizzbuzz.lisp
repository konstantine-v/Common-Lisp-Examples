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
  "Fizzbuzz utilizing loop specific functions"
  (loop :for x :from 1 :upto 100
        :when (zerop (mod x 15))
          :do (format t "~a, " "fizzbuzz")
        :when (zerop (mod x 5))
          :do (format t "~a, " "fizz")
        :when (zerop (mod x 3))
          :do (format t "~a, " "buzz")
        :do (format t "~a, " x)))

;; Note: I find that the :for flag is better to read out than just the word

;; Better method for the loop logic
;; It's obviously nicer to return a list rather than formated text in most cases
(defun better-alt-fizzbuzz ()
  "Fizzbuzz utilizing loop specific functions and collecting into a list"
  (loop :for x :from 1 :upto 100
        :when (zerop (mod x 15))
          :collect "fizzbuzz"
        :when (zerop (mod x 5))
          :collect "fizz"
        :when (zerop (mod x 3))
          :collect "buzz"
        :collect x))

(defun recursive-fizzbuzz (x)
  "Trying out recursion"
  (cond ((zerop (mod x 15)) (and "fizzbuzz"
                                 (another-fizz (setq x (+ x 1))))
         (zerop (mod x 3)) (and "fizz"
                                (another-fizz (setq x (+ x 1))))
         (zerop (mod x 5)) (and "buzz"
                                (another-fizz (setq x (+ x 1))))
         (eq x 100) x
         (t (and x
                 (another-fizz (setq x (+ x 1))))))))
