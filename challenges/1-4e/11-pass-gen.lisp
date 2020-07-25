;; Password Generator

(defun pass-gen (length)
  "Password generator, specify length of the "
  (format t "~{~a~^~}"
          (map 'list #'code-char
               (let ((x 35)) ;Starting at ASCII for #
                 (loop for i upto (- length 1)
                       collect (+ x (random 91))))))) ; 91 Stops it at tilde
;; Notes
;; This is my fir attempt at making a more elegant password generator and I think it came out quite nice
;; On my second pass I wouldn't change much, rather I would have checks for odd chars not commonly accespted
;; which would just be a conditional within the loop or within the let
