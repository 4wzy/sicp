#lang simply-scheme

(define (make-tester w)
  (lambda (x) (equal? x w)))

((make-tester 'hal) 'hal)
((make-tester 'hal) 'cs61a)