(define (list-pair l)
  (define (T el s) ; el is the most recent extracted element from sequence s. After reduction the sequence size reduces
    (if (null? s)
	(list el)
	(T (car s)
	   (cdr s))))
  (if (null? l)
      (list)
      (T "" l)))


	
