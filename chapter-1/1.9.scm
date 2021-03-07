; peano arithmetic
; using (+ 3 4) to illustrate the process instead of (+ 4 5) to keep the explanation shorter

(define (inc x)
  (+ 1 x)) ; their is a primitive increment operator as well 1+

(define (dec x)
  (- x 1)) ; their is a primitive decrement operator as well -1+
  
(define (+ a b); this procedure will yield a linear recursive procedure
  (if (= a 0)
      b
      (inc (+ (dec a) b)))) ;  this expression will result in building a chain of deferred inc operations
; (+ 3 4) -> (inc (+ 2 4)) -> (inc (inc (+ 1 4))) -> (inc (inc (inc (+ 0 4)))) -> (inc (inc (inc 4)))
; -> (inc (inc 5)) -> (inc 6) -> 7




(define (+ a b); this procedure will yield a linear iterative process
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
; (+ 3 4) -> (+ 2 5) -> (+ 1 6) -> (+ 0 7) -> 7


