#lang racket

(define (square x) (* x x))

(define (square-list-ver1 items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list-ver1 (cdr items)))))

(define (square-list-ver2 items)
  (map square items))

(square-list-ver1 (list 1 2 3 4))
(square-list-ver2 (list 1 2 3 4))