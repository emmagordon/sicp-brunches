#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ (* x higher-terms) this-coeff))
              0
              coefficient-sequence))

; Compute the value of (1 + 3x + 5x^3 + x^5) at x=2:
(horner-eval 2 (list 1 3 0 5 0 1))  ; 79