(define (fixed-point f guess)
  (define (close-enuf? a b)
    (< (abs (- a b)) 0.0001))
  (define (T i o)
    (if (close-enuf? i o)
	i
	(T o (f o))))
  (T guess (f guess)))

;;; golden ratio is the fixed point of f: x -> (1 + 1/x). This can be easily verified by substituting x with golden ratio in the function

(fixed-point (lambda (x) (+ 1.0 (/ 1 x)))
	     1)
