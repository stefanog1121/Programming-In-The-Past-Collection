(defun shift-val (char)
    (let (code (char-code char))
        ;check if code is in alphabetic range
        ;apply shift
        ;wrap around bounds if exceeding
    )

)

(defun encrypt (str)
    ;; convert input to all uppercase for easier edge handling
    (let ((code (string-upcase str)))
        (map 'string #'shift-val code))
)

(defun decrypt (str)

)

(defun solve (str)

)

(defvar *shift* 2)
(defvar *input* "hal")
(defvar *encrypted* (encrypt *input*))
(format t *encrypted*)