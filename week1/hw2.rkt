#lang racket
(require simply-scheme)

(define (square num)
  (* num num)
  )

(define (squares numbers)
  (if (empty? numbers)
      '()
      (sentence (square (first numbers)) (squares (bf numbers))))
  )

(squares '(2 3 4 5))