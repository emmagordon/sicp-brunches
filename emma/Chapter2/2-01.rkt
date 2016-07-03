#lang racket

(define (gcd a b)
  (let ((a (abs a))
        (b (abs b)))
    (if (= b 0)
        a
        (gcd b (remainder a b)))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (> (* n d) 0)
        (cons (/ (abs n) g)
              (/ (abs d) g))
        (cons (/ (- (abs n)) g)
              (/ (abs d) g)))))
