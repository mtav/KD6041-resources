;;;;; Define new parameters.
(define-param n1 1)
(define-param n2 3.2)

;;;;; Set parameters.
(set-param! resolution 64) ;; Set resolution.
(set-param! num-bands 3) ;; Set number of bands.

;;;;; Define the geometry lattice.
(set! geometry-lattice
  (make lattice
    (size 1 no-size no-size)
  )
)

;;;;; Define the geometry.
(set! geometry (list
  (make block
    (center -0.25 0 0)
    (material (make dielectric (index n1)))
    (size 0.5 infinity infinity)
  )
  (make block
    (center 0.25 0 0)
    (material (make dielectric (index n2)))
    (size 0.5 infinity infinity)
  )
))

;;;;; Define the desired k-points.
(set! k-points (list
  (vector3 -0.5 0 0)
  (vector3 0 0 0); Gamma
  (vector3 0.5 0 0)
))
(set! k-points (interpolate 10 k-points)) ;; add extra k-points

;;;;; Run the simulation.
(run-tm)
