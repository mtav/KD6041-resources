#!/bin/bash
mpb square_lattice.ctl | tee square_lattice.out
grep freq square_lattice.out > square_lattice.dat
# create an image of the primitive unit-cell
h5topng -o square_lattice-1x1.png -X10 -Y10 square_lattice-epsilon.h5:data
# create an image 3x3 unit-cells
mpb-data -m 3 square_lattice-epsilon.h5
h5topng -o square_lattice-3x3.png -X10 -Y10 square_lattice-epsilon.h5:data-new
