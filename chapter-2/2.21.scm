(define (map T s)
  (if (null? s)
      (list)
      (cons (T (car s))
	    (map T (cdr s)))))

(define (square-list items)
  (if (null? items)
      (list)
      (cons (square (car items))
	    (square-list (cdr items)))))

(define (square-list-alt items)
  (map square items))


		    
	       
