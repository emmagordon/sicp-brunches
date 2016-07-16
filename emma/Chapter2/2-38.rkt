#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


; (fold-right / 1 (list 1 2 3)) will evaluate to 3/2
; ... since 3/1 = 3, 2/3 = 2/3 and finally 1/(2/3) = 3/2

; whereas (fold-left / 1 (list 1 2 3)) will evaluate to 1/6
; ... since 1/1 = 1, 1/2 = 1/2 and finally (1/2)/3 = 1/6

; Similarly:
; (fold-right list '() (list 1 2 3)) will evaluate to (1 (2 (3 ())))
; whereas (fold-left list '() (list 1 2 3)) will evaluate to (((() 1) 2) 3)


; To guarantee that fold-left and fold-right will produce the same values for any sequence, op should be associative.