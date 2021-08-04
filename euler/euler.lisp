;;;; Project Euler

;; (mapc #'ql:quickload '(:cl-fad :cl-who :hunchentoot :parenscript))

(defpackage #:euler
  (:use #:cl)
  (:export :three-or-five))
(in-package :euler)

;;;; 1
(defun three-or-five (n)
  "Find the sum of all the multiples of 3 or 5 below N.
N is the max number to go to in the loop (ie. 10, 100, 1000, etc)"
  (loop :for i :from 1 :below n
        :when (or (zerop (mod i 5))
                  (zerop (mod i 3)))
          :sum i))
;; (THREE-OR-FIVE 1000) ;=> 233168

;;;; 2
;; First attempt
;; (defun fibonacci-even (limit)
;;   "Given the fibonacci sequence, return the even numbers less than 4 million."
;;   (let ((phi (/ (+ 1 (swrt 5)))))
;;     (loop :for i :from 1 :to 100
;;           :for x = (floor (/ (- (expt phi i)
;;                                 (expt (- 1 phi) i))
;;                              (sqrt 5)))
;;           :when (and (evenp x)
;;                      (< x limit))
;;             :sum x)))

;; Second Attempt
;; Based on https://www.xarg.org/puzzle/project-euler/problem-2/
(defun fibonacci-even (x)
  "Given the fibonacci sequence, return the even numbers less than 4 million."
  (let ((sr5 (sqrt 5)))
    (let ((phi (/ (+ 1 sr5)))
          (psi (/ (- 1 sr5))))
      (flet ((F (n) (/ (- (expt phi n)
                          (expt psi n))
                       sr5)))
        (round (/ (F (- (+ ((lambda () (floor (log (/ (+ (* x sr5) 0.5)
                                                   phi)))))
                        2)
                      1))
                  2))))))
;; (FIBONACCI-EVEN 4e6)
;; This is still not correct, there's something wrong in the logic
;; perhaps something wrong with floating numbers or the way I'm handling it all together
