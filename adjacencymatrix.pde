float adjacencymatrix[][] = new float[100][100];
float degree[] = new float[100];
float degree1[] = new float[100];
float meandegree = 0;
float SD_degree = 0;
float dispersiondegree = 0;
int nbrofedges = 0;
 
 
//this function obtains adjacency matrix and degree of all rectangles
//from the obtained adjacency pairs
void adjacencymatrix()
{
    //calculating adjacency matrix
    for (int i = 0; i < n; i = i + 1) {	//for each row of adjacency matrix
	for (int j2 = 0; j2 < nbrofpairs; j2 = j2 + 1) {
	    if (i == adjacentpair1[j2]) {
		adjacencymatrix[i][adjacentpair2[j2]] = 1;
		//(i,adjacentpair2[j2]) position is one in adjacency matrix i.e. 
		//ith rectangle is adjacent to second member of corresponding adjacency pair
	    }
	    if (i == adjacentpair2[j2]) {	//when i is equal to 2nd member of any adjacency pair
		adjacencymatrix[i][adjacentpair1[j2]] = 1;
		//then ith rectangle is adjacent to 1st member of corresponding adjacency pair
	    }
	}
    }
 
    //calculating number of edges
    for (int i = 0; i < n; i = i + 1) {
	for (int j2 = 0; j2 < n; j2 = j2 + 1) {
	    if (adjacencymatrix[i][j2] == 1) {
		nbrofedges++;
	    }
	}
    }
    nbrofedges = nbrofedges / 2;
 
 
    //now we calculate degree of each vertex
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {	//gives each row of adjacency matrix
	for (int j2 = 0; j2 < n; j2 = j2 + 1) {	//covering each element of each row
	    degree[i1] = degree[i1] + adjacencymatrix[i1][j2];
	    //adding all elements of ith row
	}
    }
 
    //calculating mean of degrees
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {
	meandegree = meandegree + degree[i1];
    }
    meandegree = meandegree / n;
 
    //calculating standard deviation of degrees
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {
	SD_degree = SD_degree + (degree[i1] - meandegree) * (degree[i1] - meandegree);
    }
    SD_degree = SD_degree / n;
    SD_degree = sqrt(SD_degree);
 
    //calculating dispersion of degrees
    dispersiondegree = (SD_degree / meandegree) * 100;
 
    //saving all degrees in new array degree1
    //we did this to print original in last
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {
	degree1[i1] = degree[i1];
    }
 
    //arranging all values of degree1 in ascending order to obtain max and min of all degrees
    for (int i = 0; i < n; i = i + 1) {
	for (int j3 = i + 1; j3 < n; j3 = j3 + 1) {
	    if (degree1[i] < degree1[j3]) {	//if degree of vertex i < degree of vertex j3
		//then swap degree of vertex i and vertex j3
		float temp = degree1[i];
		degree1[i] = degree1[j3];
		degree1[j3] = temp;
	    }
	}
    }
 
}
