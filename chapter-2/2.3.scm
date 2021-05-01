;;; abstraction-levels
;;; uses rectangles (area, perimeter)
;;; uses line-segments (length width make-rect), rectangles as line-segments
;;; line-segments as start-segment, end-segment (length-segment) 
;;; uses points (make-segment, start-segment, segment),  line-segments as pair of points
;;; uses cons car cdr

(define (area r)
  (* (length r)
     (width r)))

(define (perimeter r)
  (* 2
     (+ (length r)
	(width r))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-rect l1 l2)
  (cons l1 l2))

(define (length r)
  (length-segment (car r)))

(define (width r)
  (length-segment (cdr r)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (length-segment l)
  (let ((s (start-segment l))
	(e (end-segment l)))
    (sqrt (+ (square (- (x-point s)
			(x-point e)))
	     (square (- (y-point s)
			(y-point e)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment l)
  (car l))

(define (end-segment l)
  (cdr l))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


