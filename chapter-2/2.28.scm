(define (fringe l); l can be designed in a way that this takes O(square(#leaves))
  (cond ((null? l) l)
	((not (pair? l)) (list l))
	(else (append (fringe (car l))
		      (fringe (cdr l))))))

(define (fringe-alt l)
  (define (iter items acc)
    (if (null? items)
	acc
	(let ((head (car items))
	      (tail (cdr items)))
	  (if (list? head)
	      (iter tail (append acc (fringe head)))
	      (iter tail (append acc (list head)))))))
  (iter items '()))


(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))



  
