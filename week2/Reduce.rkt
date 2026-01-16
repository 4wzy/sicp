#lang simply-scheme

(define (reduce combiner base-value sent)
  (if (empty? sent)
      base-value
      (combiner (first sent) (reduce combiner base-value (butfirst sent)))))

(reduce + 0 '())
(reduce + 0 '(1 2 3 4))
(reduce * 1 '(1 2 3 4))
