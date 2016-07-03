#lang racket

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a (- b 1))))))
