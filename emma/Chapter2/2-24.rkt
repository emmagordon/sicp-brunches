#lang racket

(list 1 (list 2 (list 3 4)))

; the interpreter will evaluate this as:
;
; (1 (2 (3 4)))

; the corresponding box-and-pointer structure is:
;
; -> | . | .-|-->| . | / |
;      |           |        
;      1         | . | .-|-->| . | / |
;                  |           |
;                  2         | . | .-|-->| . | / |
;                              |           |
;                              3           4

; and the tree representation is:
;
;           .
;          / \
;         1   .
;            / \
;           2   .
;              / \
;             3   4