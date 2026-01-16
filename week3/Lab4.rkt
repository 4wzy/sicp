#lang simply-scheme

(define (type-check func type-checker arg)
  (if (type-checker arg)
      (func arg)
      #f))

(type-check sqrt number? 'hello)
(type-check sqrt number? 4)