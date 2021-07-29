;;;; Check if string is a palendrome

(defun palendrome-p (str)
  "Check if STRING str is a palendrome. Only works for words."
  (let ((rstr (reverse (string-downcase (string-trim " " str)))))
    (cond ((string-equal str rstr) (princ "TRUE"))
          (t (princ "FALSE")))))

;; TODO make this work for sentences
