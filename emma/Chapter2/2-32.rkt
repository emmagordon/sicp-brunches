#lang racket

; Consider the subset 's-x' of s, created by removing element x from s.
; We can express the set of all subsets of s as containing all the subsets
; of s-x together with all the sets created by adding x to each of these subsets.
;
; e.g. for the set (1 2 3), the subsets of (1 2) are:
; (() (1) (2) (1 2))
; from which we can get the complete set of subsets of (1 2 3):
; (() (3) (1) (1 3) (2) (2 3) (1 2) (1 2 3))
;
; By applying this recursively, we get:

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (set)
                            (append set (list (car s))))
                          rest)))))

(subsets (list 1 2 3))