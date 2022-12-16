set OMPI_MCA_plm=isolated
set OMPI_MCA_btl_vader_single_copy_mechanism=none
set OMPI_MCA_rmaps_base_oversubscribe=yes
set OMPI_ALLOW_RUN_AS_ROOT=1
set OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

mpiexec -n 2 python -m mpi4py.bench helloworld
mpiexec -n 2 python -m mpi4py.bench ringtest

python ${RECIPE_DIR}/test_mpi4py.py

pip check
