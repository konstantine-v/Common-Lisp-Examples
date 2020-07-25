;;; Lisp and List Processing Ch12

;; CONS
(cons 1 2) ; => (1 . 2)

;; The values in a CONS are CAR and CDR
;; CAR
(car (cons 1 2)) ; => 1
(cdr (cons 1 2)) ; => 2

;; You can SETF these variables
(defparameter *cons* (cons 1 2)) ; => (1 . 2)
(setf (car *cons*) 10)            ; => (10 . 2)
(setf (cdr *cons*) 13)            ; => (10 . 13)


;; You use CONS to store objects, so you can store nested cons
(cons 1 (cons 2 (cons 3 nil))) ; (1 2 3) => (1 (2 (3 nil))) each obj in the array

;; LIST
;; You know these
(list 1 2 3) ; You know what this looks like

;; So now you can take what you know of CONS with it CAR anf CDR and apply that to lists
;; LIST has similar attributes such as FIRST and REST
(defparameter *lis* (list 1 2 3 4))
(first *lis*)        ; => 1
(rest *lis*)         ; => (2 3 4)
(first (rest *lis*)) ; => 2

;; Cons can hold objects of any value, so you can build lists like you would array in json
(list "foobar" (list "foo" "bar") "baz")
;; (list "foo" (list 1 2) 10) ==> ("foo" (1 2) 10)\


;; APPEND
;; This allows you to create a new list that is flattened, example
(append *lis* (list 5 6)) ; => (1 2 3 4 5 6)

;; NCONC
;; returns a concatenation of its list arguments.
(nconc *lis* (list 7 8)) ; => (1 2 3 4 5 6 7 8)
;; it's similar to append except that it actually sets the CDR of the list rather than just append


(defun upto (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (nreverse result)))

(setvar *main* (upto 10))

;; REMOVE - what you'd think
(delete 0 *main*)
