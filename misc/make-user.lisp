;;;; Create and grab user data

(defparameter *field-amnt* 5) ;Amount of fields for user data (columns) 
(defparameter *user* ;Create a vector for user data
  (make-array *field-amnt* :fill-pointer 0)) ; => #()

(defmacro data-prompt (prompt field)
  (format t "Enter ~a: " prompt)
  (let ((x (read-line))
        (y field))
    (vector-push (list y x) *user*)))

(defun add-user-data ()
  "Prompt user for all data needed.
Warning: doesn't sanitize inputs"
  (data-prompt "First Name" fname)
  (data-prompt "Last Name" lname)
  (data-prompt "Address" addr)
  (data-prompt "Age" age))

(defun check-for-file (filename)
  (princ "Get file ~a" filename))

(defun start ()
  (check-for-file "")
  (princ "Do stuff..."))

