#lang simply-scheme

(define (make-safe func type-checker)
  (lambda (arg)
    (if (type-checker arg)
        (func arg)
        #f)))

(define safe-sqrt (make-safe sqrt number?))
(safe-sqrt 'hello)
(safe-sqrt 4)