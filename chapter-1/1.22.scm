(define prime?
  (lambda (n)
    (define (smallest-divisor)
      (define (divides? d); returns #t if d dvides n
	(= 0 (remainder n d)))
      (define (aux d); invariant: there is no divisor of n between 2 to d - 1; if d is a divisor method will return d (the smallest viable divisor)
	(cond ((> (* d d) n) n); optimisation
	      ((divides? d) d)
	      (else (aux (1+ d)))))
      (aux 2))
    (= n (smallest-divisor))))

(define (timed-prime-test n)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (define (start-prime-test start-time)
    (cond ((prime? n)
	   (report-prime (- (runtime) start-time))
	   #t)
	  (else #f)))
  (newline)
  (display n)
  (start-prime-test (runtime)))

(define (search-for-primes start count)
  (define (aux n counter)
    (cond ((= counter 0))
	  ((timed-prime-test n) (aux (+ n 2) (-1+ counter)))
	  (else (aux (+ n 2) counter))))
  (if (even? start)
      (aux (1+ start) count)
      (aux (+ 2 start) count)))

;;; 1 (user) => (search-for-primes 1000 3)
;;; 
;;; 1001
;;; 1003
;;; 1005
;;; 1007
;;; 1009 *** 0.
;;; 1011
;;; 1013 *** 0.
;;; 1015
;;; 1017
;;; 1019 *** 0.


;;; 1 (user) => (search-for-primes 10000 3)
;;; 
;;; 10001
;;; 10003
;;; 10005
;;; 10007 *** 0.
;;; 10009 *** 0.
;;; 10011
;;; 10013
;;; 10015
;;; 10017
;;; 10019
;;; 10021
;;; 10023
;;; 10025
;;; 10027
;;; 10029
;;; 10031
;;; 10033
;;; 10035
;;; 10037 *** 0.



;;; 1 (user) => (search-for-primes 100000 3)
;;; 
;;; 100001
;;; 100003 *** 9.999999999999787e-3
;;; 100005
;;; 100007
;;; 100009
;;; 100011
;;; 100013
;;; 100015
;;; 100017
;;; 100019 *** 0.
;;; 100021
;;; 100023
;;; 100025
;;; 100027
;;; 100029
;;; 100031
;;; 100033
;;; 100035
;;; 100037
;;; 100039
;;; 100041
;;; 100043 *** 0



;;; 1 (user) => (search-for-primes 1000000 3)
;;; 
;;; 1000001
;;; 1000003 *** 0.
;;; 1000005
;;; 1000007
;;; 1000009
;;; 1000011
;;; 1000013
;;; 1000015
;;; 1000017
;;; 1000019
;;; 1000021
;;; 1000023
;;; 1000025
;;; 1000027
;;; 1000029
;;; 1000031
;;; 1000033 *** 0.
;;; 1000035
;;; 1000037 *** 0.

