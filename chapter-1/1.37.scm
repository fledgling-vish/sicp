;;; k-tern Continued Fraction

(define (cont-frac n d k) ; yields recursive procedure
  (define (aux i); computes i to (k - i + 1)-term continued fraction
    (if (> i k)
	0
	(/ (n i)
	   (+ (d i)
	      (aux (1+ i))))))
  (aux 1))


(define (cont-frac-iter n d k)
  (define (T result i); result contains continued fraction from i+1 to k
    (if (= i 0)
	result
	(T (/ (n i)
	      (+ (d i) result))
	   (-1+ i))))
  (T 0 k))
