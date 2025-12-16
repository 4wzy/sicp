#lang simply-scheme

(define (ordered? numbers)
  (cond ((> (item 1 numbers) (item 2 numbers)) #f)
        ((= (count numbers) 2) #t)
        (else (ordered? (bf numbers)))
        ))

(ordered? '(1 2 31 6))