#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (r-reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (l-reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

; (r-reverse (list 1 2 3))
; (l-reverse (list 1 2 3))