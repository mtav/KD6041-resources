;;;;; Define new parameters.
(define-param a12 1)
(define-param a3 1)

;;;;; Define the geometry lattice.
(set! geometry-lattice
  (make lattice
    (basis1 1 0 0) ; a1
    (basis2 0 1 0) ; a2
    (basis3 0 0 1) ; a3
    (basis-size a12 a12 a3) ; length of the lattice vectors
    (size 1 1 1) ; number of unit-cells along each lattice vector
  )
)

;;;;; Run the simulation.
(run-tm)
