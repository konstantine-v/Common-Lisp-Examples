;;;; Project Euler

;; (mapc #'ql:quickload '(:cl-fad :cl-who :hunchentoot :parenscript))

(defpackage #:euler
  (:use #:cl)
  (:export :three-or-five))
(in-package :euler)

;; #1
(defun three-or-five (n)
  "Find the sum of all the multiples of 3 or 5 below N.
N is the max number to go to in the loop (ie. 10, 100, 1000, etc)"
  (loop :for i :from 1 :below n
        :when (or (zerop (mod i 5))
                  (zerop (mod i 3)))
          :sum i))
