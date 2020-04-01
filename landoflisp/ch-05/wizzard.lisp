;;;; Wizzards Apprentice

(defparameter *nodes* '((living-room (you are in the living room. A wizard is sleeping))
                        (garden      (you are in a nice garden. There is a well in front of you.))
                        (attic       (you are in the attic. There is a welding torch in the corner.))))
;; NOTE: Wouldn't using classes (CLOS) be better for this sort of thing?
;; Basic Lists seem a bit limited and for scope or for adding future locations and logic it would make sense.

;; Define the edges in which you move from place to place
(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden      (living-room east door))
                        (attic       (living-room downstairs ladder))))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(defun describe-location (locate nodes)
  (cadr (assoc location nodes)))
