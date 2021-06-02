(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (let ((head (car sequence))
            (tail (cdr sequence)))
        (op head (accumulate op initial tail)))))
            

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) (list) sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define (filter p? sequence)
  (accumulate (lambda (x y) (if (p? x) (cons x y) y)) (list) sequence))

;;; tests
(define x (list 1 2 3 4 5 6 7))
(define square (lambda (x) (* x x)))
(display (map square x))
(newline)
(display (append x x))
(newline)
(display (length x))
(newline)
(define (even? x) (= (remainder x 2) 0))
(display (filter even? x))
(newline)
