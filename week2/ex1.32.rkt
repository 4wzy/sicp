#lang simply-scheme

; these are the sums and products I used for 1.31
; note that these crash when b > a, and they don't use dependency injection (for next)
(define (sum term a b)
  (if (< a b)
      (+ (term a) (sum term (+ a 1) b))
      (term a)))

(define (product term a b)
  (if (< a b)
      (* (term a) (product term (+ a 1) b))
      (term a)))

; solving the problem in the same way (though not by the book's spec) gives
(define (accumulate combiner term a next b)
  (if (< a b)
  (combiner (term a) (accumulate combiner term (next a) next b))
  (term a))
  )

(define (sum-accumulate term a b)
  (accumulate (lambda (x y) (+ x y)) term a (lambda (x) (+ x 1)) b))

(define (product-accumulate term a b)
  (accumulate (lambda (x y) (* x y)) term a (lambda (x) (+ x 1)) b))

(sum-accumulate (lambda (x) (* x 2)) 1 4)
(product-accumulate (lambda (x) (+ x 1)) 1 4)

; this is the way I'm expected to solve it (I forgot the book gives us sum)
(define (sum-2 term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-2 term (next a) next b))))

(define (product-2 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-2 term (next a) next b))))

(define (accumulate-2 combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-2 combiner null-value term (next a) next b))))

(define (sum-accumulate-2 term a next b)
  (accumulate-2 (lambda (x y) (+ x y)) 0 term a next b))

(define (product-accumulate-2 term a next b)
  (accumulate-2 (lambda (x y) (* x y)) 1 term a next b))

(sum-accumulate-2 (lambda (x) (* x 2)) 1 (lambda (x) (+ x 1)) 4)
(product-accumulate-2 (lambda (x) (+ x 1)) 1 (lambda (x) (+ x 1)) 4)