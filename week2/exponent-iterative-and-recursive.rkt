#lang simply-scheme

; -- recursive
(define (expt b n)
  (if (= n 0) 
      1 
      (* b (expt b (- n 1)))))

; -- linear
(define (expt-2 b n)
  (expt-2-iter b n 1))

(define (expt-2-iter b counter product)
  (if (= counter 0)
      product
      (expt-2-iter b (- counter 1) (* b product))))

(expt 4 6)
(expt-2 4 6)

; optimisation using successive squaring
(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 4 6)