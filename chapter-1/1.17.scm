;; fast multiplication

(define (fast-mul a b)
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (cond ((= b 0) 0)
	((even? b) (fast-mul (double a) (halve b)))
	(else (+ a (fast-mul a (-1+ b))))))


