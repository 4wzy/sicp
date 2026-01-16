#lang simply-scheme

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated-iter initial-procedure current-procedure n)
  (if (= n 1)
      current-procedure
      (repeated-iter initial-procedure (compose initial-procedure current-procedure) (- n 1))))

(define (repeated procedure n)
  (repeated-iter procedure procedure n))


((repeated square 3) 5)