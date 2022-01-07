(declare (unit error))

(import (chicken format))

(define (%error msg)
  (display msg)
  (newline)
  (exit 1))

(define (lexer-error msg)
  (%error (format #f "acervus: syntax error: ~A" msg)))

(define (parser-error msg)
  (%error (format #f "acervus: parse error: ~A" msg)))

(define (engine-error type msg)
  (case type
    ((stack) (%error (format #f "acervus: stack error: ~A" msg)))
    ((type) (%error (format #f "acervus: type error: ~A" msg)))))
