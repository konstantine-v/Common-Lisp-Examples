;;;; Macros

;; Setting this global variable to test out some conditionals to make understanding them easier with a common var
(defvar *iffy* 12)

;; Conditional
;; Such as IF, WHEN, WHILE, LOOP, etc

;; IF
(defun what-is-iffy ()
  (format t "*iffy*:~5t~d~%The Var is ~d~%"
          *iffy*
          (if (< *iffy* 20) "less than 20" "greater than 20")))
;; If works like so
;; (if (condition) THEN ELSE)
;; The return value with either be the THEN or ELSE
;; So like (what-is-iffy) it's either string depending on if iffy is less than 20

;; WHEN
;; Using WHEN instead of if to allow mutiple THENS in a contional, as opposed to IF
(when (< *iffy* 20)
  (format t "*iffy* is less than 20, value is: ~d~%" *iffy*)
  (what-is-iffy))
;; When (x is y) do this...

;; UNLESS is the same sort of logic however inverse, hense it being called UNLESS
;; UNLESS (x is y) do this...

;; COND
;; COND is used when you need more complicated conditionals
;; if a then do b but if c is d do j, etc...
;; While the above might sound daunting, it's more elegantly written in COND than in IF
;; (cond (a (do-b))
;;       (c (do-d))
;;       ....)

;; BOOLEAN
;; boolean operators are everywhere in programming, but Lisp handles booleans quite elegantly
;; T => True, NIL => False. You should account for T otherwise no value so have a fallback. False is arbitrary

;; NOT - check if true or NOT
(not nil)     ; => T
(not (= 1 1)) ; => NIL

;; AND
;; x AND y are true
(and (= 1 2) (= 3 3)) ; => NIL

;; OR - check if x OR y are true
(or (= 1 2) (= 1 3))

;; Looping
;; DOLIST - pretty simple, do list, example:
(dolist (x '(1 2 3)) (print x))

;; Break out of the look using return
(dolist (x '(1 2 3)) (if (evenp x) (return)) (print x))
;; Dolist is akin to foreach

;; DOTIMES - Do X Y times
(dotimes (i 4) print i)

;; DO
;; DO allows more flexibility by allowing any number of variables and so on
;; Keep in mind the basic template of DO
;; (do (variable-definition*)
;;     (end-test-form result-form*)
;;  statement*)

;; To simulate what it's like using do over do times here's an example
(do ((i 0 (1+ i)))
    ((>= i 4))
  (print i))

;; When something like this can be done in dotimes like so:
(dotimes (i 4) (print i))

;; DO has it's uses when doing something complex like the fibonacci swquence
;; (do ((n 0 (1+ n))
;;      (cur 0 next)
;;      (next 1 (+ cur next)))
;;     ((= 10 n) cur))

;; LOOP
;; Loop has it's own way of doing things different but somewhat similar to the do loops
;; Jere's an example of a regular loop getting the universal time until it reaches the future date
;; (defvar *some-future-date* 3888888888)
;; (loop
;;  (when (> (get-universal-time) *some-future-date*)
;;    (return))
;;  (format t "Waiting...~%")
;;  (sleep 60))
;;  uncomment above to see in action :)
;; Every minut that the universal time is below the future date then print waiting and sleep and repeat....

;; Lets say that you want to collect the output of each iteration of the loops output into a list, you can do so like:
(loop for i from 1 to 100 collecting i) ; ==> (1...100)
;; As you can see, collecting is what tells loop to collect in a list of index i

;; Let's say you want to get the count of vowels in a string
(defun lorem-count-v ()
  (loop for x across "lorem ipsum dolar lisp"
        counting (find x "aeiou"))) ; ==> 7

;; Lets say you want to get the sum of the first ten squares
(defun ten-squares-sum ()
  (loop for x from 1 to 10 summing (expt x 2)))

;; Now for something really neat
;; Let's try and compute the eleventh Fibonacci number
(defun elvn-fibo-num ()
  (loop for i below 10
        and a = 0 then b
        and b = 1 then (+ b a)
        finally (return a)))

;; Macros are pretty neat, what's eben neater than that is the ability to create your own macros if there's
;; something any of the above don't provide that you need
