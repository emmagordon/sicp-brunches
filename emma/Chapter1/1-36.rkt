#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess attempt-num)
    (display attempt-num) (display " ") (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ attempt-num 1)))))
  (try first-guess 1))

; without average damping (34 steps):
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)

; with average-damping (9 steps):
(define (average x y)
  (* 0.5 (+ x y)))

(fixed-point (lambda (x) (average (/ (log 1000) (log x)) x)) 2)
