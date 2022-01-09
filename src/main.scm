(declare (uses engine)
         (uses global)
         (uses lexer)
         (uses list)
         (uses parser))

(import (chicken process-context)
        (chicken string))

(define (main path)
  (filename (list-last (string-split path "/")))
  (let ((pi-la (parse-tokens (lex-file path))))
    (engine-execute (car pi-la) (cdr pi-la))))

(main (car (command-line-arguments)))
