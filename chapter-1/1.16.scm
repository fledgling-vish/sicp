;; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps


(define (fast-exp-iter base n)
  (define (aux b counter product); invariant: product * b^counter is b^n
    (cond  ((= counter 0) product)
	   ((even? counter) (aux (square b) (/ counter 2) product))
	   (else (aux b (-1+ counter) (* product b)))))
  (aux base n 1))

