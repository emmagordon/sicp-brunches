#lang racket
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; normal order evaluation:
;
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
;
; "if" is a special form that will evaluate (remainder  206 40) to see if this gives 0, i.e. what should be done next
; however, in normal order evaluation we don't keep the evaluated version...!
;
; since 6 != 0 ...
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; since 4 != 0 ...
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; since 2 != 0 ...
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; since 0 == 0 ...
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; (remainder 6 (remainder 40 6))
; (remainder 6 4)
; 2
;
; remainder is called 18 times
; ... 14 times when evaulating the if tests
; ... and 4 times when doing the reduction at the end


; applicative order evaluation:
;
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; 2
;
; remainder is called 4 times