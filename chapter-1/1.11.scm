;; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
;; Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

;; yields recursive process 
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

;; yields iterative process
(define (f-iter n)
  (define (f-iter-aux counter a b c)
    (define fc (+ a (* 2 b) (* 3 c))) 
    (if (= counter n)
	fc
	(f-iter-aux (1+ counter) fc a b)))
  (cond ((< n 3) n)
	(else (f-iter-aux 3 2 1 0))))
