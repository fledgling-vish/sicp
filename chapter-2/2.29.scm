(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))


(define (is-weight? s)
  (not (pair? s)))


(define (is-mobile? s)
  (list? s))

(define (total-weight m)
  (let ((ls (branch-structure (left-branch m)))
	(rs (branch-structure (right-branch m))))
    (if (is-weight? ls)
	(if (is-weight? rs)
	    (+ ls rs)
	    (+ ls (total-weight rs)))
	(if (is-weight? rs)
	    (+ (total-weight ls) rs)
	    (+ (total-weight ls) (total-weight rs))))))


(define (torque l w)
  (* l w))

(define (mobile-balanced? m)
  (let ((ls (branch-structure (left-branch m)))
	(rs (branch-structure (right-branch m)))
	(ll (branch-length (left-branch m)))
	(rl (branch-length (right-branch m))))
    (cond ((and (is-weight? ls) (is-weight? rs))
	   (if (= (torque ll ls) (torque rl rs))
	       true
	       false))
	  ((and (is-weight? ls) (not (is-weight? rs)))
	   (if (mobile-balanced? rs)
	       (if (= (torque ll ls) (torque rl (total-weight rs)))
		   true
		   false)
	       false))
	  ((and (not (is-weight? ls)) (is-weight? rs))
	   (if (mobile-balanced? ls)
	       (if (= (torque ll (total-weight ls)) (torque rl rs))
		   true
		   false)
	       false))
	  (else
	   (if (and (mobile-balanced? ls)
		    (mobile-balanced? rs))
	       (if (= (torque ll (total-weight ls))
		      (tprque rl (total-weight rs)))
		   true
		   false)
	       false)))))

;;; only need to change selectors of mobile & branch	 
	   
