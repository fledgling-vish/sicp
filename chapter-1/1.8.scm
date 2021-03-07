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

; Newton's method for finding cube-root approximation

(define (good-enough? old-guess improved-guess)
  (< (fractional-change old-guess improved-guess) 0.01)) ; is change between old and new guess is less than 1%?

(define (improve guess x)
  ( /
     (+ (/ x (square guess)) (* 2 guess))
     3))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-root-iter (improve guess x) x)))
      
(define (cube-root x)
  (cube-root-iter 1.0 x))


; Same implementation as above but leveraging block structure to keep
; global environment clean
(define (cube-root-alt x)
  (define (good-enough? old-guess improved-guess)
    (< (fractional-change old-guess improved-guess) 0.01)) ; is change between old and new guess is less than 1%?
  (define (improve guess)
    ( /
      (+ (/ x (square guess)) (* 2 guess))
      3))
  (define (cube-root-iter guess)
    (if (good-enough? guess (improve guess))
	guess
	(cube-root-iter (improve guess))))
  (cube-root-iter  1.0))
      
