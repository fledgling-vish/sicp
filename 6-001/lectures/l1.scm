; Code typed on board or Edwin Editor during lecture

; Primitives & Means of combination
3 ; What's the value of this symbol
(+ 3 4 8) ; What's the value of this combination
(+ (* 3 (+ 7 19.5)) 4)
(+ (* 3 5)
   (* 47
      (- 20 6.8))
   12) ; Pretty printing, operands are indented & written vertically

; Means of abstraction
(define a (* 5 5))
(* a a)
(define b (+ a
	     (* 5 a)))
b
(+ a (/ b 5))

; naming general ideas
(define (square x) (* x x))
(square 1001)
(square (+ 5 7))
(+ (square 3) (square 4))
(square
 (square
  (square
   1001)))
square ; What's the value of this symbol
; Having defined square we can use it as a primitive
+ ; What's the value of this symbol

; case analysis
(define (abs x)
  (cond
   ((< x 0) (- x))
   (else x)))
