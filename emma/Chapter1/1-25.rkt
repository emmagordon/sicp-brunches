#lang racket
; It is suggested it would have been easier to use:
(define (alt-expmod base exp m)
  (remainder (fast-expt base exp) m))

; where we can re-use the existing result:
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; instead of coming up with:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; This would compute the same result, so could be used for our prime tester.

; However, since the proposed alternative method leaves calculation of the remainder
; until the very end, rather than repeatedly during the process, we will be using
; larger numbers in our intermediate steps and it will therefore be slower. 