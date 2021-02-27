;; Sudoku generator

(defvar *board* `())
;; (defvar row)
;; (defparameter *difficulty* 3)

;; Knuth Suffle from Rossetta Code
(defun nshuffle (sequence)
  (loop for i from (length sequence) downto 2
        do (rotatef (elt sequence (random i))
                    (elt sequence (1- i))))
  sequence)

;; (defun set-difficulty (diff row)
;;   (dotimes (i diff)
;;     (substitute ""
;;                 (+ (random 8) 1)
;;                 row))

; Create the row in Sodoku
(defun create-row (size)
  "Create a row for the sudoku row"
  (nshuffle (loop for x from 1 to size
                  collect x)))

(defun create-board (&optional)
  (dotimes (i 9)
    (print (create-row 9))))
