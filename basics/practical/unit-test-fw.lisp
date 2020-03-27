;;;; Practical: Building a Unit Test Framework
;;;; Chapter 9 - this will utilize what was learned in the past few chapters

;; By convention global variables need to be at the to
(defvar *test-name* nil) ; Setting the name of each variable to print in console
;; (defvar *test-desc* nil) ; Setting the description of what that test does

(defmacro deftest (name parameters &body body &optional desc) ; Create a macro to write new tests
  `(defun ,name, ,desc ,parameters
     (let ((*test-name* ',name))               ; Set the test-name of each function
          ;; ((*test-desc* ',desc))
            ,@body)))

(defmacro check (&body forms) ; Run the check on each equation passed as parameters
  `(progn
     ,@(loop for f in forms collect `(report-result ,f ',f))))

(deftest report-result (result form)
  ;; (format t "~d~%" *test-desc*)
  (format t "~:[FAIL~;Pass~] ...~a: ~a~%" result *test-name* form)
  result)

(defun test-+ ()
  (check
   (= (+ 1 2) 3) ; (= (equation)) is a lisp function for getting the boolean value based on if something is equal
   (= (+ 1 3) 4)
   (= (+ 1 4) 5)))

(deftest test-maths ()
   (test-+))
