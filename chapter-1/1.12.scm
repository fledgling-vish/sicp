;; Write a procedure that computes elements of Pascal's triangle by means of a recursive process.

; yields tree recursive process
(define (pascal-element row j)
  (if (or (= j 1) (= j row))
      1 ; first & last element in a row of pascal triangle is 1
      (+
       (pascal-element (-1+ row) (-1+ j))
       (pascal-element (-1+ row) j))))
