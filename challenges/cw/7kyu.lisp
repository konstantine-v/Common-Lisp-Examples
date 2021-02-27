;;;; 7-Kyu Challenges
;; Tested via SLY/SBCL repl

;; Flip
(defun flip (dir boxes)
  (cond
    ((equalp dir #\R)
     (setq dir #'<))
    ((equalp dir #\L)
     (setq dir #'>)))
  (sort boxes dir))

;; Potato
(defun potatoes (p0 w0 p1)
  (floor (floor (* (- 100 p0) w0) (- 100 p1))))

;; Fusion
(defvar h2o)
(defvar c02)
(defvar ch2)
(defun burner (c h o)
  (setq h2o
        ((lambda (x y) (floor (* (floor x 2) 2) (- (floor x 2) y)))
        h o))
  ;(vector water co2 methane)
  (format t "Water:~d~%H:~d~%O:~d" h2o h o))
