; simple function returning 
(define (f x)
  (define a 1) ; variable definition
  (+ a x) ; the last value gets returned
)

; test function
(print "f(2)=" (f 2) "\n")
