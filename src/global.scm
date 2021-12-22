(declare (unit global))

(define comment-char (make-parameter #\;))

(define directive-char (make-parameter #\.))
(define label-char (make-parameter #\:))
(define location-char (make-parameter #\:))

(define char-delim (make-parameter #\'))
(define string-delim (make-parameter #\"))
