(declare (unit stack))

(define make-stack list)

(define stack-length length)

(define stack-top car)

(define (stack-push stack . elems)
  (let loop ((stk stack)
             (els elems))
    (if (null? els)
        stk
        (loop (cons (car els) stk) (cdr els)))))

(define stack-pop cdr)

(define (stack-drop stack count)
  (list-tail stack count))

(define stack-ref list-ref)

(define (stack-set stack index elem)
  (if (zero? index)
      (cons elem (cdr stack))
      (cons (car stack)
            (stack-set (cdr stack) (- index 1) elem))))
