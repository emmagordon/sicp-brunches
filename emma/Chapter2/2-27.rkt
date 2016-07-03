#lang racket

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair items)
  (if (= 1 (length items))
      items
      (last-pair (cdr items))))

(define (all-but-last-pair items)
  (if (= 1 (length items))
      null
      (cons (car items) (all-but-last-pair (cdr items)))))

(define (deep-reverse items)
  (if (not (pair? items))
      items
      (cons (deep-reverse (car (last-pair items)))
            (deep-reverse (all-but-last-pair items)))))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)