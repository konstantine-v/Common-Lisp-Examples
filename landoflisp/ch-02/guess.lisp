;;;; The Guess-My-Number Game or Higher/Lower
;;;; In this version it's higher or lower, but the computer is trying to figure out.
(defparameter *small* 1)
(defparameter *big* 100)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1))

(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

;;; This could be further


;; TODO: Old code, move to programming challenges
;; (defparameter *cpu-number* 1) ; Set default value to global variable that can change
;; (defun guess-my-number ()
;;   (setq *cpu-number* (random 100)) ; Gets a random number from 1-100 for each game
;;   *cpu-number*)
