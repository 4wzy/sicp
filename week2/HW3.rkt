#lang simply-scheme

; In principle, we could build a version of Scheme with no primitives except lambda.
; Without lambdas:
(define (sumsq a b)
  (define (square x) (* x x))
  (+ (square a) (square b)))
(sumsq 3 4)

; With lambdas
((lambda (a b)
  ((lambda (square)
    (+ (square a) (square b)))
   (lambda (x) (* x x))))
   3 4)

; This is harder with recursive functions as we can't call the function by its name

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))
(fact 5)

; Solution: self

((lambda (n self)
  (if (= n 0)
  1
  (* n (self (- n 1) self))))
5
(lambda (n self)
  (if (= n 0)
  1
  (* n (self (- n 1) self)))))

; U Combinator
((lambda (func) (func func 5))
 
 (lambda (self n)
   (if (= n 0)
       1
       (* n (self self (- n 1))))))

