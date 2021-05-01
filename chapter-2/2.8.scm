(define (make-interval x y)
  (cons x y))

(define (upper-bound i)
  (cdr i))

(define (lower-bound i)
  (car i))



(define (sub-interval i j)
  (let ((s1 (- (lower-bound i) (lower-bound j)))
	(s2 (- (lower-bound i) (upper-bound j)))
	(s3 (- (upper-bound i) (lower-bound j)))
	(s4 (- (upper-bound i) (upper-bound j))))
    (make-interval (min s1 s2 s3 s4)
		   (max s1 s2 s3 s4))))


(define (sub-interval-alt i j)
  (add-interval i
		(make-interval (- (upper-bound j))
			       (- (lower-bound j)))))

