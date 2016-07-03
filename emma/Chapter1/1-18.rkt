#lang racket

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-* a b)
  (fast-*-iter a b 0))

(define (fast-*-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-*-iter (double a) (halve b) c))
        (else (fast-*-iter a (- b 1) (+ c a)))))
