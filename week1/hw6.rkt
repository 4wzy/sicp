#lang simply-scheme


; if this were an ordinary procedure, it would display 11 as it would evaluate all the operands
; before applying the operator's procedure to them. It doesn't display 11, so it is a special form
(or (= 1 1) (display 11))

; vice versa here :) Notice we can see that 12 is displayed, and then the 'and' evaluates to false
(and (display 12) (= 1 0) (display 11))