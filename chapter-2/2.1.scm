(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d)))
	(t (cond ((or (and (< n 0) (> d 0))
		      (and (> n 0) (< d 0))) -)
		 (else +))))
    (cons (t (/ (abs n) g))
	  (/ (abs d) g))))

(define (numer x) (car x))
(define (denom x ) (cdr x))


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

