;;; https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/projects/project1.pdf

;;; Problem 1
(define position; computes position of ball at time t, where a is initial acceleration, u is initial position, v is initial velocity & t is time
  (lambda (a v u t)
    (+
     u
     (* v t)
     (* (/ 1 2) a (square t)))))
