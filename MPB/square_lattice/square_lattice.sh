#!/bin/bash
mpb square_lattice.ctl | tee square_lattice.out
grep freq square_lattice.out > square_lattice.dat
mpb-data -m 3 square_lattice-epsilon.h5
h5topng -X10 -Y10 square_lattice-epsilon.h5:data-new
