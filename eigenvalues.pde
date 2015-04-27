float eigenRealValues1[] = new float[100];	//gives eigen values
float eigenRealValues11[] = new float[100];
double eigenRealValues2[] = new double[100];
float characteristic[] = new float[100];
 
void eigenvalue()
{
 
    double adjacency1[][] = new double[100][100];
//gives adjacency matrix as unit double to use the Jama library
 
//calculates adjacency matrix to obtain eigen values
    for (int i = 0; i < n; i = i + 1) {
	for (int j2 = 0; j2 < nbrofpairs; j2 = j2 + 1) {
	    if (i == adjacentpair1[j2]) {
		adjacency1[i][adjacentpair2[j2]] = 1;
	    }
	    if (i == adjacentpair2[j2]) {
		adjacency1[i][adjacentpair1[j2]] = 1;
	    }
	}
    }
 
 
//here we use library Jama to obtain eigen values of adjacency matrix
    import Jama.*;
    Matrix mat = new Matrix(adjacency1, n, n);
 
    EigenvalueDecomposition eig = new EigenvalueDecomposition(mat);
 
//Compute the real part of the eigenvalues
    double[] eigenRealValues = eig.getRealEigenvalues();
 
//Compute the imaginary part of the eigenvalues
    double[] eigenImagValues = eig.getImagEigenvalues();
 
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {
	eigenRealValues2[i1] = eigenRealValues[i1];
    }
 
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {	//converting double to float
	eigenRealValues1[i1] = (float) eigenRealValues[i1];
    }
 
   //obtaining characteristic polynomial
    characteristic[0] = 1;
 
    for (int i = 0; i < n; i = i + 1) {
	for (int j3 = i + 1; j3 > 0; j3 = j3 - 1) {
	    characteristic[j3] = characteristic[j3] - characteristic[j3 - 1] * eigenRealValues1[i];
	}
    }
 
//saving orignal eigen values in eigenRealValues11
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {
	eigenRealValues11[i1] = eigenRealValues1[i1];
    }
 
//calculating max and min of eigenRealValues
    for (int i = 0; i < n; i = i + 1) {
	for (int j3 = i + 1; j3 < n; j3 = j3 + 1) {
	    if (eigenRealValues11[i] < eigenRealValues11[j3]) {
		float temp = eigenRealValues11[i];
		eigenRealValues11[i] = eigenRealValues11[j3];
		eigenRealValues11[j3] = temp;
	    }
	}
    }
 
}
