#lang racket

; FINISH/FIX!!!!!!!!!

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (and (not (= (expmod base (/ exp 2) m) 1))
                  (not (= (expmod base (/ exp 2) m) (- m 1)))
                  ( = (square (expmod base (/ exp 2) m))
                      (remainder 1 m)))
             0
             (remainder (square (expmod base (/ exp 2) m))
                        m)))
         (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-rabin-test n)
  (define (test a)
    (if (= (expmod a (- n 1) n) 0)
        false
        (= (expmod a (- n 1) n) 1)))
  (define (run-test a)
    (if (odd? n)
        (if (> a (/ n 2))
            true
            (test a))
        (if (= n 2)
            true
            false)))
  (run-test 2))

(define (prime? n)
  (miller-rabin-test n))

; Prime numbers will pass:
(prime? 3)
(prime? 107)
(prime? 109)

; Non-Primes that are not Carmichael numbers will fail:
(prime? 4)
(prime? 99)
(prime? 250)

; Carmichael numbers will not fool the test and will also fail:
(prime? 561)
(prime? 1105)

  