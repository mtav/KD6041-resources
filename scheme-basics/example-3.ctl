(define-param x? true)
(define foo 555)
(if x?
  (begin
    (print "x? is true\n")
    (set! foo 47)
  )
  (begin
    (print "x? is false\n")
    (set! foo 2)
  )
)
(print "foo = " foo "\n\n")
(exit)
