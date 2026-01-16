#lang simply-scheme

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; cc 6 2
; cc 6 1 and cc 1 2
; cc 6 0 -> 0 and cc 5 1 | cc 1 1 and cc -4 2 -> 0
; cc 5 0 -> 0 and cc 4 1 -> 1 (eventually results in 1) | cc 1 0 -> 0 and cc 0 1 - > 1
; so there are 2 ways
(count-change 6)
(count-change 100)

; Lab1 Reverse order in which coins are tried

(define (count-change-reverse amount)
  (cc-reverse amount 5))

(define (cc-reverse amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc-reverse amount (- kinds-of-coins 1))
            (cc-reverse (- amount (first-denomination-reverse 
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination-reverse kinds-of-coins)
  (cond ((= kinds-of-coins 1) 50)
        ((= kinds-of-coins 2) 25)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 5)
        ((= kinds-of-coins 5) 1)))

(count-change-reverse 100)

;; reverse version 2

(define (count-change-reverse-2 amount)
  (cc-reverse-2 amount 1))

(define (cc-reverse-2 amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 6)) 
         0)
        (else 
         (+ (cc-reverse-2 amount (+ kinds-of-coins 1))
            (cc-reverse-2 (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

(count-change-reverse-2 100)