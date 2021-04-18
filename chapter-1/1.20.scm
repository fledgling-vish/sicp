;;; (gcd a b) -> (gcd b r), where r i (remainder a b)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;;; Normal order evaluation
;;; (gcd 206 40) -> (gcd 40 (remainder 206 40)) ->
;;; (gcd
;;;   (remainder 206 40)
;;;   (remainder 40 (remainder 206 40))) ->
;;; (gcd
;;;  (remainder 40 (remainder 206 40))
;;;  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;; (gcd
;;;  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;;  (remainder  (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;;; total remainder calls: 1 + 2 + 4 + 7 + 4 -> 18

;;; Applicative order evaluation
;;; (gcd 206 40) -> (gcd 40 6) -> (gcd 6 4) -> (gcd 4 2) -> (gcd 2 0)
;;; total remainder calls: 1 + 1 + 1 + 1
