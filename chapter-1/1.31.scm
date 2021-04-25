(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product (lambda (x) x)
	   1
	   (lambda (x) (1+ x))
	   n))

(define (piby4 n)
  (define (next x) (+ x 2))
  (/ (product (lambda (x) (* x (+ x 2)))  2.0 next (- n 2))
     (product square 3.0 next (-1+ n))))

(define (product-iter term a next b)
  (define (T x result); invariant: result is the product of values of term at points from a to (prev x)
    (if (> x b)
	result
	(T (next x) (* (term x) result))))
  (T a 1))


