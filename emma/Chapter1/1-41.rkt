#lang racket
(define (double func)
  (lambda (x) (func (func x))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)
;(((double (lambda (x) (double (double x)))) inc) 5)
;

; 21