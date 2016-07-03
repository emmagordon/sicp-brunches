#lang racket

(define (n x i)
  (if (= i 1)
      x
      (* x x)))

(define (d i)
  (- (* 2 i) 1))

(define (tan-cf x k)
  (define (iter result i)
    (let ((i-term (/ (n x i) (- (d i) result))))
      (if (= i 1)
        i-term
        (iter i-term (- i 1)))))
  (iter 0 k))

(tan-cf 0 100)
(tan-cf 1.570 100)
(tan-cf 1.571 100)
(tan-cf 3.141 100)
(tan-cf 4.712 100)
(tan-cf 4.713 100)
(tan-cf 6.282 100)
