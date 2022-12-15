#!/bin/bash

export OMPI_CC=$CC
export OMPI_CXX=$CXX
export OMPI_FC=$FC
export OPAL_PREFIX=$PREFIX

${PYTHON} conf/cythonize.py
${PYTHON} -m pip install --no-deps --ignore-installed .