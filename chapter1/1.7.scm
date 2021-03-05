; helper procedures
(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average x y)
  (/
   (+ x y)
   2
   ))


(define (fractional-change old new)
  (/ (abs (- new old)) old))

; This implementation might not return good approximations
; for small numbers because of relative high tolerance.
; While for very large numbers, it might become impossible
; to find approximation within given tolerance because of floating
; point arithmetic.
; (sqrt 456789098765435678987654567890) doesn't terminate or will take insane amount of time
(define (good-enough? guess x)
  (< (abs (-
	   (square guess)
	   x))
     0.001))

(define (improve guess x)
  (average
   guess
   (/ x guess)
   ))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; This implementation fixes the problems with above implementation
; by using a different algorithm for good-enough? procedure

(define (good-enough-alt? old-guess improved-guess)
  (< (fractional-change old-guess improved-guess) 0.01)); change in guess is less than 1%

(define (sqrt-iter-alt guess x)
  (if (good-enough-alt? guess (improve guess x)) 
  guess
  (sqrt-iter-alt (improve guess x) x)))
(define (sqrt-alt x)
  (sqrt-iter-alt 1.0 x))
