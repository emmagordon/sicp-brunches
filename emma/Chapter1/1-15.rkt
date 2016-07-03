#lang racket

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; (sine 12.15)
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.05))))))
; (p (p (p (p (p 0.05)))))
;
; p is applied 5 times

; More generally, when calculating (sine a), the number of times we call p will be the ceiling of (base-3-log (/ a 0.1))
; so the growth in both space and number of steps when calculating (sine a) is of O(log (a))