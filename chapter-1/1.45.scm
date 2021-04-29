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

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))


(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g)
	       guess))

(define (pow a b)
  (define (T base count result)
    (cond ((= count 0) result)
	  ((even? count) (T (square base) (/ count 2) result))
	  (else (T base (-1+ count) (* base result)))))
  (T a b 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (define (aux g count result);; invariant applying g to result count times is applying f to x n times
      (cond ((= count 0) result)
	    ((even? count) (aux (compose g g) (/ count 2) result))
	    (else (aux g (-1+ count) (g result)))))
    (aux f n x)))

(define (nth-root x n); applying average-damp (floor (log n)) times
  (fixed-point-of-transform (lambda (y) (/ x (pow y (-1+ n))))
			 (repeated average-damp (floor (log n)))
			 1.0))
