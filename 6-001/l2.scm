; Code typed on board or Edwin Editor during lecture

; Tower of Hanoi
(define (f) (+  0 0))

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
  
