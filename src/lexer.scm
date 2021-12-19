(declare (unit lexer)
         (uses global)
         (uses token))

(import (chicken io)
        (chicken string))

(define (remove-comment line)
  (define in-comment #f)
  (define in-string #f)
  (let loop ((i 0))
    (cond ((= i (string-length line)) line)
          (in-comment (substring line 0 (- i 1)))
          (else (let ((c (string-ref line i)))
                  (if in-string
                      (when (char=? c (string-delim)) (set! in-string #f))
                      (cond ((char=? c (comment-char)) (set! in-comment #t))
                            ((char=? c (string-delim)) (set! in-string #t))))
                  (loop (+ i 1)))))))

(define (lex-word word operand)
  (make-token word (cond ((char=? (string-ref word 0) (directive-char))
                          'directive)
                         ((char=? (string-ref word (- (string-length word) 1))
                                  (label-char))
                          'label)
                         (else (if operand
                                   (if (char=? (string-ref word 0)
                                               (location-char))
                                       'location
                                       'immediate)
                                   'operator)))))

(define (lex-line line)
  (define operand #f)
  (let loop ((split (string-split (remove-comment line))))
    (if (null? split)
        '()
        (let ((token (lex-word (car split) operand)))
          (when (token-operator? token)
            (set! operand #t))
          (cons token (loop (cdr split)))))))

(define (lex-loop #!optional (line (read-line)))
  (if (eof-object? line)
      '()
      (cons (lex-line line)
            (lex-loop (read-line)))))

(define (lex-file path)
  (with-input-from-file path
    (lambda () (lex-loop))))

(define (lex-stdin)
  (lex-loop))
