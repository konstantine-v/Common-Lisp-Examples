;; Collatz conjecture

;; First try
(defun collatz (x max)
  (loop for i from 1 upto max do
    (print (if (evenp x) (setq x (truncate x 2)) (setq x (+ (* x 3) 1))))))

;; Rewrite of the collatz conjecture
(defun alt-collatz (n max)
  "Loop to get all the numbers from the Collatz Conjecture in a list.
N being the starting number.
MAX being the amount of items you want in the list."
  (loop :repeat max
        :collect (if (evenp n) (setq n (truncate x 2))
                     (setq n (+ (* x 3) 1)))))
;; I find it better to have all the numbers displayed in list

;; Bonus: Plot to GnuPlot
