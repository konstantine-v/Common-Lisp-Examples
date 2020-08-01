;; Count words in a string

(defun clean (str)
  "Cleaning string"
  (string-trim
   '(#\Space #\Newline #\Backspace #\Tab #\Linefeed #\Page #\Return #\Rubout)
   str))

(defun words (str)
  (+ (count #\space (clean str)) 1))

;; Bonus: Lines, Sentences, Paragraphs, Typos
