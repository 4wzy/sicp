#lang simply-scheme

; here are the different cases

; (f)
(define (f)
  5)

(f)

; (f 3)
(define (f2 x)
  (lambda (y) (+ x y)))

(f2 3)

; ((f))
; must be a procedure that has 0 formal parameters and returns a procedure which
; also has 0 formal parameters
(define (f3)
  (lambda () 6))

((f3))

; (((f)) 3)
(define (f4)
  (lambda ()
    (lambda (x) (+ x 4))))

(((f4)) 3)