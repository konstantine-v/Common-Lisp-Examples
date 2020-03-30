
(print "Enter your name: ")
(defvar *name* (read))

(defun hello-prompt (*name*)
  (format t "Hello ~a~%" *name*))
(hello-prompt *name*)
