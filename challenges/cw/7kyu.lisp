;;;; 7-Kyu Challenges
;; Tested via SLY/SBCL repl

;; Flip Boxes, 2D
(defun flip (dir boxes)
  (cond
    ((equalp dir #\R)
     (setq dir #'<))
    ((equalp dir #\L)
     (setq dir #'>)))
  (sort boxes dir))

;; Potatoes Paradox
(defun potatoes (p0 w0 p1)
  (floor (floor (* (- 100 p0) w0) (- 100 p1))))

;; FusionChamber
(defun burner (c h o)
  (setq water
        (lambda (x y) (floor (* (floor x 2) 2) (- (floor x 2) y)))
        h o)
  ;(vector water co2 methane)
  (format t "~d ~d ~d" water h o))
