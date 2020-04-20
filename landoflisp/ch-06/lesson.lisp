;;;; Lessons in this chapter


;; Using PRINT will print something twice
(print "test") ; "test"
               ; "test"
;; NOTE: Print will print doublle for debugging

;; Print multiple lines
(progn (print "This")
       (print "is")
       (print "a")
       (print "test"))
;; You can remove the multiline and print all strings on a single line with PRIN1
(progn (prin1 "This")
       (prin1 "is")
       (prin1 "a")
       (prin1 "test"))

;; Note the below example doesn't run as intended in SBCL for some reason.
(defun hello ()
  (princ "Please type your name: ")
  (let ((name (read)))
    (format t "~%Nice to meet you, ~a~%" name))) ; Also changed this line so it's more consixe as oneline

;; Creating a REPL looks to be fairly simple
(defun game-repl ()
  ;(loop (print (eval (read))))
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))
