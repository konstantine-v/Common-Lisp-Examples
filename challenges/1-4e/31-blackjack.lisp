;; Single-player Backjack Game
(defvar *turn*    1) ; You start on turn 1
(defvar *me*      0) ; You start with 0
(defvar *dealer*  0) ; The dealer starts with 0

(defmacro deal-card-to (x)
  "Deal 'cards' to X, card being a random num 1-10"
  `(setf ,x (+ ,x (random 10))))
;Currently doesn't take into account the card probability yet

(defun show-scores()
  (format t "You: ~s~%Dealer: ~s~%" *me* *dealer*))

(defun reset-game()
  "End game state by resetting all parameter values"
  (setf *turn* 1)
  (setf *me* 0)
  (setf *dealer* 0))

(defun end-game()
  "Show scoreboard, reset scores, then display endgame message"
  (show-scores)
  (reset-game)
  (format t "The game is over, play again with BLACKJACK-START~%"))

;; (defun dubs()
;;   (if (and (> *me* 9) (= *turn* 1))
;;       (dotimes (i 2) (deal-card-to *me*))
;;       "Cannot do double, sorry..."))

(defun bust()
  (format t "Bust, you went over 21...~%Dealer Wins!~%")
  (end-game))

(defun hit()
  (incf *turn*)
  (deal-card-to *me*)
  (if (> *me* 21)
      (bust)
      (show-scores)))

(defun stay()
  ;; Loop (setf dealer (+ dealer (random 10)))
  ;; Not sure how many to loop through
  ;; If dealer goes over or is under then player wins
  ;; If dealer gets closer to 21 then dealer wins
  )

(defun blackjack-start ()
  "Start game with initial dealing of cards"
  (format t "Lets start this game...~%")
  (reset-game)
  (dotimes (i 2) (deal-card-to *me*))
  (deal-card-to *dealer*)
  (show-scores)
  (format t "It's your turn to HIT, STAY, DUBS for double, or END-GAME~%"))
