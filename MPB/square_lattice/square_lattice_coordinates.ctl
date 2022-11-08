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
; The background material.
(set! default-material (make dielectric (epsilon 1)))
; The geometry
(set! geometry
  (list (make cylinder 
               (center 0 0 0)
               (radius 0.2)
               (height infinity)
               (material (make dielectric (epsilon 8.9)))
  ))
)

;;;;; Define the desired k-points.
(set! k-points (list (vector3 0 0 0)     ; Gamma -> k_index = 1
                     (vector3 0.5 0 0)   ; X     -> k_index = 1 + 4 + 1= 6
                     (vector3 0.5 0.5 0) ; M     -> k_index = 6 + 4 + 1=11
                     (vector3 0 0 0)))   ; Gamma -> k_index = 11+ 4 + 1=16

;;;;; Run the simulation.
(run-tm); run in TM mode
