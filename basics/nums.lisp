;;;; Numbers and such Ch10

;; Checking if nums are equal
(= 1 1)     ; T
(= 1 2)     ; NIL
(= 10 20/2) ; T

;; This can also check to see if an equation expected value is true, like seen in the ch9 project with tests
(= (+ 2 2) 4) ; T
(= (+ 2 4) 3) ; NIL

;; Checking if values are different
(/= 1 2)      ; T
(/= 1 1)      ; NIL
(/= 10 20/10) ; NIL

;; Comparing numbers, each number gets compared to the number to the left. Same foes for the above
(< 2 3)      ; T
(> 2 3)      ; NIL
(<= 2 3 3 5) ; T
(<= 2 3 3 3) ; NIL

;; Check the min max for in a list of numbers
(max 10 11)    ; 11
(min -12 -3)   ; -12
(max -2 12 22) ; 22

;; Lisp also supports other type of maths like logerithms, exponentiation, sin cosin asin, etc...

;;; Strings
;;; Strings are hanled similar to how other languages do wiht escapes and such
;; "foobar"	foobar	Plain string.
;; "foo\"bar"	foo"bar	The backslash escapes quote.
;; "foo\\bar"	foo\bar	The first backslash escapes second backslash.
;; "\"foobar\""	"foobar"	The backslashes escape quotes.
;; "foo\bar"	foobar	The backslash "escapes" b
;;; You would just put these in (format t "\"foobar\"") => "Foobar")

;; Much like numbers you can compare strings
(string= "foobarbaz" "quuxbarfoo"
         :start1 3 :end1 6
         :start2 4 :end2 7) ; you can s1tart and stop where you'd like to search in the strings

(string/= "lisp" "lissome") ; => 3
                            ; As only three chars match
