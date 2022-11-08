;;;;; Define new parameters.
(define-param a12 1)
(define-param a3 1)

;;;;; Set parameters.
(set-param! num-bands 4)
(set-param! resolution 32)

;;;;; Define the geometry lattice.
(set! geometry-lattice
  (make lattice
    (basis1 1 0 0) ; a1
    (basis2 0 1 0) ; a2
    (basis3 0 0 1) ; a3
    (basis-size a12 a12 a3) ; length of the lattice vectors
    (size 1 1 no-size) ; make the simulation 2D
  )
)

;;;;; Define the geometry.
;;;;; Not needed unless you plan to run a simulation.
; ; The background material.
; (set! default-material (make dielectric (epsilon 1)))
; ; The geometry
; (set! geometry
  ; (list (make cylinder 
               ; (center 0 0 0)
               ; (radius 0.2)
               ; (height infinity)
               ; (material (make dielectric (epsilon 8.9)))
  ; ))
; )

;;;;; Define the desired k-points.
(set! k-points (list (vector3 0 0 0)     ; Gamma -> k_index = 1
                     (vector3 0.5 0 0)   ; X     -> k_index = 1 + 4 + 1= 6
                     (vector3 0.5 0.5 0) ; M     -> k_index = 6 + 4 + 1=11
                     (vector3 0 0 0)))   ; Gamma -> k_index = 11+ 4 + 1=16

;;;;; Run the simulation.
;(run-tm); No need to run the simulation first, although you can.

;;;;; We use (list-ref k-points i) to access the i-th element of the k-points list.
(print "==> Coordinates in the reciprocal basis:\n")
(print "Gamma:" (list-ref k-points 0) "\n")
(print "X:" (list-ref k-points 1) "\n")
(print "M:" (list-ref k-points 2) "\n")

(print "==> Coordinates in the cartesian basis:\n")
(print "Gamma:" (reciprocal->cartesian (list-ref k-points 0) ) "\n")
(print "X:" (reciprocal->cartesian (list-ref k-points 1) ) "\n")
(print "M:" (reciprocal->cartesian (list-ref k-points 2) ) "\n")

(exit)
