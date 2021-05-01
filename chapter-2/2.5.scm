(define (pow base n)
  (define (aux b counter product); invariant: product * b^counter = base^n
    (cond ((= counter 0) product)
	  ((even? counter) (aux (* b b) (/ counter 2) product))
	  (else (aux b (-1+ counter) (* product b)))))
  (aux base n 1))



(define (cons x y)
  (* (pow 2 x)
     (pow 3 y)))

(define (f base)
  (lambda (n) ; returns the maximum power of base in n
    (define (aux x count); invariant: x * base^count is n
      (cond ((= (remainder x base) 0) (aux (/ x base) (1+ count)))
	    (else count)))
    (aux n 0)))

(define (car z)
  ((f 2) z))

(define (cdr z)
  ((f 3) z))

