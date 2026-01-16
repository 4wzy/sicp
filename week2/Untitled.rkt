#lang simply-scheme

; previous implementations:
(define (square x)
  (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
(sqrt 4)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(fixed-point cos 1.0)

; new implementation

(define (iterative-improve guess-good-enough? improve-guess)
  (define (iter guess)
    (if (guess-good-enough? guess)
    guess
    (iter (improve-guess guess))))
  iter)


(define (sqrt-2 target)
  (define (good-enough? guess)
    (< (abs (- (square guess) target)) 0.001))
  
  (define (improve guess)
    (average guess (/ target guess)))
  
  ((iterative-improve good-enough? improve) 1.0))
(sqrt-2 4.0)

(define (fixed-point-2 f first-guess)
  (define (close-enough? guess)
    (let ((next (f guess)))
      (< (abs (- guess next)) tolerance)))

  (define (improve guess)
    (f guess))

  ((iterative-improve close-enough? improve) first-guess))

(fixed-point-2 cos 1.0)