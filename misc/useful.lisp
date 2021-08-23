;; Useful Functions
;; A variety of useful Functions I've created, leaving them here for future reference

(defun avernum (x)
  "Get the average value from a list of numbers"
  #+CLISP (defun sumup (x)
            (if (equal x nil) 0
                (+ (car x) (sumup (cdr x)))))
  (if (equal x nil) 0
      (/ (sumup x) (list-length x))))
