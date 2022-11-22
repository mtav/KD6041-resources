;;;;; Define new parameters.
(define-param n_backfill 3.2)
(define-param n_holes 1)
(define-param a_um 0.4) ;; in um
(define-param r_um 0.14) ;; in um

;;;;; Define extra variables
(define r_n (/ r_um a_um))

;;;;; Set MPB parameters.
(set-param! resolution 32)
(set-param! num-bands 8)

;;;;; Define the geometry lattice.
(set! geometry-lattice (make lattice 
  (size 1 1 no-size) ; 2D simulation
  (basis1 ??? ??? ???)
  (basis2 ??? ??? ???)
  (basis3 ??? ??? ???)
))

;;;;; Define a default background material
(set! default-material (make dielectric (index n_backfill)))

;;;;; Define the geometry.
(set! geometry (list
    (make cylinder
      (center 0 0 0)
      (radius r_n)
      (height infinity)
      (material (make dielectric (index n_holes)))
    )
))

;;;;; Define the desired k-points.
(set! k-points (list
  (vector3 ??? ??? ???)          ; Gamma
  (vector3 ??? ??? ???)        ; M
  (vector3 ??? ??? ???) ; K
  (vector3 ??? ??? ???)          ; Gamma
))
(set! k-points (interpolate 4 k-points))

;;;;; Run the simulation.
(run-te) ; TE mode
