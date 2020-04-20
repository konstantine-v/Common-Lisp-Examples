;; A program that calculates BMI based on user input
;; Based on US Pounds (LBS)

(defvar weight)
(defvar height)
(defvar *BMI*)

(defun read-weight ()
  (terpri)
  (setq weight (read))
  ;Put Break if incorrect value is entered
  )

(defun read-height ()
  (terpri)
  (setq height (read))
  ;Put Break if incorrect value is entered
  )

(defun get-bmi (x y)
  (terpri)
  (setq *BMI* (/ (* 703 x) (expt y 2)))) ; for some reason it's printing in an odd way

(defun bmi-calculated ()
  (format t "Getting your BMI~%Enter your Weight (lbs): ")
  (read-weight)
  (format t "Enter your Height (feet): ")
  (read-height)
  (get-bmi weight height)
  (format t "Your BMI~t~a~%Your Height~t~a~%Your Weight~t~a lbs.~%" *BMI* height weight))

(bmi-calculated)
