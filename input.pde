//number of rectangles
int n = 16;

//names of all rectangles
String rectangles[] = { "R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8",
                    "R9", "R10", "R11", "R12", "R13", "R14", "R15", "R16"};
 
//allocation matrix
int adjmat[][] = new int[n][n];	
//surfaces of all rectangles
float surfaces[] = new float[n];
//area of outer plot	
float[] plotarea = new float[1];
//length and hieght of outer plot	
float[] plot = new float[2];
//length of given rectangles
float[] length = new float[n];
//height of given rectangles
float[] height = new float[n];
float area_rects = 0;
 
 
//In this function, we import data from Input.txt file
void input()
{
 
   //calling Input.txt file
    String lines[] = loadStrings("Input.txt");
    
     //importing allocation matrix
    for (int i3 = 0; i3 < n; i3++) {
	for (int i = i3 + 1; i < i3 + 2; i++) {
 
	    String[]words = split(lines[i], ", ");
 
	    for (int i4 = 0; i4 < n; i4++) {
		adjmat[i3][i4] = int (words[i4]);
	    }
	}
    }
 
 
    //importing surface of each rectangle
    String[]words1 = split(lines[n + 2], ", ");
    for (int i3 = 0; i3 < n; i3++) {
	surfaces[i3] = float (words1[i3]);
        area_rects = area_rects + surfaces[i3];
    }
 
 
    //importing data for first change of rectangle
    String[]words3 = split(lines[n + 6], ", ");
    for (int i3 = 0; i3 < 3; i3++) {
	change1[i3] = int (words3[i3]);
    }
 
    //importing data for second change of rectangle
    String[]words4 = split(lines[n + 7], ", ");
    for (int i3 = 0; i3 < 3; i3++) {
	change2[i3] = int (words4[i3]);
    }
 
 
    //importing surface of plot
    String[]words2 = split(lines[n + 4], ", ");
    plotarea[0] = float (words2[0]);
 
 
    //importing group number
    String[]words5 = split(lines[n + 9], ", ");
    for (int i3 = 0; i3 < 5; i3++) {
	Grnumber[i3] = int (words5[i3]);
    }
 
   //importing spiral number
    String[]words7 = split(lines[n + 13], ", ");
    for (int i3 = 0; i3 < 5; i3++) {
	spiral[i3] = int (words7[i3]);
    }
    
    //importing ratio between length and height
    String[]words6 = split(lines[n + 11], ", ");
    float ratio = float (words6[0]);
 
    //obtaining length and height of plot
    plot[0] = sqrt(plotarea[0]);
    plot[1] = plot[0];
 
 
    //obtaining length and height of each rectangle
    for (int i1 = 0; i1 < n; i1 = i1 + 1) {
	length[i1] = sqrt(surfaces[i1] / ratio);
	height[i1] = length[i1] * ratio;
    }
 
 
    //saving length and height of each rectangle in new arrays
    for (int j4 = 0; j4 < n; j4 = j4 + 1) {
	L1[j4] = length[j4];
	H1[j4] = height[j4];
    }
 
}
