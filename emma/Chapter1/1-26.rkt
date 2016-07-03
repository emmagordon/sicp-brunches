#lang racket
; By re-writing the expmod process to use explicit mutliplication rather than square, like so:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; it is transformed from an O(log n) process to an O(n) process since for (square (x)) we calculate (x)
; only once, whereas for (* (x) (x)) we calculate (x) twice, and this will be true for every step in the
; calculation, i.e. we will generate a tree to recurse down.
;
; The depth of this tree will be (log n), as per the number of steps in the previous approach. Since the
; execution time of the tree process grows exponentially with the depth of tree, this gives (exp (log n))
; i.e. (n) as the order of the new process.