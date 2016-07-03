#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (inc x) (+ x 1))
(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(define (inc-2 x) (+ x 2))

(define (odd-factorial n)
  (product identity 1 inc-2 n))

(define (even-factorial n)
  (product identity 2 inc-2 n))

(define (square x) (* x x))

(define (pi-product n)
  (define last-even-term
    (if (even? n)
        n
        (- n 1)))
  (/ (/ (square (even-factorial n))
        (* 2 last-even-term))
     (square (odd-factorial n))))

(define (est-pi n)
  (* 4.0 (pi-product n)))

(est-pi 1000)

(define (iterative-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))