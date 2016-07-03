#lang racket

(define (filtered-accumulate filter? combiner null-value term a next b)
  (cond ((> a b)
         null-value)
        ((not (filter? a))
         (filtered-accumulate filter? combiner null-value term (next a) next b))
        (else
         (combiner (term a)
                   (filtered-accumulate filter? combiner null-value term (next a) next b)))))
          
(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (find-divisor x test-divisor)
  (cond ((> (square test-divisor) x) x)
        ((= (remainder x test-divisor) 0) test-divisor)
        (else (find-divisor x (inc test-divisor)))))
(define (smallest-divisor x)
  (find-divisor x 2))
(define (prime? x)
  (= x (smallest-divisor x)))

(define (sum-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-squares-of-primes 1 10)

(define (identity x) x)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (sum-relative-primes-less-than n)
  (define (relative-prime? x)
    (= (gcd n x) 1))
  (filtered-accumulate relative-prime? + 0 identity 1 inc (- n 1)))

(sum-relative-primes-less-than 10)