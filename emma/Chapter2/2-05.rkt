#lang racket

(define (power base n)
  (cond ((= n 0) 1)
        ((= n 1) base)
        ((* base (power base (- n 1))))))

(define (cons a b)
  (* (power 2 a) (power 3 b)))

; all powers (!= 0) of 2 are even
; all powers of 3 are odd

; so for z = 2^a * 3^b, we can repeatedly divide by 2 until we get an odd number
; the number of times we have to divide gives us a

; similarly, to find b we can repeatedly divide by 3 until we get an even number

(define (car z)
  (get-a z 0))

(define (get-a z n)
  (if (odd? z)
      n
      (get-a (/ z 2) (+ n 1))))

(define (cdr z)
  (get-b z 0))

(define (divisible-by-3? z)
  (if (= z 0)
      false
      (= (remainder z 3) 0)))

(define (get-b z n)
  (if (divisible-by-3? z)
      (get-b (/ z 3) (+ n 1))
      n))

(let ((z (cons 3 4)))
  (display (car z))
  (newline)
  (display (cdr z)))