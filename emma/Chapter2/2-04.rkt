#lang racket

(define (cons x y)
  (lambda (m) (m x y)))

; i.e (cons x y) returns a function with one input,
; where the input is the function to apply to the bound values of x and y

(define (car z)
  (z (lambda (p q) p)))

; (car z)
; (z (lambda (p q) p))

; Substituting for z:
; ((lambda (p q) p) x y)
; x

(define (cdr z)
  (z (lambda (p q) q)))

; (cdr z)
; (z (lambda (p q) q))

; Substituting for z:
; ((lambda (p q) q) x y)
; y