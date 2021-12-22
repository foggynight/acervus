(declare (unit string))

(: first-char (string --> (or char false)))
(define (first-char str)
  (if (zero? (string-length str))
      #f
      (string-ref str 0)))

(: last-char (string --> (or char false)))
(define (last-char str)
  (if (zero? (string-length str))
      #f
      (string-ref str (- (string-length str) 1))))

(: find-char (char string --> (or fixnum false)))
(define (find-char target str #!optional (start 0))
  (define len (string-length str))
  (let loop ((i start))
    (if (< i len)
        (if (char=? (string-ref str i) target)
            i
            (loop (+ i 1)))
        #f)))

(: find-whitespace (string fixnum --> (or fixnum false)))
(define (find-whitespace str #!optional (start 0))
  (define len (string-length str))
  (let loop ((i start))
    (if (< i len)
        (if (char-whitespace? (string-ref str i))
            i
            (loop (+ i 1)))
        #f)))

(: find-non-whitespace (string fixnum --> (or fixnum false)))
(define (find-non-whitespace str #!optional (start 0))
  (define len (string-length str))
  (let loop ((i start))
    (if (< i len)
        (if (char-whitespace? (string-ref str i))
            (loop (+ i 1))
            i)
        #f)))

(: next-word (string fixnum --> (or string false)))
(define (next-word str #!optional (start 0))
  (define len (string-length str))
  (if (< start len)
      (let ((beg (find-non-whitespace str start)))
        (if beg
            (let ((end (find-whitespace str (+ beg 1))))
              (substring str beg (if end end len)))
            #f))
      #f))
