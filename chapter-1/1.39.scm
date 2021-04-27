(define (cont-frac combiner n d k)
  (define (T result i); result contains continued fraction from i+1 to k
    (if (= i 0)
	result
	(T (/ (n i)
	      (combiner (d i) result))
	   (-1+ i))))
  (T 0 k))


(define (tan-cf x k)
  (define (pow a n)
    (define (T base exponent result); invariant: base^exponent * result = a^n
      (cond ((= exponent 0) result)
	    ((even? exponent) (T (square base) (/ exponent 2) result))
	    (else (T base (-1+ exponent) (* result base)))))
    (T a n 1))
  (cont-frac -
	     (lambda (i) (pow x i))
	     (lambda (i) (- (* 2 i)
			    1))
	     k))
