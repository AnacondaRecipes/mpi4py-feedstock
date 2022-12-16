import os

import mpi4py
from mpi4py import MPI
import mpi4py.futures

vendor, version = MPI.get_vendor()
print(vendor, version)

print(MPI.Get_library_version())

# verify get_config paths exist (not links to build env)
config = mpi4py.get_config()
print(f"config={config}")

if vendor == 'Microsoft MPI':
    # https://github.com/erdc/mpi4py/blob/cf9bace83350fcd0db5b359e85402e2197d185fe/mpi.cfg#L173
    config_path_keys = ('include_dirs', 'library_dirs')
else:
    config_path_keys = ("mpicc", "mpicxx", "mpifort")


for name in config_path_keys:
    assert name in config
    path = config[name]
    assert os.path.exists(path), f"{name} missing: {path}"
