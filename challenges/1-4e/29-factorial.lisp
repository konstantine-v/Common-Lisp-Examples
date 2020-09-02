;; Factorials in Lisp
(defun fact (x)
  (reduce `* (loop for a
                   from x downto 1
                   collect a)))
;; An iterative approach by taking the numbers in the loop and multiplying them
;; much like in the factorial for 4! = 1*2*3*4
;; This basically does the reduce by doing (* 1 2 3 4)
;; I believe this allows for better control over other approaches and is cleaner
