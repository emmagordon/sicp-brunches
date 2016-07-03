#lang racket

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair non-empty-items)
  (if (= 1 (length non-empty-items))
      non-empty-items
      (last-pair (cdr non-empty-items))))

(last-pair (list 23 72 149 34))