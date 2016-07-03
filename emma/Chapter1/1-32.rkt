#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum a b)
  (accumulate + 0 identity a inc b))

(define (product a b)
  (accumulate * 1 identity a inc b))

(sum 1 5)
(+ 1 2 3 4 5)

(product 1 5)
(* 1 2 3 4 5)

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum-iter a b)
  (accumulate-iter + 0 identity a inc b))

(sum-iter 1 5)