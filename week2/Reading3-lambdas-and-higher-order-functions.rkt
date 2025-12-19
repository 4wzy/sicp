#lang simply-scheme

; With higher-order functions and lambdas


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-integers a b)
  (sum (lambda (x) x) a (lambda (x) (+ x 1)) b))

(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (sum cube a (lambda (x) (+ x 1)) b))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))

(sum-integers 1 10)
(sum-cubes 1 10)
(pi-sum 1 50)
(integral cube 0 1 0.001)