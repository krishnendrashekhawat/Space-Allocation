int[] vertex1 = new int[100];	//this is first vertex of any edge
int[] vertex2 = new int[100];	//this is second vertex of any edge
 
//this function draws graph for the obtained allocation 
void graph()
{
  
   //Obtaining different co-ordinates of x-axis for drawing graph 
   //so that any two vertices won't overlap
    for (int i1 = 0; i1 < 14; i1 = i1 + 4) {
	vertex1[i1] = i1 * 25 + 800;
    }
    for (int i1 = 2; i1 < 14; i1 = i1 + 4) {
	vertex1[i1] = i1 * 30 + 750;
    }
    for (int i1 = 1; i1 < 14; i1 = i1 + 4) {
	vertex1[i1] = -(i1 * 30) + 850;
    }
    for (int i1 = 3; i1 < 14; i1 = i1 + 4) {
	vertex1[i1] = -(i1 * 20) + 750;
    }
 
    for (int i1 = 14; i1 < nbrofpairs; i1 = i1 + 4) {
	vertex1[i1] = (i1 - 14) * 25 + 630;
    }
    for (int i1 = 16; i1 < nbrofpairs; i1 = i1 + 4) {
	vertex1[i1] = (i1 - 14) * 30 + 600;
    }
    for (int i1 = 15; i1 < nbrofpairs; i1 = i1 + 4) {
	vertex1[i1] = -((i1 - 14) * 25) + 680;
    }
    for (int i1 = 17; i1 < nbrofpairs; i1 = i1 + 4) {
	vertex1[i1] = -((i1 - 14) * 30) + 670;
    }
 
    for (int i1 = 0; i1 < nbrofpairs; i1 = i1 + 1) {
	//Obtaining different co-ordinates of y-axis
	vertex2[i1] = i1 * 38 + 25;
    }
 
 
    stroke(220, 0, 0);
 
 
    //now we draw graphs using co-ordinates obtained above
    for (int i1 = 0; i1 < nbrofpairs; i1 = i1 + 1) {	//it moves till number of adjacent pair
	line(vertex1[adjacentpair1[i1]]+90, vertex2[adjacentpair1[i1]], vertex1[adjacentpair2[i1]]+90, vertex2[adjacentpair2[i1]]);
	//draws line between all adjacent pairs
	PFont myFont7 = createFont("Times", 17);
	textFont(myFont7);
	fill(25, 28, 50);
	text(rectangles[adjacentpair1[i1]], vertex1[adjacentpair1[i1]]+90, vertex2[adjacentpair1[i1]]);
	//it writes name of the 1st vertex of any edge
	noFill();
	PFont myFont6 = createFont("Times", 17);
	textFont(myFont6);
	fill(25, 28, 50);
	text(rectangles[adjacentpair2[i1]], vertex1[adjacentpair2[i1]]+90, vertex2[adjacentpair2[i1]]);
	//it writes name of 2nd vertex of any edge
	noFill();
    }
 
    stroke(200, 123, 0);
}
