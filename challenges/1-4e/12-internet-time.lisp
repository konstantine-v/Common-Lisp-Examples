;; Get your machines time
(defun your-time ()
  (multiple-value-bind
    (second minute hour)
    (get-decoded-time)
    (format t "~2,'0d:~2,'0d:~2,'0d"
            hour
            minute
            second)))

;; Notes
;; Using a multiple-value-bind means that I can map the results from get-decoded-time
;; For some reasons there's not much on getting and formatting time in terms of
;; lisp so on my next pass at this I'm going to probably find a better way to do this.
;; This code is derived from the lisp cookbook where it explains how get-decoded-time works
