;;; sum-iter

(define (sum term a next b)
  (define (iter a result); invariant: result holds summation from a (sum's formal parameter) to (prev a (iter's formal parameter)) 
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))
