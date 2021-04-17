;; fast-exp-iter
;;(define (fast-exp b n)
;;  (cond ((= n 0) 1)
;;	((even? n) (square (fast-exp b (/ n 2))))
;;	(else (* b (fast-exp b (-1+ n))))))


;;(define (fast-exp-alt b n)
;;  (cond ((= n 0) 1)
;;	((even? n) (fast-exp-alt (* b b) (/ n 2)))
;;	(else (* b (fast-exp-alt b (-1+ n))))))


;;(define (fast-exp-iter base n)
;;  (define (aux b counter product); invariant: product * b^counter = base^n
;;    (cond ((= counter 0) product)
;;	  ((even? counter) (aux (* b b) (/ counter 2) product))
;;	  (else (aux b (-1+ counter) (* product b)))))
;;  (fast-exp-iter base n 1))

;;(define (fast-mult a b)
;;  (define (double x) (+ x x))
;;  (define (halve x) (/ x 2))
;;  (cond ((= b 0) 0)
;;	((even? b) (fast-mult (double a) (halve b)))
;;	(else (+ a (fast-mult a (-1+ b))))))

(define (fast-mult-iter n b)
  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (define (aux a counter acc) ; invariant acc + a*counter = n*b
    (cond ((= counter 0) acc)
	  ((even? counter) (aux (double a) (halve counter) acc))
	  (else (aux a (-1+ counter) (+ acc a)))))
  (aux n b 0))


