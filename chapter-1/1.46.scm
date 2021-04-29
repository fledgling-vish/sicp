(define (iterative-improve good-enuf? improve-guess)
  (define (T guess)
    (if (good-enuf? guess)
	guess
	(T (improve-guess guess)))))

(define (fixed-point f guess)
  (define (good-enuf? x)
    (if (< (abs (- x (f x))) 0.001)
	#t
	#f))
  
  (define (improve-guess x) (f x))
  ((iterative-improve good-enuf? improve-guess) guess))


(define (sqrt x)
  (fixed-point (lambda (y) (/ (+ x (/ x y))
			      2))
	       1.0)
  


