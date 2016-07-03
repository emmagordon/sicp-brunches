#lang racket
; 2.7

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

; 2.8

; The smallest value of (x - y) is given by subtracting the largest possible
; value of y from the smallest possible value of x.

; Similarly, the largest possible value of (x - y) is given by subtracting the
; smallest possible value of y from the largest possible value of x.

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

; 2.9

(define (width-interval i) (/ (- (upper-bound i) (lower-bound i)) 2))

; For the sum of two intervals, x and y, given by:

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; The width of the sum is (width-interval (add-interval x y))

; Substituting:
; (/ (- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))) 2)

; We can re-arrange this to:
; (+ (/ (- (upper-bound x) (lower-bound x)) 2) (/ (- (upper-bound y) (lower-bound y)) 2))

; which is:
; (+ (width-interval x) (width-interval y))

; i.e. the width of the result of adding 2 intervals is a function only of the widths
; of the 2 intervals that were summed - specifically it is the sum of their widths.


; Similarly, the width of the result of subtracting 2 intervals is given by:

; (width-interval (sub-interval x y))
; (/ (- (- (upper-bound x) (lower-bound y)) (- (lower-bound x) (upper-bound y))) 2)

; which can be re-arranged to:

; (+ (/ (- (upper-bound x) (lower-bound x)) 2) (/ (- (upper-bound y) (lower-bound y)) 2))
; (+ (width-interval x) (width-interval y))

; which is again a function only of the widths of the original intervals (again, their sum)


; The result of multiplying two intervals is given by:

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; The width of this result, (width-interval (mul-interval x y)), is not a function only of the
; width of the intervals x and y.

; For example, consider the case where the min and max values above are p2 and p1 respectively
; (e.g. if the lower bounds of x and y were large negative values, and their upper bounds were small positive values)
; In this case the interval resulting from the mutliplication of x and y is given by:

; (make-interval (* (lower-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y)))

; which contains no contribution from the upper-bound of x, therefore the width of the resulting interval can
; not be expressed in terms of the respective widths of x and y.


; Similarly, the result of the division of two intervals is given by:

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; Since this is expressed in terms of mul-interval, we can see that again the width of the result will not be a function only
; of the widths of the original two intervals, since again the relative signs of the lower and upper bounds of x and y may mean
; that the upper and lower bounds of the result do not depend on both the upper and lower bounds of both x and y, and therefore
; the width of the result cannot be expressed in terms of the width of x and y.

; 2.10

(define (div-interval-zero-safe x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
      (error "Zero Division")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

; 2.11

;++++
;----
;+-+-
;-+-+
;++--
;--++
;+--+
;-++-
;+---
;-+--
;--+-
;---+
;-+++
;+-++
;++-+
;+++-

; 2.12

(define (make-center-percent c p)
  (make-interval (- c (* c p 0.01))
                 (+ c (* c p 0.01))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (width-interval i) (center i) 0.01))

; 2.13

