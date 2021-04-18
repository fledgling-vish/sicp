;;; p' <- p^2 + q^2
;;; q' <- 2*p*q + q^2

(define (fib n)
  (define (fib-iter a b p q count); invariant: a total of (- n count) transformations have beeen applied on a mix of (p, q) & (a, b). Just before count becomes 0 transformation will be applied to (a, b) making them fib of n+1 & n respectively.
    (cond ((= 0 count) b)
	  ((even? count) (fib-iter a
				   b
				   (+ (* p p) (* q q))
				   (+ (* p q 2) (* q q))
				   (/ count 2)))
	  (else (fib-iter (+ (* b q) (* a (+ p q)))
			  (+ (* b p) (* a q))
			  p
			  q
			  (-1+ count)))))
  (fib-iter 1 0 0 1 n))


