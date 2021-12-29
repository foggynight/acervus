(declare (unit error))

(import (chicken format))

(define (%error msg)
  (display msg)
  (newline)
  (exit 1))

(define (lexer-error msg)
  (%error (format #f "acervus: lexer error: ~A" msg)))

(define (parser-error msg)
  (%error (format #f "acervus: parser error: ~A" msg)))
