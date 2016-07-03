#lang racket

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

;-------------------------------------------------------------------------------------
; First representation: define a rectangle by 2 points (those of the opposite corners)

;(define (make-rectangle p1 p2)
;  (cons p1 p2))

;(define (first-corner rectangle)
;  (car rectangle))

;(define (second-corner rectangle)
;  (cdr rectangle))

;-------------------------------------------------------------------------------------
; Second representation: define a rectangle by a line segment (one of its diagonals)

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define make-rectangle make-segment)

(define (first-corner rectangle)
  (make-point (x-point (start-segment rectangle))
              (y-point (start-segment rectangle))))

(define (second-corner rectangle)
  (make-point (x-point (end-segment rectangle))
              (y-point (end-segment rectangle))))

;-------------------------------------------------------------------------------------

(define (x-sep p1 p2)
  (abs (- (x-point p1) (x-point p2))))

(define (y-sep p1 p2)
  (abs (- (y-point p1) (y-point p2))))

(define (rectangle-area rectangle)
  (let ((p1 (first-corner rectangle))
        (p2 (second-corner rectangle)))
    (* (x-sep p1 p2) (y-sep p1 p2))))

(define (rectangle-perimeter rectangle)
  (let ((p1 (first-corner rectangle))
        (p2 (second-corner rectangle)))
    (* 2 (+ (x-sep p1 p2) (y-sep p1 p2)))))

(let ((p1 (make-point 1 3))
      (p2 (make-point 6 4)))
  (let ((rectangle (make-rectangle p1 p2)))
    (display "area=")
    (display (rectangle-area rectangle))
    (display ", perimeter=")
    (display (rectangle-perimeter rectangle))))
         