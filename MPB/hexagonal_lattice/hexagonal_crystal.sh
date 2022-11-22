#!/bin/bash

# exit on errors and unbound variables
set -eu

# define BASE variable
BASE="hexagonal_crystal"

# run MPB and store output
mpb ${BASE}.ctl | tee ${BASE}.out

# filter out frequency lines
grep tefreqs ${BASE}.out > ${BASE}.te.dat

# post-process data
mpb-data -r -m 5 -n 320 ${BASE}-epsilon.h5

# create image
h5topng ${BASE}-epsilon.h5:data-new
