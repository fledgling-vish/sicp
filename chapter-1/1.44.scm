(define (smooth f)
  (define (average a b c) (/ (+ a b c) 3))
  (let ((dx 0.0001))
    (lambda (x) (average (f(- x dx))
			 (f x)
			 (f(+ x dx))))))


(define (n-fold-smooth f n)
  (repeated (smooth f) n))

