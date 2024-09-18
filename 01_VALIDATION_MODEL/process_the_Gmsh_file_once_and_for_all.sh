#!/bin/bash
#
# create the absorbing and free surface files from the Gmsh file
#
echo "processing Gmsh..."
echo

cd MESH/

echo "creating msh file"
echo

# creates Gmsh mesh
gmsh model_2d_test01.geo -2 -format msh22 -o model_2d_test01.msh

# checks exit code
if [[ $? -ne 0 ]]; then exit 1; fi

echo
echo "exporting to specfem mesh files"
echo

# converts to specfem format files
python ../../../utils/Gmsh/LibGmsh2Specfem_convert_Gmsh_to_Specfem2D_official.py model_2d_test01.msh -t F -l A -b A -r A

# checks exit code
if [[ $? -ne 0 ]]; then exit 1; fi

cd ../

echo
echo "done"
echo
