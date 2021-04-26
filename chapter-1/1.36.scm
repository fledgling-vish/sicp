(define (fixed-point f guess)
  (define (close-enuf? a b)
    (< (abs (- a b)) 0.0001))
  (define (T i o)
    (display i)
    (newline)
    (if (close-enuf? i o)
	i
	(T o (f o))))
  (T guess (f guess)))

(fixed-point (lambda (x) (/ (log 1000) (log x)))
	     2); 4.5554, takes 29 steps to compute

(define average
  (lambda (a b) (/ (+ a b) 2)))

(define (average-damping f)
  (lambda (x) (average x (f x))))

(fixed-point (average-damping (lambda (x) (/ (log 1000) (log x))))
	     2); 4.5555, takes 8 steps to compute

