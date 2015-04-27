

void setup()
{ 
    size(1300, 700);		//gives size of screen
    input();		        //gets input from external file input.txt
    initialadjacency();		//calculates initial adjacency pairs
    groups();			//obtains number of required groups and their members
    changingrectangle();	//change location of a space from one group to other
    arrangingsizes();		//arrange members in each group according to their sizes in ascending order
    plusshapedframe();		//gives plus shaped frame with outer plot
    adjacencypairs();		//obtains final adjacency pairs
    adjacencymatrix();		//obtains adjacency matrix, degree of all rectangles
    eigenvalue();		//gives eigen values and characteristic function of adjacency matrix
    graph();		        //draws graph
    distance();			//gives distance and shortest path between all given spaces
    cutvertex();		//gives cut vertex and pair cut vertex of graph
    eccentricity();		//gives eccentricites of all given spaces, radius, diameter and center
    MOI();		        //gives 1st order moment and moment of inertia of all given spaces
    print();			//print all results in external file Output.txt, obtains chromatic number of obtained graph
                                // and check graph is bipartite or not
 
 
 
 
 
 
 
 
 
   //prints following things on the screen
  PFont myFont = createFont("Times", 20);
    textFont(myFont);
    text("Plus-shape floor plan", 180, 60);
    text("Adjacency graph ", 700, 65);
    PFont myFont1 = createFont("Times", 16);
    textFont(myFont1);
    text("Total Area = " + nf(totalarea, 0, 2), 50, 540);
    text("Area of C & T = " + nf((totalarea - area_rects), 0, 2), 50, 570);
    text("Max(MOI) = " + nf(MOI1[1], 0, 2), 50, 600);
    text("Min(MOI) = " + nf(MOI1[n], 0, 2), 50, 630);
    text("Diameter = " + int (eccentricity1[1]), 1000, 600);
    text("Radius = " + int (eccentricity1[n]), 1000, 630);
    text("Spirals Used: " + spiral[0] + ", " + spiral[1] + ", " + spiral[2] + ", " + spiral[3] + ", " + spiral[4], 600, 650);
    //save the screen as .jpg file
    saveFrame("allocation-####.jpg"); 
}
 
