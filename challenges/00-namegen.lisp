;;;; Name/Credentials Generator
;; Creating fake credentials for a fake person
;; Basic Goals: First Name, Last name, Age
;; Bonus Goals: Username, Address, email, etc...

Create Lists of preset first and last names
(defvar *first-names*
  (list "Jim" "Bill" "Steve" "Joe" "Mark"))
(defvar *last-names*
  (list "Stevenson" "Black" "Bongo" "Foobar" "Goldstein"))
; The above could be a vector with two child arrays that have each array
; There's a few better ways to store this data but it's good for now

;; Create a class of person with all the data you want to store
(defclass person ()
  ((first-name :accessor person-first-name
         :initform "default-first-name"
         :initarg :first-name)
  (last-name :accessor person-last-name
         :initform "default-last-name"
         :initarg :last-name)
  (age   :accessor person-age
         :initarg :age)))

;; Make the test user
(defun make-test-user ()
  (setq randage (random 100))
  (setq randfname (nth (random (length *first-names*)) *first-names*))
  (setq randlname (nth (random (length *last-names*)) *last-names*))
  (setq test-user (make-instance 'person
                                 :first-name randfname
                                 :last-name  randlname
                                 :age randage)))

;; Create with (make-test-user), creates random user each time everwriting the last
;; Access with (describe test-user), shows you all the info on said random user
