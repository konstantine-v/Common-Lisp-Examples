;;;; Practice some defun stuff here

;; Let's explain what can be done with this on load in slime(or sly)
(format t "Things you can do in this little program to test out variables...~%(verbose-sum x y)~%(foo bar)~%")

(defun verbose-sum (x y)               ; Verbose function for the sum of x and y
  "Sum of two nums"                    ; Comment that explains the functions
  (format t "Sum of ~d and ~d ~%" x y) ; Print string that explains verbose
  (+ x y))                             ; The meat of the function

;; This is what above should be when testing out
;; (verbose-sum 2 3) ; => 5

;; Very simple Foobar thing
(defun foo (bar)
  (format t "Foo~d~%" bar))

;; Another version with optional arg
(defun foobaz (bar &optional baz)
  (format t "Foo~d~d~%" bar baz))

;; Example of keyword parameters for use with optional arguments
(defun foo-key (&key a b c)
  (list a b c))
;; (foo-key :a 2 :c 5) ; => (2 NIL 5)

(defun foo-key-too (&key
                 ((:apple a)   0 a-supplied-p)  ; Defaults to 0 and has a supplied check to output
                 ((:box b)     0 b-supplied-p)  ; Same as above
                 ((:charlie c) 0 c-supplied-p)) ; same...
  (list a b c))
;; (foo :apple 10 :box 20) : => (10 20 0 NIL)

;; Example of mixing types
(defun foo-mix (x &optional y &key z) (list x y z))
; x -> VAL
; y -> optional VAL
; z must be assigned with :z
;; (foo 1 :z 3) => error since it's expecting y and it got the arg for :z

;; Assigning default values
(defun foo-op (a &optional (b 0)) (list a b)) ; A is needed, b is optional with a default of 10. Creates a list of a and b
;; (foo-op 1 2) => (1 2)
;; (foo-op 1)   => (1 0)
;; The goal is to nto have it return NIL, as that's harder to account for than 0 or other

;; Rest parameters
;; (defun format (stream string &rest values))
(defun foo-rest (a b &rest rest)
  (list a b rest))
;;(foo-rest 1 2 3 4 5) => (1 2 (3 4 5))
;;This puts all the rest of the into the list without having to declare them

;; Mixings Different Type parameters
(defun alt-rest (&rest rest &key a b c)
  (list rest a b c))
;; (alt-rest 1 2 3) => ((a:1 b: 2 :c) 1 2 3)

;; FUNCALL
;; FUNCALL is the one to use when you know the number of arguments you're going to pass to the function at the time you write the code.
;; The first argument to FUNCALL is the function object to be invoked, and the rest of the arguments are passed onto that function.
;; Thus, the following two expressions are equivalent:
(defun foo-call (a b c) (list a b c))     ; Function foo-call with 2 parameters
(foo-call 1 2 3)           ; Calling function foo-call to fill with
(funcall #'foo-call 1 2 3) ; Same as above however you know the exact parameters
;; The above will most likely compile down to the same machine code, so not the best aproach

;; Below is a better use of funcall
;; This is a ASCII art histogram
;; (defun foo-plot (fn min max step)
;;   (loop for i from min to max by step do
;;         (loop repear (funcall fn i) do (format t "*"))
;;         (format t "~%")))

;; Anonymous Functions
;; These are used when you want to define a function to be used just in one place, for example
(defun compute (x y) (* x (* y y))) ; =>
;; Unless you're using it for other functions it's a waste of memory and should just be put into a lambda, for example:
(funcall #'(lambda (x y) (* x (* y y)) 1 2)) ; This is lighter on memory and since you know the parameters you can also utilize

;; This works best for simple functions that can just be explained inline
(defun square-of-two (fn x) ; This function gets the square of two
  (funcall fn x))           ; Funcall to pass the arguments to anonymous function or other
(square-of-two #'(lambda (x) (* x x)) 2) ; It's a simple way to write the square of a number and its more efficient.
;; Hopefully that explains that well...
