#lang racket

(define (cont-frac n d k)
  (define (iter result i)
    (let ((i-term (/ (n i) (+ (d i) result))))
      (if (= i 1)
        i-term
        (iter i-term (- i 1)))))
  (iter 1 k))

(define (d i)
  (if (= (remainder i 3) 2)
      (* 2 (+ 1 (truncate (/ i 3))))
      1))

(define (est-e)
  (+ 2 (cont-frac (lambda (i) 1.0) d 100)))

(est-e)