#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define runtime current-inexact-milliseconds)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (begin (report-prime (- (runtime) start-time))
             true)
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (odd? n)
  (= (remainder n 2) 1))

(define (search-for-primes range-start range-end)
  (define start-point
    (if (odd? range-start)
        range-start
        (+ range-start 1)))
  (get-n-primes start-point range-end 3))

(define (get-n-primes range-start range-end n)
  (when (and (> n 0) (not (> range-start range-end)))
    (if (timed-prime-test range-start)
        (get-n-primes (+ range-start 2) range-end (- n 1))
        (get-n-primes (+ range-start 2) range-end n))))

(search-for-primes 1000 2000)
(newline)
(search-for-primes 10000 20000)
(newline)
(search-for-primes 100000 200000)
(newline)
(search-for-primes 1000000 2000000)