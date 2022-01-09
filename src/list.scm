(declare (unit list))

;; Get the last element of LST, or null if LST is null.
(: list-last (list --> *))
(define (list-last lst)
  (define (walk lst)
    (if (null? (cdr lst))
        (car lst)
        (walk (cdr lst))))
  (if (null? lst)
      '()
      (walk lst)))
