;;;; FORMAT and what it can do

;; Example list
(defvar *test* (list "foo" "bar" "baz" "test"))

;; Render list
(format t "~{~a~^, ~}~%" *test*) ; render all objects in list
                                 ; NOTE: If you

;; render larger floating point values
(format t "~5$~%" pi) ; renders the 5 digits after decimal

(format t "~:d~%" 1000000) ; => 1,000,000

;; Setting dates as fixed-width format
(format nil "~4,'0d-~2,'0d-~2,'0d~%" 2005 6 10) ; => "2005-06-10"

;; Roman Numerals
(format nil "~@r~%" 1234) ;=> MCCXXIV

;; Semantics
(format nil "~r file~:p" 1)    ; => "one file"
(format nil "~r file~:p" 10)   ; => "ten files"
(format nil "~r file~:p~%" 0)    ; => "zero files"
(format nil "~r famil~:@p" 1)  ; => "one family"
(format nil "~r famil~:@p" 10) ; => "ten families"
(format nil "~r famil~:@p~%" 0)  ; => "zero families"

;; Control the case of the strings
(format nil "~(~a~)~%" "FOO") ; => "foo"
(format nil "~(~@r~)~%" 124)  ; => "cxxiv"

;; Controlling size of floating points positive integers
(format nil "~$" pi)    ; => "3.14"
(format nil "~2,4$" pi) ; => "0003.14"

;; Print out how to say a number
(format nil "~r" 1234) ==> "one thousand two hundred thirty-four"
(format nil "~:r" 1234) ==> "one thousand two hundred thirty-fourth"

;; Add a sort of conditional in the format, ex:
(format nil "~[cero~;uno~;dos~:;mucho~]" 3)   ; => "mucho"
(format nil "~[cero~;uno~;dos~:;mucho~]" 100) ; => "mucho"
;; This can be good for saving data like for example in a reading app
(format nil "~[unread~;read~;archived~:;deleted~]" 2) ; => "read"
;; Or perhaps in a test framework
(format t "~:[FAIL~;pass~]" test-result)

;; You can reuse the parameters in the format by creating a DEFPARAMETER and using that, prevent some mistake by doing this too
(defparameter *list-etc* "~#[NONE~;~a~;~a and ~a~:;~a, ~a~]~#[~; and ~a~:;, ~a, etc~].")
(format nil *list-etc*)                 ;"NONE."
(format nil *list-etc* 'a)              ;"A."
(format nil *list-etc* 'a 'b)           ;"A and B."
(format nil *list-etc* 'a 'b 'c)        ;"A, B and C."
(format nil *list-etc* 'a 'b 'c 'd)     ;"A, B, C, etc."
(format nil *list-etc* 'a 'b 'c 'd 'e)  ;"A, B, C, etc."
