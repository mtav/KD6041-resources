; resolution and number of bands to compute
(set! resolution 64)
(set-param! num-bands 3)
; lattice definition
(set! geometry-lattice
  (make lattice
    (size 1 no-size no-size)
  ))
; define k-points
(set! k-points (list
  (vector3 -0.5 0 0)
  (vector3  0   0 0); Gamma
  (vector3  0.5 0 0)))
; add extra k-points
(set! k-points (interpolate 10 k-points))

; define the geometry
(set! geometry (list
  (make block
    (center -0.25 0 0)
    (material (make dielectric (index 2)))
    (size 0.5 infinity infinity))
  (make block
    (center 0.25 0 0)
    (material (make dielectric (index 3)))
    (size 0.5 infinity infinity))
))
; start the computation
(run-tm)
