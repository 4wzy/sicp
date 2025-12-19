#lang simply-scheme

; With higher-order functions but without lambdas

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (return-self a) a)

(define (sum-integers a b)
  (sum return-self a inc b))

(define (cube a)
  (* a a a))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (pi-next-term a) (+ a 4))

(define (pi-term a) (/ 1.0 (* a (+ a 2))))

(define (pi-sum a b)
  (sum pi-term a pi-next-term b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(sum-integers 1 10)
(sum-cubes 1 10)
(pi-sum 1 50)
(integral cube 0 1 0.001)