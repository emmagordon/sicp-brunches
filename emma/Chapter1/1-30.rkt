#lang racket

; Iterative sum definition:
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

; Test the iterative sum definition by summing cubes:
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(sum-cubes 1 10)