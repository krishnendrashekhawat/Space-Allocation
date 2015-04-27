float eccentricity[] = new float[100];
//gives eccentricity of all vertices
float eccentricity1[] = new float[100];
float meaneccentricity = 0;
float SD_eccentricity = 0;
float dispersioneccentricity = 0;
String center_G[] = new String[10];
int number_C = 0; 
 
//this function gives eccentricity of all vertices 
void eccentricity()
{
    //to calculate eccentricity we have to find max distance of vertex i1 with any other vertex
 
    //save original distance which will be used for printing
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
	    (distance1[i1][j2][n]) = (distance[i1][j2][n]);
	}
    }
 
    //arranging all distances in ascending order
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	    for (int j2 = i3 + 1; j2 < n + 1; j2 = j2 + 1) {
		if ((distance1[i1][i3][n]) < (distance1[i1][j2][n])) {
		    int temp = (distance1[i1][i3][n]);
		    (distance1[i1][i3][n]) = (distance1[i1][j2][n]);
		    (distance1[i1][j2][n]) = temp;
		}
	    }
	}
 
	eccentricity[i1] = distance1[i1][1][n];
	//for i1th vertex max distance gives eccentricity
    }
 
    //calculating mean of all eccentricities 
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	meaneccentricity = meaneccentricity + eccentricity[i1];
    }
    meaneccentricity = meaneccentricity / n;
 
    //calculating standard deviation of all eccentricities
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	SD_eccentricity = SD_eccentricity + (eccentricity[i1] - meaneccentricity) * (eccentricity[i1] - meaneccentricity);
    }
    SD_eccentricity = SD_eccentricity / n;
    SD_eccentricity = sqrt(SD_eccentricity);
 
    //calculating dispersion of all eccentricities 
    dispersioneccentricity = (SD_eccentricity / meaneccentricity) * 100;
 
    //saving original eccentricities in array eccentricity1
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	(eccentricity1[i1]) = (eccentricity[i1]);
    }
 
    //calculating max and min of all eccentricities
    for (int i = 1; i < n + 1; i = i + 1) {
	for (int j3 = i + 1; j3 < n + 1; j3 = j3 + 1) {
	    if (eccentricity1[i] < eccentricity1[j3]) {
		float temp = eccentricity1[i];
		eccentricity1[i] = eccentricity1[j3];
		eccentricity1[j3] = temp;
	    }
	}
    }
   
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	if(eccentricity[i1] == eccentricity1[n]){
        center_G[number_C] = rectangles[i1-1];
        number_C ++;
      }
    }
    
}
