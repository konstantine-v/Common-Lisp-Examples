;;;; Files and File I/O
;;;; Learning how to access files from the REPL to the system's file ststem

(defparameter *covid-file* "~/.cache/covid_stats") ; based on my covid data bash script

(defun read-file-as-lines (filename)
  "Read file into a list of lines."
  (with-open-file (in filename)
    (loop for line = (read-line in nil nil)
      while line
      collect line)))

(defun line-as-list (line)
  "Read all objects from the line as a list."
  (read-from-string (concatenate 'string "(" line ")")))

(mapcar #'line-as-list (read-file-as-lines "mydata"))

;; (defun load-data ()
;;   (with-open-file (stream (merge-pathnames #p*covid-file* (user-homedir-pathname))
;;                           :direction :input
;;                           :if-does-not-exist nil)
;;                   (with-standard-io-syntax (setf *covid* (read in)))))

(defun read-covid-data ()
  (uiop:read-file-string (merge-pathnames #p*covid-file*
                                          (user-homedir-pathname))))


;; (defun open-file (let ((in (open "~/.cache/corona-formatted" :if-does-not-exist nil)))
;;                    (when in
;;                      (format t "~a~5" (read-line in))
;;                      (close in))))
