#lang simply-scheme

(define (substitute sent old-word new-word)
  (cond ((empty? sent) '())
        ((equal? (first sent) old-word) (sentence new-word (substitute (butfirst sent) old-word new-word)))
        (else (sentence (first sent) (substitute (butfirst sent) old-word new-word)))))

(substitute '(she loves you yeah yeah yeah not really) 'yeah 'maybe)