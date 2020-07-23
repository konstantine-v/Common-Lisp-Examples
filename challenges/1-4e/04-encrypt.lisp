;; A very very simple "encryption" method for strings
;; Obviously this is a quick example, in a real world scenario it would be much more complex.
;; If I were to come back to this I would assign a random number to the loop iteration and have that work for encrypt and decrypt

(defparameter enc "")

(defun encrypt (str)
  "Take string and turn it into a list, then iterate through that list to 'encrypt it'"
  (setq enc (map 'list #'char-code str)) ;Turn string into a list of ASCII codes
  (setq enc                              ;Iterate through the array to add one to each ASCII code
        (loop for i in enc
          collect (+ i 1)))
  (setq enc (map 'list #'code-char enc)) ;Convert the ASCII codes back to chars
  (format nil "~{~a~^~}" enc))           ;Return them as a single string

(defun decrypt (str)
  "Take encrypted string and decrypt it to reveal the original string"
  (setq enc (map 'list #'char-code str)) ;Turn string into a list of ASCII codes
  (setq enc                              ;Iterate through the array to add one to each ASCII code
        (loop for i in enc
          collect (- i 1)))
  (setq enc (map 'list #'code-char enc)) ;Convert the ASCII codes back to chars
  (format nil "~{~a~^~}" enc))           ;Return them as a single string

;; Tests
(encrypt "testyThing")
(decrypt (encrypt "testyThing"))
