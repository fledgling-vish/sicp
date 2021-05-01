(define (make-interval x y)
  (cons x y))

(define (upper-bound i)
  (cdr i))

(define (lower-bound i)
  (car i))

