(define (reverse l)
  (define (T l- result); the head is consd to head of result
    (if (null? l-)
	result
	(T (cdr l-) (cons (car l-)
			  result))))
  (T l (list)))



(define (reverse-t t)
  (define (f t- result)
    (cond ((null? t-) result)
	  ((not (pair? t-)) t-)
	  (else (f (cdr t-)
		   (cons (f (car t-) (list))
			 result)))))
  (f t (list)))




			 
