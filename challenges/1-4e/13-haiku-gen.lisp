;; Random Haiku generator
(defparameter word-nouns `("you" "we" "him" "her" "they"))
(defparameter word-verbs `("were" "been" "had" "done" "said" "talk" "walk"))
(defparameter word-other `("to" "for" "from" "and"))

(defun haiku-line (times)
  (let ((next-words "")(final-sent `("")))
    (loop for x upto (- times 1) do
      (let ((random-var (random 3)))
        (cond
          ((= random-var 0) (setq next-words (nth (random (length word-nouns)) word-nouns)))
          ((= random-var 1) (setq next-words (nth (random (length word-verbs)) word-verbs)))
          ((= random-var 2) (setq next-words (nth (random (length word-other)) word-other)))))
      (push next-words final-sent))
    (format t "~{~a~^ ~}~%" final-sent)))

(defun haiku (x y z)
  (haiku-line x)
  (haiku-line y)
  (haiku-line z))

;; Notes
;; This is derived from the random sentence generator
