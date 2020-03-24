;; Creating A Simple Database
;; This will go over creating a simple db in Common Lisp
;; From the practical Common Lisp Book


(defvar *db* nil) ;Define Global Variable for Database as db

;; Creating a function to create the type of object we're hoping to store in the db
(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped)) ;Sets all the values

;; Creating a function that pushes the records to the db
(defun add-record (cd) (push cd *db*)) ;push cd (from make-cd) to database (db)

;; Let's add a prompt for adding those cds, making it easier for users using to program
(defun prompt-read (prompt)         ; Prompt read to create the prompt, and prompt being (prompt-for-cds)
  (format *query-io* "~a: " prompt) ; Format how it'll look when prompting the user
  (force-output *query-io*)         ; Force-output so lisp doesn't wait for a newline, just when enter is pushed
  (read-line *query-io*))           ; read-line reads that line input from the user

;; Create the prompt for the user
(defun prompt-for-cd ()  ; This creates a function for creating a prompt
  (make-cd               ; Calls on make-cd to send what will be input
   (prompt-read "Title") ; Inserts title, you get the idea
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Add Another CD? ")) (return))))

;; Dumping the db to the REPL
(defun dump-db ()                       ; Create the function
  (dolist (cd *db*)                     ; DOLIST macro defined in db already to get list
                                        ; NOTE By defining cd, you're specifying that you only want to dolist on the cd "table"
    (format t "~{~a:~10t~a~%~}~%" cd))) ; FORMAT defines how it'll look in the REPL
                                        ; ~a is aesthetic, this allows whatever input to be human readable
                                        ; ~19t is for tabulating, similar to in C with "\t", used to create nice tahs
                                        ; ~{ is for lists
                                        ; ~% is for newline, similar to C's "\n"

;; Query the db with select
(defun select (query)
  (remove-if-not
   (lambda (cd) (equal (getf cd :artist) query)) *db*))


;; SAving the Database
(defun save-db (filename)
  (with-open-file (out filename
                       :direction :output
                       :if-exists :supersede)   ; If File Exists then overwrite
   (with-standard-io-syntax (print *db* out)))) ; Optional: print out the db when saved

;; Load the db you saved
(defun load-db (filename)                   ; set load-db to a function that accespts a sting argument
  (with-open-file (in filename)             ; open file specified
                  (with-standard-io-syntax  ; set to the standard io syntax
                   (setf *db* (read in))))) ; setf will set the database for the session to the one specified
