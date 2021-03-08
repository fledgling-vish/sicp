; Code typed on board or Edwin Editor during lecture

; Tower of Hanoi
(define (print x y z)
  (display x)
  (display " ")
  (display y)
  (display " ")
  (display z)
  (newline))

(define (move n from to spare)
  (cond ((= n 0) "done")
	(else
	 (move (-1+ n) from spare to)
	 (print n from to)
	 (move (-1+ n) spare to from))))
  

; Fibonacci
(define (fib n) ; this procedure yeilds a tree recursion
  (cond
   ((< n 2) n)
   (else (+
	  (fib (- n 1))
	  (fib (- n 2))))))



; Fibonacci iter
(define (fib-alt n)
  (define (fib-iter count fc-2 fc-1) ; computes nth fibonacci number for n > 1
    (if (> count n)
	fc-1
	(fib-iter (1+ count) fc-1 (+ fc-1 fc-2))))
  (cond ((< n 2) n)
	(else (fib-iter 2 0 1))))

