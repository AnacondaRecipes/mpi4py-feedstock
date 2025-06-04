#/bin/sh
set -ex

# Basic tests
mpiexec -n 1 python -m mpi4py --version
mpiexec -n 1 python -m mpi4py --mpi-std-version
mpiexec -n 1 python -m mpi4py --mpi-lib-version
mpiexec -n 2 python -m mpi4py.bench helloworld
mpiexec -n 2 python -m mpi4py.bench ringtest

$PYTHON ${RECIPE_DIR}/test_mpi4py.py

pip check

# $PYTHON -c "import mpi4py;
# import mpi4py.MPI;
# import mpi4py.futures;
# import mpi4py.util.dtlib;
# import mpi4py.util.pkl5;
# import mpi4py.util.sync;
# import mpi4py.util.pool"