(defparameter word-nouns `("you" "we" "him" "her" "they"))
(defparameter word-verbs `("were" "been" "had" "done" "said" "talk" "walk"))
(defparameter word-other `("to" "for" "from" "and"))
(defparameter random-var 0)
(defparameter next-words "")
(defparameter final-sent `(""))

(defun rand-sentence (times)
  (loop for x upto (- times 1) do
    (setq random-var (random 3))
    (cond
      ((= random-var 0) (setq next-words (nth (random (length word-nouns)) word-nouns)))
      ((= random-var 1) (setq next-words (nth (random (length word-verbs)) word-verbs)))
      ((= random-var 2) (setq next-words (nth (random (length word-other)) word-other))))
    (push next-words final-sent))
  (format nil "~{~a~^ ~}" final-sent))

;; Notes
;; There's a bug which I can't seem to figure out and that's when you rerun the function in the REPL
;; it will add on to the list, and I know that has something to do with the format at the end
;; On my second pass at this I may want to fetch the top 100 verbs, etc to use rather than a static list
