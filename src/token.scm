(declare (unit token))

(define make-token cons)

(define token-type car)

(define token-string cdr)

(define (token-directive? token)
  (eq? (token-type token) 'directive))

(define (token-label? token)
  (eq? (token-type token) 'label))

(define (token-operator? token)
  (eq? (token-type token) 'operator))

(define (token-location? token)
  (eq? (token-type token) 'location))

(define (token-immediate? token)
  (eq? (token-type token) 'immediate))

(define (token-operand? token)
  (or (token-location? token)
      (token-immediate? token)))
