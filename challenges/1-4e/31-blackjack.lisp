;; Single-player Backjack Game
(defvar *turn*    1) ; You start on turn 1
(defvar *me*      0) ; You start with 0
(defvar *dealer*  0) ; The dealer starts with 0

(defmacro deal-card-to (x)
  "Deal 'cards' to X, card being a random num 1-10, doesn't take into account probability"
  `(setf ,x (+ ,x (+ 1 (random 10)))))

(defun show-scores()
  (format t "You: ~s~%Dealer: ~s~%" *me* *dealer*))

(defun end-game()
  "Show scoreboard, reset scores, then display endgame message"
  (show-scores)
  (format t "The game is over, play again with BLACKJACK-START~%"))

(defun double()
  (if (and (> *me* 9) (= *turn* 1))
      (dotimes (i 2) (deal-card-to *me*))
      "Cannot call double, sorry..."))

(defun bust()
  (format t "Bust, you went over 21...~%Dealer Wins!~%")
  (end-game))

(defun check-bust ()
  "Check to see if player has gone bust"
  (if (> *me* 21)
      (bust)
      (show-scores)))

(defun hit()
  (incf *turn*)
  (deal-card-to *me*)
  (check-bust))

(defun stay()
  "Keep your current card value...
Doesn't exactly work as intended...
Currently the dealer will keep drawing cards to lose, which is not correct."
  (format t "You choose to stay.~%")
  (loop while (< *dealer* 17)
        do (if (< *dealer* 17) (deal-card-to *dealer*)))
  (cond ((> *dealer* 21) (format t "You Win!!~%") (end-game))
        ((and (< *dealer* 21) (> *dealer* *me*)) (format t "Dealer Wins...~%") (end-game))
        ((< *dealer* *me*) (format t "You Win!!~%") (end-game))))

(defun blackjack-start ()
  "Start game with initial dealing of cards"
  (format t "Lets start this game...~%Dealing out the cards...~%")
  ; Reset Scores
  (setf *turn* 1)
  (setf *me* 0)
  (setf *dealer* 0)
  (dotimes (i 2) (deal-card-to *me*))
  (deal-card-to *dealer*)
  (check-bust)
  (format t "It's your turn to HIT, STAY, DOUBLE for double, or END-GAME~%"))

;;; Notes
;; Bonus for this would be to add card probability
