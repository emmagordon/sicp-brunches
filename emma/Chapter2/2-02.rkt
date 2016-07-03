#lang racket

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint segment)
  (let ((start-point (start-segment segment))
        (end-point (end-segment segment)))
    (make-point (average (x-point start-point) (x-point end-point))
                (average (y-point start-point) (y-point end-point)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(let ((p1 (make-point 1 3))
      (p2 (make-point 10 5)))
  (let ((segment (make-segment p1 p2)))
    (print-point (midpoint segment))))