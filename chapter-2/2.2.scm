(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment l)
  (car l))

(define (end-segment l)
  (cdr l))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment l)
  (let ((s (start-segment l))
	(e (end-segment l))
	(average (lambda (a b) (/ (+ a b) 2.0))))
    (make-point (average (x-point s) (x-point e))
		(average (y-point s) (y-point e)))))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


