// Gmsh project created on Thu Mar 24 09:03:44 2022


// BOX

lc=0.5;

Point(1) = {0, 0, 0, lc};
Point(2) = {120, 0, 0, lc};
Point(3) = {120, 40, 0, lc};
Point(4) = {120, 50, 0, lc};
Point(5) = {0, 50, 0, lc};
Point(6) = {0, 40, 0, lc};



Line(1) = {1, 2};
Line(2) = {2, 3};    
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
Line(7) = {6, 3};

// LAYER 1

Line Loop(1) = {7,3,4,5};
Plane Surface(1) = {1};

// LAYER 2

Line Loop(2) = {1,2,-7,6};
Plane Surface(2) = {2};


Recombine Surface{1,2};

// meshing
// quads mesh
//Mesh.SubdivisionAlgorithm = 1;
//Mesh.ElementOrder = 2;

//Mesh.Algorithm = 2; // frontal quad: 8;

// sizing
//Mesh.RecombinationAlgorithm = 2;
//Mesh.CharacteristicLengthFactor = 1.0;

Physical Line("Top") = {4};
Physical Line("Left") = {5,6};
Physical Line("Bottom") = {1};
Physical Line("Right") = {2,3};
Physical Surface("M1") = {1};
Physical Surface("M2") = {2};


//+
//Hide "*";
//+
//Show {
//  Curve{1}; Curve{2};Curve{3};Curve{4};Curve{5};Curve{6};Curve{7};Curve{8};Curve{9};Curve{10};Curve{11};Curve{12}; 
//}

















