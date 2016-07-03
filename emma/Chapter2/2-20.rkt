#lang racket

(define (filter-by pred? items)
  (if (null? items)
      '()
      (let ((first (car items))
            (rest (cdr items)))
        (if (pred? first)
            (cons first (filter-by pred? rest))
            (filter-by pred? rest)))))

(define (same-parity int . ints)
  (if (odd? int)
      (cons int (filter-by odd? ints))
      (cons int (filter-by even? ints))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)