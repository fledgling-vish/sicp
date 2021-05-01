(define (div-interval x y)
  (if (or (contains-zero? x) (contains-zero? y))
      (error "Interval contains 0. Division by 0 is not defined")
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (contains-zero? i)
  (let ((l (lower-bound i))
	(u (upper-nound i)))
    (if (or
	 (and (> l 0) (> u 0))
	 (and (< l 0) (< u 0)))
	#t
	#f)))


