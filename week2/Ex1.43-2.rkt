#lang simply-scheme
; This is the nicer, clearer solution.

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated procedure n)
  (if (= n 1)
      procedure
      (compose procedure (repeated procedure (- n 1)))))

((repeated square 3) 5)