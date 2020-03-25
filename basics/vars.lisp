;;;; Variables
;;;; This is reference to Chapter 6
;;;; There are two different types of variables that CL supports Lixical and Dynamic
;;;; Types don't have to be declaired since CL is synamically typed

;; LET - Simple assignment of variable(s)
;; (let (a 12) ...)
(defun foo (x)                         ; Pass in (x 1)
  (format t "Parameter:~5t~d~%" x)     ; => Parameter: 1
  (let ((x 2))                         ; Set x as 2, overwrites previous write of x, also NOTE scope
    (format t "Parameter:~5t~d~%" x)   ; => Parameter: 2
    (let ((x 3))                       ; ...
      (format t "Paameter:~5t~d~%" x))))

;; LET* - A different form of let that allows for top level variables to be used within, example:
(let* ((x 10)
       (y (+ x 10)))
  (list x y))
;; The same would be true for the below:
(let ((a 10))
  (let ((b (+ a 10)))
    (list a b)))


;; Lexical Variables
;; "Lexical scoped bindings help keep code understandable by limiting scope"
(defparameter *fn* (let ((i 0)) #'(lambda () (setf i (1+ i)))))
;; (duncall *fn*) => 1
;; (duncall *fn*) => 2
;; (duncall *fn*) => 3
;; Each time the Parameter is called it'll count up the index ie (i)

;; The above was an example of both lixical bindings as well as Global variables
;; Global variables can be set with either DEFVAR or DEVPARAMETER
;; Global variables are conventionally named with names that start and end with *

;; Examples of DEFVAR and DEFPARAMETER look like this:
(defvar *count* 0                  ; Defind *count* as 0 globally
  "Count of widgets made so far.") ; Comment of what it does

(defparameter *gap-tolerance* 0.001
  "Tolerance to be allowed in widget gaps.")

;; The difference between the two forms is that DEFPARAMETER always assigns the initial value
;; to the named variable while DEFVAR does so only if the variable is undefined. A DEFVAR form
;; can also be used with no initial value to define a global variable without giving it a value.
;; Such a variable is said to be unbound.
