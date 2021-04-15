;; helper procedures
(define (sum-of-squares x y) (+
			      (* x x)
			      (* y y)))

(define (min x y z)
  (cond ((and (< x y) (< x z)) x)
	((and (< y x) (< y z)) y)
	(else z)))

;; procedure sum-of-squares-larger-two takes 3 numbers & returns the sum of squares of the 2 larger numbers
(define (sum-of-squares-larger-two x y z)
   (define smallest (min x y z))
   (cond ((= smallest x) (sum-of-squares y z))
	 ((= smallest y) (sum-of-squares x z))
	 (else (sum-of-squares x y))))
