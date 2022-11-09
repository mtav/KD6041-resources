#!/bin/bash
mpb square_lattice.ctl | tee square_lattice.out
grep freq square_lattice.out > square_lattice.dat
# Create an image of the primitive unit-cell:
mpb-data -r -n 320 -m 1 square_lattice-epsilon.h5
h5topng -o square_lattice-1x1.png -X10 -Y10 square_lattice-epsilon.h5:data-new
# Create an image of 3x3 unit-cells:
mpb-data -r -n 320 -m 3 square_lattice-epsilon.h5
h5topng -o square_lattice-3x3.png -X10 -Y10 square_lattice-epsilon.h5:data-new
