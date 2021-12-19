(declare (unit string))

(define (first-char str)
  (string-ref str 0))

(define (last-char str)
  (string-ref str (- (string-length str) 1)))
