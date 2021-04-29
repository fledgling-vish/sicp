(define (derivative f)
  (let ((dx 0.00001))
    (lambda (x) (/ (- (f (+ x dx))
		      (f x))
		   dx))))

(define (fixed-point f guess)
  (define (good-enuf? a b)
    (let ((tolerance 0.0001))
      (if (< (abs (- a b)) tolerance)
	  #t
	  #f)))
  (define (T input output)
    (if (good-enuf? input output)
	input
	(T output (f output))))
  (T guess (f guess)))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g)
	       guess))

(define (newton-transform g)
  (lambda (x) (- x
		 (/ (g x)
		    ((derivative g) x)))))


(define (newtons-method f guess)
  (fixed-point-of-transform f newton-transform guess))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
		 (* a (square x))
		 (* b x)
		 c)))


