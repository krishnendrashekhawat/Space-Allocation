float FOM[] = new float[100];	//gives first order moment
float FOM1[] = new float[100];
float FOM2[] = new float[100];
float meanFOM = 0;
float SD_FOM = 0;
float dispersionFOM = 0;
float I_0 = 0;
 
 
float MOI[] = new float[100];	//gives moment of inertia
float MOI1[] = new float[100];
float MOI2[] = new float[100];
float meanMOI = 0;
float SD_MOI = 0;
float dispersionMOI = 0;
 
 
float[] L1 = new float[100];	//length of each rectangle
float[] H1 = new float[100];	//height of each rectangle
 
 
void MOI()
{
 
    //calculating total weight   
    float totalweight = 0;
    for (int i = 1; i < n + 1; i = i + 1) {
	totalweight = totalweight + (length[i - 1] * height[i - 1]);
    }
 
 
    //calculating first order moment
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	    FOM[i1] = FOM[i1] + (L1[i3 - 1] * H1[i3 - 1] * distance[i1][i3][n]);
	}
	FOM[i1] = FOM[i1] / totalweight;
    }
 
 
    //saving first order moment in another array
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	    FOM2[i1] = FOM2[i1] + (distance[i1][i3][n]);
	}
	FOM2[i1] = FOM2[i1] / n;
    }
 
 
    //calculating mean of all first order moments
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	meanFOM = meanFOM + FOM[i1];
    }
    meanFOM = meanFOM / n;
 
 
    //calculating standard deviation of all FOM
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	SD_FOM = SD_FOM + (FOM[i1] - meanFOM) * (FOM[i1] - meanFOM);
    }
    SD_FOM = SD_FOM / n;
    SD_FOM = sqrt(SD_FOM);
 
 
    //calculating dispersion of all first order moments
    dispersionFOM = (SD_FOM / meanFOM) * 100;
 
 
    //calculating max and min of all first order moments
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	FOM1[i1] = FOM[i1];
    }
 
    for (int i = 1; i < n + 1; i = i + 1) {
	for (int j3 = i + 1; j3 < n + 1; j3 = j3 + 1) {
	    if (FOM1[i] < FOM1[j3]) {
		float temp = FOM1[i];
		FOM1[i] = FOM1[j3];
		FOM1[j3] = temp;
	    }
	}
    }
 
 
    //obtaining moment of inertia of all rectangles
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	    MOI[i1] = MOI[i1] + (L1[i3 - 1] * H1[i3 - 1] * distance[i1][i3][n] * distance[i1][i3][n]);
	}
 
	MOI[i1] = MOI[i1] / totalweight;
    }
 
 for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
            I_0 = I_0 + (L1[i3 - 1] * H1[i3 - 1] * L1[i1 - 1] * H1[i1 - 1] *distance[i1][i3][n] * distance[i1][i3][n]);
}
 }
 
 I_0 = I_0 / totalweight;
 I_0 = I_0 / totalweight;
 I_0 = I_0 / 2;
 println(I_0);
 
    //saving all moments of inertia in new array
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int i3 = 1; i3 < n + 1; i3 = i3 + 1) {
	    MOI2[i1] = MOI2[i1] + (distance[i1][i3][n] * distance[i1][i3][n]);
	}
 
	MOI2[i1] = MOI2[i1] / n;
    }
 
 
    //obtaining mean of all moments of inertia
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	meanMOI = meanMOI + MOI[i1];
    }
    meanMOI = meanMOI / n;
 
 
    //obtaining standard deviation of all moments of inertia
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	SD_MOI = SD_MOI + (MOI[i1] - meanMOI) * (MOI[i1] - meanMOI);
    }
    SD_MOI = SD_MOI / n;
    SD_MOI = sqrt(SD_MOI);
 
 
    //obtaining dispersion of all moments of inertia
    dispersionMOI = (SD_MOI / meanMOI) * 100;
 
 
    //obtaining max and min of all moments of inertia
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	MOI1[i1] = MOI[i1];
    }
 
   //arranging moment of inertia in ascending order
    for (int i = 1; i < n + 1; i = i + 1) {
	for (int j3 = i + 1; j3 < n + 1; j3 = j3 + 1) {
	    if (MOI1[i] < MOI1[j3]) {
		float temp = MOI1[i];
		MOI1[i] = MOI1[j3];
		MOI1[j3] = temp;
	    }
	}
    }
 
}
