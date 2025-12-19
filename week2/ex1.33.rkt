#lang simply-scheme

; part 1

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> test-divisor n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (and (> n 1)
       (= n (smallest-divisor n))))

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-of-squares-of-primes-in-range a b)
  (filtered-accumulate (lambda (x y) (+ x y)) 0 square a (lambda (x) (+ x 1)) b prime?))

(sum-of-squares-of-primes-in-range 1 9)

; part 2

(define (relative-prime-to-n? n)
  (lambda (x) (= (gcd x n) 1)))

(define (product-of-positive-integers-lt-n-relatively-prime-to-n n)
  (filtered-accumulate (lambda (x y) (* x y)) 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n (relative-prime-to-n? n)))

(product-of-positive-integers-lt-n-relatively-prime-to-n 10)