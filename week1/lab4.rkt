#lang racket
(require simply-scheme)

(define (dupls-removed x)
  (cond ((empty? x) '())
        ((member? (first x) (butfirst x)) (dupls-removed (butfirst x)))
        (else (sentence (first x) (dupls-removed (bf x))))
        ))

(dupls-removed '(a b c a e d e b))
(dupls-removed '(a b c))
(dupls-removed '(a a a a b a a))


(define (dupls-removed2 x)
  (if (empty? x) '() (
     if (member? (first x) (butfirst x))
      (dupls-removed2 (butfirst x))
      (sentence (first x) (dupls-removed2 (bf x)))
   )))


(dupls-removed2 '(a b c a e d e b))