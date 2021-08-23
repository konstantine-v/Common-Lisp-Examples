;;;; Project Euler

;; (mapc #'ql:quickload '(:cl-fad :cl-who :hunchentoot :parenscript))

(defpackage #:euler
  (:use #:cl)
  (:export :run-project-euler-tests))
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
(defun fibonacci-even-first (limit)
  "Given the fibonacci sequence, return the even numbers less than 4 million."
  (let ((phi (/ (+ 1 (swrt 5)))))
    (loop :for i :from 1 :to 100
          :for x = (floor (/ (- (expt phi i)
                                (expt (- 1 phi) i))
                             (sqrt 5)))
          :when (and (evenp x)
                     (< x limit))
            :sum x)))

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


;;;; 3
;; First Attempt
(defun largest-prime-factor-first (x)
  (loop :for i :from 2 :upto (- x 1)
        :when (eql (mod x i) 0)
          :collect i))

;; Second Attempt
(defun largest-prime-factor (x)
  (loop :with x :for i :from 1 :upto (sqrt x) ;issue with x in this
        :when (and (= (mod x i) 0)
                   (let ((num i)) (and (> num 1)
                        (or (= num 2) (oddp num))
                        (loop for num from 3 to (isqrt num) by 2
                              never (zerop (rem num i))))))
          maximize i))

;; Trying out recursion
(defun large-prime-recur (num i)
  (when (and (< i num)
             (= (mod num i) 0))
             (and (princ-to-string num)
                  (large-prime (mod num i) (+ i 2)))))



;;; Tests
(defun run-project-euler-test ()
  "Runs the test for all project eular functions"
  (format t "#1: ~a" (three-or-five 1000))
  (format t "#2: ~a" (fibonacci-even 4e6))
  (format t "#3: ~a" (largest-prime-factor 600851475143)))
