#lang simply-scheme

; g has no arguments. We don't pass any arguments into g to use it. It returns a procedure to which
; we then pass an argument.

; The type of value returned by g is a procedure

(define (g)
  (lambda (x) (+ x 2)))

((g) 1)