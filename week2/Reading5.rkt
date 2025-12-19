#lang simply-scheme

(define (average x y)
  (/ (+ x y) 2.0))

(define (square x)
  (* x x))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
            tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? g next)
            next
            (try next))))
    (try first-guess))

(define (sqrt x)
  (fixed-point
   (average-damp
    (lambda (y) (/ x y)))
    1.0))

(sqrt 2)

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
        dx)))

(define (cube x) (* x x x))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (sqrt2 x)
  (newtons-method
   (lambda (y)
     (- (square y) x))
   1.0))

(sqrt2 2)