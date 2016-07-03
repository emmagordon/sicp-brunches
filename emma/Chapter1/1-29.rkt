#lang racket

; FINISH/FIX!!!!!!!!!

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) b))))

(define (simpsons-integral f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x h))
  (define (k x) (/ (- x a) h))
  (define (coefficient k)
    (cond ((odd? k) 4)
          ((or (= k 0) (= k n)) 1)
          (else 2)))
  (define (term x)
    (* (coefficient (k x)) f))
  (* (sum term a next b)
     (/ h 3)))

(simpsons-integral cube 0 1 100)
(simpsons-integral cube 0 1 1000)