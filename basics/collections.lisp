;;;; Collections
;;;; How lisp will get and set collections of data including arrays and vecotrs

;;; Vector
;;; vectors are integer0indexed collections
;;; You can make fixed-sized vactors by calling vecotr and passing parameters
(vector 1 2) ; => #(1 2)
;;; Remember that VECTORs are one-dimentional arrays

;;; MAKE-ARRAY
;;; make an array with initial variable
;;; with this macro you can create both fixed-size and resizable vectors
(make-array 3 :inital-element nil) ; => #(NIL NIL NIL)

;; Let's say you want to add elements to a vector of certain size, here's how you'd do it
(defparameter *x*                 ; Set the array as a global variable
  (make-array 5 :fill-pointer 0)) ; Make the array with 5 objects and set the fill pointer to 0
                                  ; The max is set to 5, so it's resizable until the max is met, see below for further explination

;; VECTOR-PUSH and VECTOR-POP
;; Now you can access the array and fill it with whatever using Vector
(vector-push 'a *x*) ; => 0  Lets you know the object index so the first index
                     ; #(A)  This is what the vector would look like after the fact
(vector-push 'b *x*) ; => 1
                     ; #(A B)
;; Now if you want to remove the last index of the array you would use pop, like in other languages
(vector-pop *x*)     ; => B  Which Element was removed from the array
                     ; #(A)  The array after the fact

;; So if you want to set the array to be adjustable past the max point you can by passing the :adjustable flag and setting to true
;; (make-array 5 :fill-pointer 0 :adjustable t)
;; The only way to add to the array past the point of it's maximum value now is that you have to use VECTOR-PUSH-EXTEND
;; (vector-push-extend ...)

(defparameter *x* (vector 1 2 3 1 1 5 8))
(length *x*)  ; => 3
(elt *x* 0)   ; 1
              ; Get the first index of the vector

;; You can reset the vector
(setf (elt *x* 0) 10) ; Sets the first index to 10




;; Sequence Iterating Functions
;; COUNT - get count of parameter
(count 1 *x*) ; => 2
;; REMOVE - remove all instances of parameter
(remove 1 *x*) ; removes all 1's
;; SUBSTITUE - substitute the second parameter with the first parameter
(substitute 1 10 *x*)
;; FIND - find the parameter, it will return the item or give NIL
(find 10 *x*)
;; POSITION - Find the postion of the firt iteration of parameter or return nil


;; Example of the above but with strings
(count "foo" #("foo" "bar" "baz") :test #'string=)    ; ==> 1
(find 'c #((a 10) (b 20) (c 30) (d 40)) :key #'first) ; ==> (C 30)
;; You're able to find specific

;; Higher Order Function variants
;; COUNT-IF - count if condition is met by any object
(count-if #'evenp *x*)
;; COUNT-IF-NOT is the adverse to the above
(count-if-not #'evenp *x*)
;; REMOVE-IF-NOT means to remove object(s) if condition is not met, good for removing unexpected data
(remove-if-not #'(lambda (x) (char= (elt x 0) #\f))
  #("foo" "bar" "baz" "foom")) ==> #("foo" "foom")
;; NOTE According to the language standard, the -IF-NOT variants are deprecated.
;; However, that deprecation is generally considered to have itself been ill-advised.
;; If the standard is ever revised, it's more likely the deprecation will be removed than the -IF-NOT functions.
;; For one thing, the REMOVE-IF-NOT variant is probably used more often than REMOVE-IF. Despite its negative-sounding name,
;; REMOVE-IF-NOT is actually the positive variant--it returns the elements that do satisfy the predicate.

;; REMOVE-DUPLICATES is used to do as the name suggests
(remove-duplicates *x*)

;; CONCATENATE
(concatenate 'vector #(1 2 3) '(4 5 6))    ; ==> #(1 2 3 4 5 6)
(concatenate 'list #(1 2 3) '(4 5 6))      ; ==> (1 2 3 4 5 6)
(concatenate 'string "abc" '(#\d #\e #\f)) ; ==> "abcdef"

;; SORT
(sort (vector "foo" "bar" "baz") #'string<) ; ==> #("bar" "baz" "foo")

;; MERGE
(merge 'vector #(1 3 5) #(2 4 6) #'<) ; ==> #(1 2 3 4 5 6)
(merge 'list #(1 3 5) #(2 4 6) #'<)   ; ==> (1 2 3 4 5 6)

;; MISMATCH
;; Check to see if something is mismatched in a string
(mismatch "foobarbaz" "foom") ; ==> 3

;; Check to see if every, some, not any, sor net every oject in an array meet a condition set
(every #'evenp #(1 2 3 4 5))    ; ==> NIL
(some #'evenp #(1 2 3 4 5))     ; ==> T
(notany #'evenp #(1 2 3 4 5))   ; ==> NIL
(notevery #'evenp #(1 2 3 4 5)) ; ==> T

;; Sequence Mapping
;; Apply some sort of computation of all of the objects in the array, example:
(map 'vector #'* #(1 2 3 4 5) #(10 9 8 7 6)) ; ==> #(10 18 24 28 30)

;; REDUCE
;; You can also REDUCE an array, as to say get the sum of all objects
(reduce #'+ #(1 2 3 4 5 6 7 8 9 10)) ; ==> 55
