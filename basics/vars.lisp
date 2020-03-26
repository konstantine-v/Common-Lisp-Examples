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

;; Simple example of global variable in use
(defvar *x* 10)
;; Just print the variable
(defun foo-defvar () (format t "~d~%" *x*))
;; (foo-defvar) => 10
;; Now let's see if we can change it within scope
(defun foo-change () ; Setup function
  (foo-defvar)              ; Print Global
  (let ((*x* 20))           ; Let be 20
    (foo-defvar)))          ; Print new value set
;; (foo--change) => Global: 10
;;                  New: 20
;; You can change Global values in the scope of the function.

;; As with lexical bindings, assigning a new value affects only the current binding.
;; To see this, you can redefine foo to include an assignment to *x*.
(defun new-val () (setf *x* (+ 1 *x*))) ; => 11
                                    ; => 12
                                    ; => etc...
;; Now the value will be set as the new incremented value.

;;;; Constants
;; CL allows for constant variables, which unlike other languages are global and readonly. Example:
(defconstant +NILLL+ NIL)
;; This should only be used for things that cannot be changed, I guess for such things as creating a lisp dialect or system settings
;; DEFPARAMETER should be used instead if you're thinking of using const.

;;;; Assignment
;; SETF - To assign a value to a variable
(setf xxx "Lewd")
;; If the value of a global variable needs to change then SETF is the way to go.

;; You can Assign multiple sets of data at once like below:
(setf apple 20 banana 33)

;; SETF returns the newly assigned value, so you can also nest calls to SETF as in the following expression,
;; which assigns both x and y the same random value:
(setf wumbo (setf yiff (random 10))) ; Both set to the same random integer

;;;; Other Ways To Modify Stuff
;; INCF & DECF - Increment/Decrement by a certain amount
;; (setf incval (setf dec (10))) ; Both set to the same integer
;; (incf incval)    ; === (setf x (+ x 1))
;; (decf decval)    ; === (setf x (- x 1))
;; (incf incval 10) ; === (setf x (+ x 10))

;;;; Summary of Variables
(setf         test 12)
;(let          test-two 12)
(defvar       *test* 12)
(defparameter *test-two* 12)
(defconstant  +test+ 12)

