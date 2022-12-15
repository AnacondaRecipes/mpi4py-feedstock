set OMPI_CC=%CC%
set OMPI_CXX=%CXX%
set OMPI_FC=%FC%
set OPAL_PREFIX=%PREFIX%

%PYTHON% conf/cythonize.py
%PYTHON% -m pip install --no-deps --ignore-installed .