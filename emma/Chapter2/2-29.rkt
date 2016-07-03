#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; Part a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

; Part b)
(define (branch-weight branch)
  (let ((hanging (branch-structure branch)))
    (if (pair? hanging)
        (total-weight hanging)
        hanging)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; Part c)
(define (torque branch)
  (* (branch-length branch) (branch-weight branch)))

(define (symmetrical? branch)
  (let ((hanging (branch-structure branch)))
    (if (pair? hanging)
        (balanced? hanging)
        true)))

(define (balanced? mobile)
  (let ((left-branch (left-branch mobile))
        (right-branch (right-branch mobile)))
    (if (not (= (torque left-branch) (torque right-branch)))
        false
        (and (symmetrical? left-branch) (symmetrical? right-branch)))))

; Part d)
;
; If the representations of mobiles were changed such that the constructors were:
;
; (define (make-mobile left right)
;   (cons left right))
;
; (define (make-branch length structure)
;   (cons length structure))
;
; Then we would need to change the defines for right-branch and branch-structure to just use cdr, rather than car of cdr.
; Otherwise there are no changes required - yay for abstractions :)
        