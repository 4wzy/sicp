#lang simply-scheme

(define (ends-e sent)
  (cond
      ((empty? sent) '())
      ((equal? (last (first sent)) 'e) (sentence (first sent) (ends-e (butfirst sent))))
      (else (ends-e(butfirst sent)))
    ))

(ends-e '(please put the salami above the blue elephant))