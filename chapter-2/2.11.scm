(define (make-interval l u) (cons l u))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (mul-interval i j)
  (let ((is-non-negative (lambda (x) (not (< x 0))))
	(a (lower-bound i))
	(b (upper-bound i))
	(c (lower-bound j))
	(d (upper-bound j)))
    (cond ((and (is-non-negative a) ; + + + +
		(is-non-negative b)
		(is-non-negative c)
		(is-non-negative d)) (make-interval (* a c)
						    (* b d)))
	  ((and (is-non-negative a) ; + + - +
		(is-non-negative b)
		(not (is-non-negative c))
		(is-non-negative d)) (make-interval (* b c)
						    (* b d)))
	  ((and (is-non-negative a) ; + + - -
		(is-non-negative b)
		(not (is-non-negative c))
		(not (is-non-negative d))) (make-interval (* b c)
							  (* a d)))
	  ((and (not (is-non-negative a)) ; - + + +
		(is-non-negative b)
		(is-non-negative c)
		(is-non-negative d)) (make-interval (* a d)
						    (* b d)))

	  ((and (not (is-non-negative a)) ; - + - -
		(is-non-negative b)
		(not (is-non-negative c))
		(not (is-non-negative d))) (make-interval (* b c)
							  (* a c)))

	  ((and (not (is-non-negative a)) ; - - + +
		(not (is-non-negative b))
		(is-non-negative c)
		(is-non-negative d)) (make-interval (* a d)
						    (* b c)))

	  ((and (not (is-non-negative a)) ; - - - +
		(not (is-non-negative b))
		(not (is-non-negative c))
		(is-non-negative d)) (make-interval (* a d)
						    (* a c)))

	  ((and (not (is-non-negative a)) ; - - - -
		(not (is-non-negative b))
		(not (is-non-negative c))
		(not (is-non-negative d))) (make-interval (* b d)
							  (* a c)))

	  ((and (not (is-non-negative a)) ; - + - +
		(is-non-negative b)
		(not (is-non-negative c))
		(is-non-negative d)) (make-interval (min (* a d) (* b c))
						    (max (* a c) (* b d))))
	  (else (error "One or both intervals are invalid")))))


		
		     
	  
