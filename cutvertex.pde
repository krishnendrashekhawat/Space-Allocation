int cutvertex[] = new int[100];	//gives all cut vertex
int paircutvertex[][] = new int[100][100];	//gives all pair cut vertex
 
//this function gives all cut vertex and pair cut vertex of obtained graph 
void cutvertex()
{
    int distance2[][][] = new int[100][100][100];
    float adjacency2[][] = new float[100][100];
 
    for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	//finding that i3th vertex is cut vertex or not
	for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	    //this saves adjacency matrix in 2-D array adjacency2 matrix
	    for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		adjacency2[i1 - 1][j2 - 1] = adjacencymatrix[i1 - 1][j2 - 1];
	    }
	}
 
	//here we put all elements of i3th row of adjacency2 as zero and delete 
	//all edges between vertex i3 and other vertices. 
	for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	    for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		adjacency2[i3 - 1][j2 - 1] = 0;
		adjacency2[j2 - 1][i3 - 1] = 0;
		if (adjacency2[i1 - 1][j2 - 1] == 1)
		    distance2[i1][j2][0] = 1;
		else
		    distance2[i1][j2][0] = 5000;
	    }
	}
 
 
	for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	    //this is done because each time it just check that i3 vertex is cut vertex or not 
	    //otherwise if this is not done then it checks i3, i3-1, i3-2...vertices are cut vertex or not
	    for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		adjacency2[i1 - 1][j2 - 1] = adjacencymatrix[i1 - 1][j2 - 1];
	    }
	}
 
 
	//calculating distance between all pairs of vertices other than vertex i3.  
	for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	    distance2[i1][i1][0] = 0;
	}
 
	for (int p4 = 1; p4 < n + 1; p4 = p4 + 1) {
	    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		    if (distance2[i1][j2][p4 - 1] < (distance2[i1][p4][p4 - 1] + distance2[p4][j2][p4 - 1]))
			distance2[i1][j2][p4] = distance2[i1][j2][p4 - 1];
		    else
			distance2[i1][j2][p4] = (distance2[i1][p4][p4 - 1] + distance2[p4][j2][p4 - 1]);
 
		}
	    }
	}
 
	//checking vertex i3 is cut vertex or not
	for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	    if (i1 == i3)
		continue;
	    for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		if (j2 == i3)
		    continue;
		if (distance2[i1][j2][n] > n + 5)
		    //if when distance between vertex i1 and all other vertices
		    // is infinite it means graph is disconnected and vertex i3 is cut vertex
		    cutvertex[i3] = i3;
	    }
	}
    }
 
//now we calculate all pair of cut vertices
    int distance5[][][] = new int[100][100][100];
    float adjacency5[][] = new float[100][100];
 
    for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	for (int j3 = i3 + 1; j3 < n + 1; j3 = j3 + 1) {
	    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		    adjacency5[i1 - 1][j2 - 1] = adjacencymatrix[i1 - 1][j2 - 1];
		}
	    }
 
	    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		    adjacency5[i3 - 1][j2 - 1] = 0;
		    //this put all elements of i3th row of adjacency matrix as zero and all edges 
		    //between vertex i3 and other vertices are removed to check vertex i3 is cut vertex or not
		    adjacency5[j2 - 1][i3 - 1] = 0;
		    adjacency5[j3 - 1][j2 - 1] = 0;
		    //this put all elements of j3th row of adjacency matrix as zero and all edges 
		    //between vertex j3 and other vertices are removed to check vertex j3 is cut vertex or not
		    adjacency5[j2 - 1][j3 - 1] = 0;
		    if (adjacency5[i1 - 1][j2 - 1] == 1)
			distance5[i1][j2][0] = 1;
		    else
			distance5[i1][j2][0] = 5000;
		}
	    }
 
 
	    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		    adjacency5[i1 - 1][j2 - 1] = adjacencymatrix[i1 - 1][j2 - 1];
		}
	    }
 
	    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		distance5[i1][i1][0] = 0;
	    }
 
 
	    for (int p4 = 1; p4 < n + 1; p4 = p4 + 1) {
		for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		    for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
			if (distance5[i1][j2][p4 - 1] < (distance5[i1][p4][p4 - 1] + distance5[p4][j2][p4 - 1]))
			    distance5[i1][j2][p4] = distance5[i1][j2][p4 - 1];
			else
			    distance5[i1][j2][p4] = (distance5[i1][p4][p4 - 1] + distance5[p4][j2][p4 - 1]);
 
		    }
		}
	    }
 
 
	    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
		if (i1 == i3 || i1 == j3)
		    continue;
		for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		    if (j2 == i3 || j2 == j3)
			continue;
		    if (distance5[i1][j2][n] > n + 5)
			paircutvertex[i3][j3] = 1;
		}
	    }
	}
    }
 
 
}
