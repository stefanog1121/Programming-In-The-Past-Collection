(defvar *shift* 2)

(defun shift-val (char)
    ; convert char to ASCII
    (let ((code (char-code char)))

      ; check if it's an uppercase letter
      (if (and (>= code 65) (<= code 90))
          ; TRUE: apply shift and wrap around if out of alphabetic bounds
          (code-char (+ 65 (mod (+ (- code 65) *shift*) 26)))
          ; FALSE: not a letter, return as is
          char)))


(defun encrypt (str)
    ; convert input to all uppercase for easier edge handling
    (let ((code (string-upcase str)))
        (map 'string #'shift-val code))
)


(defun decrypt (str)
    ; create special instance of *shift* 
    (let ((*shift* (- *shift*)))
        (encrypt str))) 


(defun solve (str)
    (let ((original-shift *shift*))
        (dotimes (i 27)
            (setf *shift* i)
            (format t "~5d | ~a~%" i (encrypt str)))))


(defun main ()
    (format t "---------------~%")
    (let ((input "You go tell that vapid existentialist quack Freddy Nietzsche that he can just bite me, twice"))
        (format t "Original: ~a~%" input)
        (let ((encrypted (encrypt input)))
            (format t "Encrypted: ~a~%" encrypted)
            (format t "Decrypted: ~a~%" (decrypt encrypted)))))
    (format t "--Solving Cipher--~%")
    (solve "HAL")

(main)