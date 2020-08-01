;; Collatz conjecture

(defun test (x max)
  (loop for i from 1 upto max do
    (print (if (evenp x) (setq x (truncate x 2)) (setq x (+ (* x 3) 1))))))

;; Bonus: Plot to GnuPlot
