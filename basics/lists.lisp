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
;; Alternative way to see it
(cons 1
      (cons 2
            (cons 3 nil)))
;; or of course
(list 1 2 3) ; => (1 2 3)
;; This will be covered in the next section


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


;; Sorts and list manipulation
(defparameter *l* (list 1 3 2 4)) ; A list out of order
;; If we try this...
(sort *l* #'<) ; => (1 2 3 4)
;; But if we reference the list in the REPL
(*l*) ; => (4) That's not right
;; To fix this we must overwrite the parameter or set it to a new one
(setq *l* (sort *l* #'<)) ; Now it's set


;; Bonus - Vectors
;; Vectors are fixed-sized lists
(vector 1 2 3 4)
;; Alternatively you can write vectors using the #() notation, both are valid however #() is literal
;; and the vector method is preferred when programming.
#(1 2 3 4)

;; One thing that is great about vectors is that you can initialize an empty vector with
;; the size you want it before even filing it. An example of that:
(setq *vec* (make-array 5 :fill-pointer 0)) ; Make vector size of 5 with nothin inside
(write *vect*) ; => #()

;; To fill the vector you can use VECTOR-PUSH
(vector-push 1 *vect*)
(vector-push 2 *vect*)
(vector-push 3 *vect*)
(write *vect*) ; => #(1 2 3)

;; To remove a specific element you can use VECTOR-POP
(vector-pop 3 *vect*)
(write *vect*) ; => #(1 2)

