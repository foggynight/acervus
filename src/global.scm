(declare (unit global))

(define comment-char (make-parameter #\;))

(define directive-char (make-parameter #\.))
(define label-char (make-parameter #\:))
(define location-char (make-parameter #\:))

(define char-delim (make-parameter #\'))
(define string-delim (make-parameter #\"))

(define directives (make-parameter '(.code .data)))

(define instructions
  (make-parameter
   '((push . 1)
     (pop . 0)
     (dup . 0)
     (swap . 0)
     (rot . 0)
     (add . 0)
     (sub . 0)
     (mul . 0)
     (div . 0)
     (comp . 0)
     (jump . 1)
     (jumpe . 1)
     (jumpl . 1)
     (jumpg . 1)
     (read . 0)
     (display . 0)
     (write . 0)
     (newline . 0)
     (exit . 0))))
