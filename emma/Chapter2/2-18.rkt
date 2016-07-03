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

(define (reverse items)
  (if (null? items)
      null
      (cons (car (last-pair items))
            (reverse (all-but-last-pair items)))))

(reverse (list 1 4 9 16 25))