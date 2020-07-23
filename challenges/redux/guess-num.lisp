(defparameter *small*   1)   ; The smallest num
(defparameter *big*     100) ; The largest num
(defparameter *guess*   0)   ; The actual Guess
(defparameter *guesses* 1)   ; The number of attempts made

(defun guess-my-number () ; initial guess, starts at 50
  (setf *guess* (ash (+ *small* *big*) -1)))

(defun smaller () ; tells the cpu to guess lower
  (incf *guesses*)
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger () ; tells the cpu to guess higher
  (incf *guesses*)
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

(defun start-over () ; starts over
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

(defun correct () ; tells the cpu that you've won and prints stats
  (format t "~%Correct! The Number was ~a~%" *guess*)
  (format t "~%It took the program ~a guesses to figure that out.~%" *guesses*))

;; BONUS: add prompt to start again after correct or when (start-over)
;; Cleanup output of (guess-my-number)
