(define (smallest-divisor n)
  (define (aux d); invariant: there is no divisor of n between 2 to d - 1; if d is a divisor method will return d (the smallest viable divisor)
    (cond ((> (* d d) n) n); optimisation
	  ((= 0 (remainder n d)) d)
	  (else (aux (1+ d)))))
  (aux 2))

;;; (smallest-divisor 199) -> 199
;;; (smallest-divisor 1999) -> 1999
;;; (smallest-divisor 19999) -> 7

(define prime?
  (lambda (n)
    (= n (smallest-divisor n))))
