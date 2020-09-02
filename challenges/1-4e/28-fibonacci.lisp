;; Fibonacci Sequence
(defparameter phi 1.6180339887)

(defun fibo (length)
  "LENGTH: Is the length you want the array to be."
  (loop for x from 1 to length
        collect (floor (/ (- (expt phi x)
                             (expt (- 1 phi) x))
                          (sqrt 5)))))
