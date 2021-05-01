(define (zero f)
  (lambda (x) x))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


;;; two
;;; (add-1 zero)
;;; (add-1 (lambda (g) (lambda (y) y)))
;;; (lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) y)) f) x))))
;;; (lambda (f) (lambda (x) (f ((lambda (y) y) x))))
;;; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))


;;; two
;;; (add-1 one)
;;; (add-1 (lambda (g) (lambda (y) (g y))))
;;; (lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) (g y))) f) x))))
;;; (lambda (f) (lambda (x) (f ((lambda (y) (f y)) x))))
;;; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (+ a b) ;;; is applying f to x (a +  b) times (f (f (f... {a+b} x)))
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))




	       
