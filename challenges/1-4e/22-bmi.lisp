;; Imperial BMI Calculator
(defun bmi (h w)
  (let* ((b (truncate (* 703 w) (* h h))))
    (cond
      ((<= b 18.5) "Underweight")
      ((<= b 25.0) "Normal")
      ((<= b 30.0) "Overweight")
      (t "Obese"))))

;; Bonus: Create Metric version
;; Add an argument for metric and imperial calculations
