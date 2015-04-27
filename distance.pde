int distance[][][] = new int[100][100][100];
int distance1[][][] = new int[100][100][100];
int path[][][] = new int[100][100][100];
int shrtstpath[] = new int[10000];
//gives shortest path between any two vertices
float meandistance = 0;
float SD_distance = 0;
float dispersiondistance = 0;

//Here we calculate distance and shortest path between all pairs of vertex using Floyd's algorithm 
void distance()
{
 
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
	    if (adjacencymatrix[i1 - 1][j2 - 1] == 1)
		//if two rectangles are adjacent then their distance is one
		distance[i1][j2][0] = 1;
	    else
		distance[i1][j2][0] = 5000;
	    //initially we consider if two rectangles are not adjacent then their distance is infinite
	}
    }
 
 
    //array path[][][] gives the immediate predecessor rectangle from rectangle i to rectangle j on the shortest path
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
	    //initially we consider immediate predecessor of rect j on the shortest path leading from rect i to rect j is rect i
	    path[i1][j2][0] = i1;
	}
    }
 
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {	//distance between rectanglei to rectanglei is zero
	distance[i1][i1][0] = 0;
    }
 
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	path[i1][i1][0] = 0;
    }
 
    //distance[i][j][k] is min(distance[i][j][k-1], distance[i][k][k-1]+distance[k][j][k-1])
    for (int p4 = 1; p4 < n + 1; p4 = p4 + 1) {
	for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	    for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
		if (distance[i1][j2][p4 - 1] < (distance[i1][p4][p4 - 1] + distance[p4][j2][p4 - 1]))
		    distance[i1][j2][p4] = distance[i1][j2][p4 - 1];
		else
		    distance[i1][j2][p4] = (distance[i1][p4][p4 - 1] + distance[p4][j2][p4 - 1]);
 
		if (distance[i1][j2][p4] == (distance[i1][j2][p4 - 1]))
		    path[i1][j2][p4] = path[i1][j2][p4 - 1];
		else
		    path[i1][j2][p4] = path[p4][j2][p4 - 1];
 
	    }
	}
    }
 
 
    //calculating mean of distances
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
	    meandistance = meandistance + distance[i1][j2][n];
	}
    }
    meandistance = meandistance / (n * n);
 
 
    //calculating standard deviation of distances
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
	    SD_distance = SD_distance + (-meandistance + distance[i1][j2][n]) * (-meandistance + distance[i1][j2][n]);
	}
    }
    SD_distance = SD_distance / (n * n);
    SD_distance = sqrt(SD_distance);
 
 
    //calculating dispersion of distances
    dispersiondistance = (SD_distance / meandistance) * 100;
 
}
