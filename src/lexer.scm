(declare (unit lexer)
         (uses global)
         (uses string)
         (uses token))

(import (chicken io)
        (chicken string))

(define (lex-word word operand)
  (make-token (cond ((char=? (first-char word) (directive-char)) 'directive)
                    ((char=? (last-char word) (label-char)) 'label)
                    (operand (if (char=? (first-char word) (location-char))
                                 'location
                                 'immediate))
                    (else 'operator))
              word))

(define (lex-line line)
  (define len (string-length line))
  (do ((i 0 (+ i 1))
       (operand #f)
       (tokens '()))
      ((>= i len) (reverse tokens))
    (let ((c (string-ref line i)))
      (cond ((char-whitespace? c))
            ((char=? c (comment-char)) (set! i (- len 1)))
            ((or (char=? c (char-delim)) (char=? c (string-delim)))
             (let ((targ (find-char c line (+ i 1))))
               (if targ
                   (let* ((word (substring line i (+ targ 1)))
                          (tok (make-token (if (char=? c (char-delim))
                                               'character
                                               'string)
                                           word)))
                     (set! i (+ i (string-length word)))
                     (set! tokens (cons tok tokens)))
                   (error "acervus: missing delimiter"))))
            (else (let* ((word (next-word line i))
                         (tok (lex-word word operand)))
                    (set! i (+ i (string-length word)))
                    (when (token-operator? tok) (set! operand #t))
                    (set! tokens (cons tok tokens))))))))

(define (lex-loop #!optional (line (read-line)))
  (if (eof-object? line)
      '()
      (cons (lex-line line) (lex-loop))))

(define (lex-file path)
  (with-input-from-file path
    lex-loop))

(define (lex-stdin)
  (lex-loop))
