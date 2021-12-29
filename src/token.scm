(declare (unit token))

(define make-token cons)

(define token-type car)

(define token-data cdr)

(define (token-directive? token)
  (eq? (token-type token) 'directive))

(define (token-label? token)
  (eq? (token-type token) 'label))

(define (token-instruction? token)
  (eq? (token-type token) 'instruction))

(define (token-location? token)
  (eq? (token-type token) 'location))

(define (token-number? token)
  (eq? (token-type token) 'number))

(define (token-character? token)
  (eq? (token-type token) 'character))

(define (token-string? token)
  (eq? (token-type token) 'string))

(define (token-operand? token)
  (memq (token-type token) '(location number character string)))

(define (token/data->symbol token)
  (string->symbol (token-data token)))

(define token/instruction->symbol token/data->symbol)

(define (token/character->char token)
  (define tok-str (token-data token))
  (define char-str (substring tok-str 1 (- (string-length tok-str) 1)))
  (cond ((string=? char-str "\n") #\newline)
        ((string=? char-str "\t") #\tab)
        (else (string-ref char-str 0))))

(define (token/immediate->value token)
  (cond ((token-number? token) (string->number (token-data token)))
        ((token-character? token) (token/character->char token))
        ((token-string? token) (token-data token))))

(define (token/operand->value token)
  (if (token-location? token)
      (token/data->symbol token)
      (token/immediate->value token)))
