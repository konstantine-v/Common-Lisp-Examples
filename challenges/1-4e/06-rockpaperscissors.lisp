;; Simple Rock paper scissors game
(defparameter hands `("r" "p" "s"))
(defparameter cpu-hand "")

(defun win () (format t "Win!"))
(defun lose () (format t "Lose!"))

(defun rps-game (guess)
  "Play Rock, Paper, Scissors with the computer"
  (setq cpu-hand (nth (random (length hands)) hands))
  (cond
    ((string= guess cpu-hand) (format t "It's a Tie!!"))
    ((string= guess "r")
     (cond
       ((string= cpu-hand "p") (lose))
       ((string= cpu-hand "s") (win))))
    ((string= guess "p")
     (cond
       ((string= cpu-hand "s") (lose))
       ((string= cpu-hand "r") (win))))
    ((string= guess "s")
     (cond
       ((string= cpu-hand "p") (lose))
       ((string= cpu-hand "r") (win)))))
  (format t "~%Yours:~a~%CPU:~a~%" guess cpu-hand))

;; Notes
;; This could be improved I'm sure by have neater conditional logic
