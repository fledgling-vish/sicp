(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1)
	    (append (cdr l1)
		    l2))))

(define (same-parity a . s)
  (define filter (lambda (s p?)
		   (cond ((null? s) (list))
			 ((p? (car s)) (cons (car s)
					     (filter (cdr s) p?)))
			 (else (filter (cdr s) p?)))))
  (let ((p? (lambda (x)
	      (if (or (and (even? a) (even? x))
		      (and (not (even? a)) (not (even? x))))
		  true
		  false))))
    (cons a (filter s p?))))





