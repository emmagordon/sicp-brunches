#lang racket

(define (cont-frac n d k)
  (define (iter result i)
    (let ((i-term (/ (n i) (+ (d i) result))))
      (if (= i 1)
        i-term
        (iter i-term (- i 1)))))
  (iter 0 k))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10) ; k=11 gives (1 / golden ratio) correct to 4 decimal places

(define (cont-frac-rec n d k)
  (define (rec i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (rec (+ i 1))))))
  (rec 1))

(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               10)