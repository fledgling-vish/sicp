(define (repeated f n)
  (lambda (x)
    (define (aux g count result);; invariant applying g to result count times is applying f to x n times
      (cond ((= count 0) result)
	    ((even? count) (aux (compose g g) (/ count 2) result))
	    (else (aux g (-1+ count) (g result)))))
    (aux f n x)))
