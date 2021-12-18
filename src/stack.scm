(declare (unit stack))

(define make-stack list)

(define (stack-push stack elem)
  (cons elem stack))

(define stack-pop cdr)

(define stack-top car)

(define stack-ref list-ref)

(define (stack-set stack index elem)
  (if (zero? index)
      (cons elem (cdr stack))
      (cons (car stack)
            (stack-set (cdr stack) (- index 1) elem))))
