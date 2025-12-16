#lang racket
(require simply-scheme)

(define (sum-of-squares x y)
  (+ (* x x) (* y y))
  )

(define (fun x y z)
  (cond ((and (> x y) (> x z)) (if (> y z) (sum-of-squares x y) (sum-of-squares x z)))
        ((and (> y x) (> y z)) (if (> x z) (sum-of-squares y x) (sum-of-squares y z)))
        ((and (> z x) (> z y)) (if (> x y) (sum-of-squares z x) (sum-of-squares z y)))
         ))

(fun 6 5 2)