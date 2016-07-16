#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;(dot-product (list 1 2 3 4) (list 2 3 4 5))

(define (matrix-*-vector m v)
  (map (lambda (i) (dot-product i v)) m))

;(matrix-*-vector (list (list 1 2 3 4) (list 1 2 3 4)) (list 2 3 4 5))

(define (transpose mat)
  (accumulate-n cons '() mat))

;(transpose (list (list 1 2 3 4) (list 1 2 3 4)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (map (lambda (col) (dot-product row col)) cols)) m)))

;(matrix-*-matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9))
;                 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
