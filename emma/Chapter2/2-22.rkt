#lang racket

(define (square x) (* x x))

(define (square-list-louis-reasoner-ver1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

; The above procedure will reverse the items as well as square them since it
; iterates through the list from the start, each time cons-ing the next item
; onto the built-up answer - where the effect of (cons item my-list) is to
; prepend the item to my-list.

(define (square-list-louis-reasoner-ver2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(square-list-louis-reasoner-ver2 (list 1 2 3 4))

; This time we won't reverse the list, but this also won't work. The initial
; answer on the first iteration is empty - when we do (cons '() 1) we get
; (() . 1) back, since we've put 1 after the null terminator identicating the
; end of the list. We'll then append to that result (which is also null-terminated)
; on the next iteraration, giving ((() . 1) . 4) and so on for the rest of the
; list elements we process.