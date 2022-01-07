(declare (uses engine)
         (uses lexer)
         (uses parser))

(import (chicken process-context)
        (srfi 69))

(define (main path)
  (let ((pi-la (parse-tokens (lex-file path))))
    (engine-execute (car pi-la) (cdr pi-la))))

(main (car (command-line-arguments)))
