#lang racket

(define (close-enough? x1 x2)
  (if (< (abs (- x1 x2)) 0.0001)
      true
      false))

(define (iterative-improve close-enough? improve)
  (lambda (guess) (let ((better-guess (improve guess)))
                        (if (close-enough? guess better-guess)
                            better-guess
                            ((iterative-improve close-enough? improve) better-guess)))))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (improve-guessed-root guess)
    (average guess (/ x guess)))
  ((iterative-improve close-enough? improve-guessed-root) 1.0))

(sqrt 25)

(define (fixed-point f)
  ((iterative-improve close-enough? f) 1.0))

(fixed-point cos)