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

;; Define the Objects
(defparameter *objects* '(whiskey bucket frog chain))
;; Now define where the objects are
(defparameter *object-loc* '((whiskey living-room)
                             (bucket living-room)
                             (frog garden)
                             (chain garden)))

;; Location Functions
(defun desc-loc (location nodes)
  (cadr (assoc location nodes)))
(defun desc-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))
(defun desc-paths (location edges)
  (apply #'append (mapcar #'desc-path (cdr (assoc location edges)))))

;; Object Functions
(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
                     (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))
(defun desc-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
                         `(you see a ,obj on the floor)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(defparameter *location* 'living-room) ; This will need to change so it's not static

;; Look around you to describe where you are and what is nearby
(defun look ()
  (append (desc-loc *location* *nodes*)
          (desc-paths *location* *edges*)
          (desc-objects *location* *objects* *object-loc*)))

;; Walk
(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
        (progn (setf *location* (car next))
               (look))
      '(you cannot go that way))))


;; Teleport - You're a wizard, you should be able to go whereever, walking is for chumps
(defun teleport (location)
  (setf *location* location)
  `(you teleport to ,location))

;; Pickup objects in area
(defun pickup (object)
  (cond ((member object
                 (objects-at *location* *objects* *object-loc*))
         (push (list object 'body) *object-loc*)
         `(you are now carrying the ,object))
        (t '(you cannot get that))))

;; Inventory
(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-loc*)))

;;; That's it, now you can play the game and it should all work :)
