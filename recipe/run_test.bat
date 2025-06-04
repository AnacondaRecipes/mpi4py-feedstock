set OMPI_MCA_plm=isolated
set OMPI_MCA_btl_vader_single_copy_mechanism=none
set OMPI_MCA_rmaps_base_oversubscribe=yes
set OMPI_ALLOW_RUN_AS_ROOT=1
set OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

mpiexec -n 1 python -m mpi4py --version
if errorlevel 1 exit 1

mpiexec -n 1 python -m mpi4py --mpi-std-version
if errorlevel 1 exit 1

mpiexec -n 1 python -m mpi4py --mpi-lib-version
if errorlevel 1 exit 1

mpiexec -n 2 python -m mpi4py.bench helloworld
if errorlevel 1 exit 1

mpiexec -n 2 python -m mpi4py.bench ringtest
if errorlevel 1 exit 1

@REM "%PYTHON%" %RECIPE_DIR%\test_mpi4py.py
@REM if errorlevel 1 exit 1

pip check
if errorlevel 1 exit 1

@REM "%PYTHON%" -c "import mpi4py;import mpi4py.MPI;import mpi4py.futures;import mpi4py.util.dtlib;import mpi4py.util.pkl5;import mpi4py.util.sync;import mpi4py.util.pool"
@REM if errorlevel 1 exit 1