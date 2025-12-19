#lang simply-scheme
(define (1+ x)
  (+ x 1))

(define (t f)
(lambda (x) (f (f (f x)))) )

; This will evaluate to 3, as we essentially replace the f with +1 in (t 1+)
; the (t 1+) returns (lambda (x) (1+ (1+ (1+ x)))), which we then call with x = 0
((t 1+) 0)

; The (t 1+) gives us (lambda (x) (1+ (1+ (1+ x)))).
; We use this as the 'f' parameter in t's body. Therefore, we get 3 of these calls,
; with each call calling the function 3 times. 3 x 3 = 9, so we call 1+ 9 times for
; the provided argument, which is 0. This results in 9.
((t (t 1+)) 0)

; This evaluates (t t) which gives us:
;"(lambda (x) (t (t (t x)))) )"
; And each of those t's evaluates the function passed in (+1) 3 times,
; so we get "(t x)" giving us three +1s, then (t (t x)) giving us 3 times those three +1s,
; which is 9. And again for 27.
(((t t) 1+) 0)