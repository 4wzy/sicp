#lang simply-scheme

(define (square x)
  (* x x))

(define (every f sent)
  (if (empty? sent)
      '()
      (sentence (f (first sent)) (every f (butfirst sent)))))

(every square '(1 2 3 4))
(every first '(nowhere man))

(define (keep pred sent)
  (cond ((empty? sent) '())
        ((pred (first sent)) (sentence (first sent) (keep pred (butfirst sent))))
        (else (keep pred (butfirst sent)))))

(keep even? '(1 2 3 4 5 6))