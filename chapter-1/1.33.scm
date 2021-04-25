(define (filtered-accumulate combiner null-value p? term a next b)
  (if (> a b)
      null-value
      (cond ((p? a) (combiner (term a) (filtered-accumulate combiner null-value p? term (next a) next b)))
	    (else (filtered-accumulate combiner null-value p? term (next a) next b)))))

(define (prime? x)
  (define (T y)
    (if (> y (sqrt x))
	#t
	(cond ((= 0 (remainder x y)) #f); y divides x & y is not equal to x
	      (else (T (1+ y))))))
  (T 2))


(define (sum-of-squares-of-prime a b)
  (filtered-accumulate + 0 prime? square a (lambda (x) (1+ x)) b))

(define (product-relative-primes n)
  (filtered-accumulate * 1 (lambda (x) (= 1 (gcd n x))) (lambda (x) x) 2 (lambda (x) (1+ x)) (-1+ n)))
