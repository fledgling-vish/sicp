(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (integral f a b n); computes definite integral of f between a & b using simpson's rule
  (define h (/ (- b a) n))
  (define (term x)
    (define k (/ (- x a) h)); x is a + k*h
    (*
     (cond ((or (= k n) (= k 0)) 1)
	   ((even? k) 2)
	   (else 4))
     (f x)))
  (define (next x) (+ x h))
  (* (/ h 3.0)
     (sum term a next b)))
