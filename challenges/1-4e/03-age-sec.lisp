;; One-liner for Calculating age in seconds
(defun age-conv (age) (format t "~%Your age in seconds: ~a~%" (* age 31536000)))

;; Notes
;; A more advanced implementation would be to calculate based on your birthday and get an exact number
;; based on current or UTC time. I may go back and try this out on the second run.

;; Tests
(age-conv 25)
(age-conv 76)
(age-conv 89)
