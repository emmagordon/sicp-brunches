#lang racket

; the golden ratio, phi, satisfies:
; phi**2 = phi + 1
;
; or, re-arranging:
; phi = 1 + 1/phi
;
; i.e. phi is given by the value of x for which:
; f(x) = 1 + 1/x = x

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (est-phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(est-phi)