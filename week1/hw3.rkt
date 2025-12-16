#lang simply-scheme

(define (switch sent)
  (cond ((empty? sent) '())
        ((or (equal? (first sent) 'You) (equal? (first sent) 'you)) (sentence 'I (switch-not-first-word (butfirst sent))))
        (else (switch-not-first-word sent))
  ))


(define (switch-not-first-word sent)
  (cond ((empty? sent) '())
        ((or (equal? (first sent) 'I) (equal? (first sent) 'me)) (sentence 'you (switch-not-first-word (butfirst sent))))
        ((or (equal? (first sent) 'You) (equal? (first sent) 'you)) (sentence 'me (switch-not-first-word (butfirst sent))))
        (else (sentence (first sent) (switch-not-first-word (butfirst sent))))))

(switch '(You told me that I should wake you up))