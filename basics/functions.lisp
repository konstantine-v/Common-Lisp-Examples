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
