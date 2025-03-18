#!/bin/sh

set -ex

export OMPI_MCA_plm=isolated
export OMPI_MCA_btl_vader_single_copy_mechanism=none
export OMPI_MCA_rmaps_base_oversubscribe=yes
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

# Basic tests
mpiexec -n 1 python -m mpi4py --version
mpiexec -n 1 python -m mpi4py --mpi-std-version
mpiexec -n 1 python -m mpi4py --mpi-lib-version
mpiexec -n 2 python -m mpi4py.bench helloworld
mpiexec -n 2 python -m mpi4py.bench ringtest

#python ${RECIPE_DIR}/test_mpi4py.py

pip check
