(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(define (reverse l)
  (if (null? l)
      (list)
      (append
       (reverse (cdr l))
       (list (car l)))))


