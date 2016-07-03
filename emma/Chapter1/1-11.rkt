#lang racket
; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; iterative
(define (fn n)
  (if (< n 3)
      n
      (fn-iter 0 1 2 (- n 3))))

(define (fn-iter a b c count)
  (if (= count 0)
      (+ c (* 2 b) (* 3 a))
      (fn-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))