;; Magic 8 Ball
(defparameter phrases `("Maybe?" "Yes." "No." "Sometimes" "You fate will be revealed shortly"))
(defparameter question "")

(defun shake ()
  (format t "Reply: ~a~%" (nth (random (length phrases)) phrases)))

(defun ask (str)
  (if str (format t "You asked: ~a~%" str))
  (format t "You shake the Magic 8-ball...~%")
  (shake))
