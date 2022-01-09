(declare (unit string))

;; Determine if STR contains only alphabetic characters.
(: string-alphabetic? (string --> boolean))
(define (string-alphabetic? str)
  (define len (string-length str))
  (if (zero? len)
      #f
      (let loop ((i 0))
        (if (= i len)
            #t
            (if (not (char-alphabetic? (string-ref str i)))
                #f
                (loop (+ i 1)))))))

;; Determine if STR contains only numeric characters, or contains only numeric
;; characters and a single period.
(: string-numeric? (string --> boolean))
(define (string-numeric? str)
  (define len (string-length str))
  (define period #f)
  (if (or (zero? len)
          (and (= len 1)
               (char=? (string-ref str 0) #\.)))
      #f
      (let loop ((i 0))
        (if (= i len)
            #t
            (if (not (char-numeric? (string-ref str i)))
                (if period
                    #f
                    (if (char=? (string-ref str i) #\.)
                        (begin (set! period #t)
                               (loop (+ i 1)))
                        #f))
                (loop (+ i 1)))))))

;; Get the first character of STR, or return false if STR is the empty string.
(: first-char (string --> (or char false)))
(define (first-char str)
  (if (zero? (string-length str))
      #f
      (string-ref str 0)))

;; Get the last character of STR, or return false if STR is the empty string.
(: last-char (string --> (or char false)))
(define (last-char str)
  (if (zero? (string-length str))
      #f
      (string-ref str (- (string-length str) 1))))

;; Find the index of TARG within STR. The search begins at the index START.
;; Return false if TARG is not found.
(: find-char (char string --> (or fixnum false)))
(define (find-char targ str #!optional (start 0))
  (define len (string-length str))
  (let loop ((i start))
    (if (< i len)
        (if (char=? (string-ref str i) targ)
            i
            (loop (+ i 1)))
        #f)))

;; Find the index of the first occurence of a whitespace character within STR.
;; The search begins at the index START. Return false if no whitespace character
;; is found.
(: find-whitespace (string fixnum --> (or fixnum false)))
(define (find-whitespace str #!optional (start 0))
  (define len (string-length str))
  (let loop ((i start))
    (if (< i len)
        (if (char-whitespace? (string-ref str i))
            i
            (loop (+ i 1)))
        #f)))

;; Find the index of the first occurence of a non-whitespace character within
;; STR. The search begins at the index START. Return false if no non-whitespace
;; character is found.
(: find-non-whitespace (string fixnum --> (or fixnum false)))
(define (find-non-whitespace str #!optional (start 0))
  (define len (string-length str))
  (let loop ((i start))
    (if (< i len)
        (if (char-whitespace? (string-ref str i))
            (loop (+ i 1))
            i)
        #f)))

;; Get the next word contained within STR, where a word is a sequence of
;; non-whitespace characters. The search begins at the index START. Return false
;; if no word is found.
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

;; Get a copy of STR where all the uppercase characters at an index greater than
;; or equal to START are replaced with their lowercase equivalents.
(: string-downcase (string fixnum --> string))
(define (string-downcase str #!optional (start 0))
  (define s (string-copy str))
  (define len (string-length str))
  (do ((i start (+ i 1)))
      ((>= i len) s)
    (string-set! s i (char-downcase (string-ref s i)))))
