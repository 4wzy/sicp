#lang simply-scheme

(define (t f)
(lambda (x) (f (f (f x)))) )

(define (s x)
(+ 1 x))

; this is equilavent to:
; (lambda (x) (s (s (s x))))
((t s) 0)

; this is equilavent to:
; (lambda (x) (s (s (s (s (s (s (s (s (s x))))))))))
((t (t s)) 0) 

; just like in Lab5
(((t t) s) 0)