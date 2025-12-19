#lang simply-scheme

(define (make-adder num)
  (lambda (x) (+ x num)))

((make-adder 3) 7)

(define plus3 (make-adder 3))

(plus3 7)

(define (times-two num)
  (* num 2))

(define times-two-lambda (lambda (num) (* num 2)))

(times-two 4)
(times-two-lambda 4)

(define (try f) (f 3 5))

(try +)

(try word)

