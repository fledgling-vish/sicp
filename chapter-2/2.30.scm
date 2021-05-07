(define (square-tree t)
  (cond ((null? t) (list))
	((not (list? t)) (square t))
	(else (cons (square-tree (car t))
		    (square-tree (cdr t))))))

(define (square-tree-alt t)
  (map (lambda (st)
	 (if (pair? st)
	     (square-tree-alt st)
	     (square st)))
       t))

