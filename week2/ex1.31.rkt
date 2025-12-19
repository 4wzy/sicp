#lang simply-scheme

(define (sum f start end)
  (if (< start end)
      (+ (f start) (sum f (+ start 1) end))
      (f start)))

(define (product f start end)
  (if (< start end)
      (* (f start) (product f (+ start 1) end))
      (f start)))

(define (factorial num)
  (product (lambda (x) x) 1 num))

(factorial 6)

(define (next-term x)
  (if (even? x)
      (/ (+ x 2) (+ x 1))
      (/ (+ x 1) (+ x 2))))

(* 4.0 (product next-term 1 20000))