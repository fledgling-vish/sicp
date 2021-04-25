;;; accumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (T x result)
    (if (> x b)
	result
	(T (next x) (combiner result (term x)))))
  (T a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))
