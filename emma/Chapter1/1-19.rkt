#lang racket
; a' = bq + aq + ap
; b' = bp + aq
;
; b" = b'p + a'q
;    = (bp + aq)p + (bq + aq + ap)q
;    = b(p^2 + q^2) + a(2pq + q^2)
;    = bp' + aq'
;
; where p' = p^2 + q^2
;       q' = q^2 + 2pq
;
; a" = b'q + a'q + a'p
;    = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;    = b(q^2 + 2pq) + a(2q^2 + 2pq + p^2)
;    = b(q^2 + 2pq) + a(q^2 + 2pq) + a(p^2 + q^2)
;    = bq' + aq' + ap'

(define (square x) (* x x))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 (* p q)))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
