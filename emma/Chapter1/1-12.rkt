#lang racket
(define (pascal-triangle row column)
  (cond ((> column row) 0)
        ((= row 1) 1)
        ((or (= column 1) (= column row)) 1)
        (else (+ (pascal-triangle (- row 1) (- column 1))
                 (pascal-triangle (- row 1) column)))))
