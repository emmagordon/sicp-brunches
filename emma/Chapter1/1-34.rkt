#lang racket

(define (f g)
  (g 2))

; If we ask the interpreter to evaluate (f f), then we have:
; (f f)
; (f 2)
; (2 2)
; which will give an error, as it contains 2 arguments but no operator to act on the/'m
