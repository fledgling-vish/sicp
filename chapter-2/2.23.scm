(define (for-each f items)
  (cond ((null? items) true)
	(else
	 (f (car items))
	 (for-each f (cdr items)))))
