#!/bin/bash
mpb example_DBR_final.ctl | tee example_DBR_final.out
grep freq example_DBR_final.out > example_DBR_final.dat
mpb-data -m 3 example_DBR_final-epsilon.h5
h5topng -X10 -Y100 example_DBR_final-epsilon.h5:data-new
