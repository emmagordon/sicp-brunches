#lang racket

(define (passes-fermat-test? n)
  (define (square x) (* x x))
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
           (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))
  (define (passes-test? a n)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (passes-test? (+ a 1) n))
          (else false)))
  (passes-test? 0 n))

; Prime numbers will pass:
(passes-fermat-test? 3)
(passes-fermat-test? 107)

; Non-Primes that are not Carmichael numbers will fail:
(passes-fermat-test? 4)
(passes-fermat-test? 99)
(passes-fermat-test? 250)

; Carmichael numbers will fool the test and pass:
(passes-fermat-test? 561)
(passes-fermat-test? 1105)
(passes-fermat-test? 1729)
(passes-fermat-test? 2465)
(passes-fermat-test? 2821)
(passes-fermat-test? 6601)