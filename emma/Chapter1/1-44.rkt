#lang racket

(define (smooth f)
  (define dx 0.0001)
  (lambda (x) (/ (+ (f (- x dx))
                     (f x)
                     (f (+ x dx)))
                3)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (lambda (x) ((compose f (repeated f (- n 1))) x))))

(define (n-fold-smoothed f n)
  (repeated smooth n) f)