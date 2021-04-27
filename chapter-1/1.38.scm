(define (cont-frac n d k)
  (define (T result i); result contains continued fraction from i+1 to k
    (if (= i 0)
	result
	(T (/ (n i)
	      (+ (d i) result))
	   (-1+ i))))
  (T 0 k))


(define (aprox-e f)
  (+ 2
     (f (lambda (i) 1)
	(lambda (i)
	  (define (ap-term i); ap: 2, 5, 8, 11... returns index of i in the ap if it's a term of ap otherwise 0
	    (let (( kd (- i 2)))
	      (if (= 0 (remainder kd 3))
		  (1+ (/ kd 3))
		  0)))
	  (let ((k (ap-term i)))
	    (if (> k 0)
		(* 2.0 k)
		1.0)))
	1000)))


  
