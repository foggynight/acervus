(declare (unit token))

(define make-token cons)

(define token-type car)

(define token-data cdr)

(define (token-directive? token)
  (eq? (token-type token) 'directive))

(define (token-label? token)
  (eq? (token-type token) 'label))

(define (token-operator? token)
  (eq? (token-type token) 'operator))

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
