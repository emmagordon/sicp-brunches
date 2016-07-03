#lang racket
; tree recursion for change problem with 11 cents
;                                     (cc 11 5)
;                                  /            \
;                             (cc 11 4)          (cc -39 5)
;                            /         \                |
;                       (cc 11 3)      (cc -14 4)       0
;                       /        \              |
;                  (cc 11 2)      (cc 1 3)____  0
;                 /       \             /     \
;         (cc 11 1)       (cc 6 2)   (cc 1 2) (cc -9 3)
;        /    \             /    \        / \        |    
; (cc 11 0) (cc 10 1)   (cc 6 1) (1 2)   1  1        0            
;    |     /     \          |    /    \
;    0 (cc 10 0) (cc 9 1)   1 (cc 1 1) (cc 0 2)
;        |       / \            |        |
;        0      0  (cc 8 1)     1        1
;                  / \
;                 0  (cc 7 1)
;                     .
;                     .
;                     .
;                    (cc 0 1)
;                     |
;                     1

; as the amount to be changed increases, the order of growth of...
; - space: 
; - num. steps: grows exponentially? (we'll calculate the same results multiple times - e.g. (cc 6 1) above)
