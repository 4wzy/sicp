#lang simply-scheme

(define (inc x)
  (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))


; This returns a function that applies the inc function 16 times
(((double (double double)) inc) 5)

; The first application, double double, looks like this:
(define (double-intermediate-1 double)
  (lambda (x) (double (double x))))
; Which becomes this. We noE a function that applies a given function 4 times.
(define (double-intermediate-2 f)
  (lambda (x) (f (f (f (f x))))))
; And then when we apply this as the function to double, we get
(define (double-intermediate-3 double-intermediate-2)
    (lambda (x) (double-intermediate-2 (double-intermediate-2 x))))
; When we evaluate the inner-most parentheses "(double-intermediate-2 x)", we get a function
; that applies a given function 4 times.
(define (double-intermediate-4 f)
    (lambda (x) ((double-intermediate-2 (lambda (x) (f (f (f (f x)))))) x)))
; Now, we can relpace each "f" in our double-intermediate-2 with the quadrupled function, giving us
; a quadrupler quadrupler, applying the input function 16 times
((double-intermediate-4 inc) 5)