//this function prints all results in external file Output.txt
void print()
{
    PrintWriter output1;
    output1 = createWriter("Output.txt");
 
    //prints members of each group
    output1.print("All Groups having their members with their final length and height:  ");
    output1.println("");
    output1.println("");
    for (int i = 0; i < no_Groups; i = i + 1) {
	output1.print("Group" + (i + 1)+"-");
 
	for (int j4 = 0; j4 < (v[i + 1] - v[i]); j4 = j4 + 1) {
	    output1.print(rectangles[members_grp1[i][j4]] + "("+nf(length[members_grp[i][j4]], 0, 2)+", "+nf(height[members_grp[i][j4]], 0, 2)+") ");
	}
	output1.println("");
 
    }
  
    output1.println("");
    output1.println("Number of Inner extra spaces are " + innerextraspace);
    output1.println("Number of Outer extra spaces are " + outerextraspace);
    output1.println("Area of plus shaped frame is " + totalarea);
    output1.println("Area of circulations and terraces is " + (totalarea - area_rects));
  
    output1.println("");
    output1.println("Final Adjacency Matrix is given as");
    output1.println("");
    for (int i = 0; i < n/2+1; i = i + 1) {
	output1.print(rectangles[i] + "   ");
    }
    for (int i = n/2+1; i < n; i = i + 1) {
	output1.print(rectangles[i] + "  ");
    }
    output1.println("");
    for (int i = 0; i < n; i = i + 1) {
	for (int j4 = 0; j4 < n; j4 = j4 + 1) {
	    output1.print("" + int (adjacencymatrix[i][j4]) + "    ");
	}
	output1.println("");
    }
    output1.println("");
  
    output1.println("Degrees of different rectangles are as follows");
    for (int j4 = 0; j4 < n/2; j4 = j4 + 1) {
	output1.print(int (degree[j4]) + "(" + rectangles[j4] + ") ");
    }
    output1.println("");
    for (int j4 = n/2; j4 < n; j4 = j4 + 1) {
	output1.print(int (degree[j4]) + "(" + rectangles[j4] + ") ");
    }
    
    output1.println("");
    output1.println("");
    output1.print("Mean: " + nf(meandegree, 0, 2) + "; ");
    output1.print("Standard deviation: " + nf(SD_degree, 0, 2) + "; ");
    output1.print("Dispersion: " + nf(dispersiondegree, 0, 2) + "%; ");
    output1.print("Maximum: " + int (degree1[0]) + "; ");
    output1.println("Minimum: " + int (degree1[n - 1]) + "; ");
    output1.println("");
 
    output1.print("Total number of edges: ");
    output1.println(nbrofedges);
 
 
    output1.println("");
    output1.println("Eigenvalues of adjacency matrix are given as");
    for (int i1 = 0; i1 < n/2; i1 = i1 + 1) {
	output1.print(nf(eigenRealValues1[i1], 0, 2) + " ");
    }
    output1.println("");
     for (int i1 = n/2; i1 < n; i1 = i1 + 1) {
	output1.print(nf(eigenRealValues1[i1], 0, 2) + " ");
    }
    output1.println("");
    output1.println("");
    output1.print("Maximum: " + nf(eigenRealValues11[0], 0, 2) + "; ");
    output1.print("Minimum: " + nf(eigenRealValues11[n - 1], 0, 2) + ";");
    output1.println("");
    output1.println("");
    output1.println("Characteristic Polynomial of Adjacency Matrix is given as");
    for (int i1 = 0; i1 < n / 2; i1 = i1 + 1) {
	if (i1 > 0)
	    output1.print("(" + round(characteristic[i1]) + ")");
	if (i1 < n)
	    output1.print("X^" + (n - i1));
	if (i1 < n)
	    output1.print(" + ");
    }
    output1.println("");
    for (int i1 = n / 2; i1 < n + 1; i1 = i1 + 1) {
	if (i1 > 0)
	    output1.print("(" + round(characteristic[i1]) + ")");
	if (i1 < n)
	    output1.print("X^" + (n - i1));
	if (i1 < n)
	    output1.print(" + ");
    }
    output1.println("");
 
 
    //obtaining chromatic number and then printing it
    import org.jgrapht.*;
    import org.jgrapht.graph.*;
    import org.jgrapht.alg.*;
 
    SimpleGraph < Integer, DefaultEdge > graph = new SimpleGraph < Integer, DefaultEdge > (DefaultEdge.class);
    for (int i = 0; i < n; i = i + 1) {
	graph.addVertex(new Integer(i));
    }
 
    for (int j2 = 0; j2 < nbrofpairs; j2 = j2 + 1) {
	graph.addEdge(new Integer(adjacentpair1[j2]), new Integer(adjacentpair2[j2]));
    }
    output1.println("");
    output1.print("Chromatic number of obtained graph: ");
    //Computing an approximation of the chromatic number of the graph
    output1.println(ChromaticNumber.findGreedyChromaticNumber(graph));
 
 
    output1.println("");
    output1.println("Distance Matrix is given as");
    output1.println("");
    for (int i = 0; i < n/2+1; i = i + 1) {
	output1.print(rectangles[i] + "   ");
    }
    for (int i = n/2+1; i < n; i = i + 1) {
	output1.print(rectangles[i] + "  ");
    }
 
    output1.println("");
    for (int i = 1; i < n + 1; i = i + 1) {
	for (int j4 = 1; j4 < n + 1; j4 = j4 + 1) {
	    output1.print(" " + distance[i][j4][n] + "   ");
	}
	output1.println("");
    }
    output1.println("");
    output1.print("Mean: " + nf(meandistance, 0, 2) + "; ");
    output1.print("Standard deviation: " + nf(SD_distance, 0, 2) + "; ");
    output1.println("Dispersion: " + nf(dispersiondistance, 0, 2) + "%; ");
    output1.println("");
    output1.println("Shortest path between different rectangles are as follows");
    output1.println("");
    //obtaining and printing shortest path between all pair of vertices
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = 1; j2 < n + 1; j2 = j2 + 1) {
	    if (i1 == j2)
		continue;
 
	    for (int p4 = 1; p4 < distance[i1][j2][n]; p4 = p4 + 1) {
		shrtstpath[0] = j2;
		shrtstpath[p4] = path[i1][shrtstpath[p4 - 1]][n];
	    }
	    output1.print(rectangles[i1 - 1] + " - ");
 
	    for (int p5 = distance[i1][j2][n] - 1; p5 > 0; p5 = p5 - 1) {
		output1.print(rectangles[shrtstpath[p5] - 1] + " - ");
	    }
	    output1.print(rectangles[j2 - 1]);
	    output1.println(" ");
	    if (j2 == n)
		output1.println(" ");
	}
    }
 
    output1.println("");
    output1.println("All cut vertices of obtained graph are given as");
 
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	if (cutvertex[i1] > 0)
	    output1.print(rectangles[cutvertex[i1] - 1] + "  ");
    }
 
    output1.println(" ");
    output1.println(" ");
    output1.println("All pair cut vertices of obtained graph are given as");
    
    for (int i1 = 1; i1 < n + 1; i1 = i1 + 1) {
	for (int j2 = i1 + 1; j2 < n + 1; j2 = j2 + 1) {
	    if (paircutvertex[i1][j2] == 1)
		output1.println("(" + rectangles[i1 - 1] + ", " + rectangles[j2 - 1] + "); ");       
	}
    }
 
    output1.println(" ");
    output1.println(" ");
    output1.println("Eccentricity of different rectangles are as follows");
    for (int j4 = 1; j4 < n/2 + 1; j4 = j4 + 1) {
	output1.print(int (eccentricity[j4]) + "(" + rectangles[j4 - 1] + ") ");
    }
    output1.println("");
    for (int j4 = n / 2 + 1; j4 < n + 1; j4 = j4 + 1) {
	output1.print(int (eccentricity[j4]) + "(" + rectangles[j4 - 1] + ")  ");
    }
 
    output1.println(" ");
    output1.println(" ");
    output1.print("Mean: " + nf(meaneccentricity, 0, 2) + "; ");
    output1.print("Standard deviation: " + nf(SD_eccentricity, 0, 2) + "; ");
    output1.print("Dispersion: " + nf(dispersioneccentricity, 0, 2) + "%; ");
    output1.println("");
    output1.print("Diameter: " + int (eccentricity1[1]) + "; ");
    output1.print("Radius: " + int (eccentricity1[n]) + "; ");
    output1.print("Center: ");
     for (int i1 = 0; i1 < number_C; i1 = i1 + 1) {
      output1.print(center_G[i1] + " ");
    }
 
    output1.println("");
    output1.println("");
    output1.println("First order moment of all different rectangles are given as follows");
    for (int j4 = 1; j4 < n / 2 + 1; j4 = j4 + 1) {
	output1.print(nf(FOM[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
    output1.println("");
    for (int j4 = n / 2 + 1; j4 < n + 1; j4 = j4 + 1) {
	output1.print(nf(FOM[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
 
    output1.println("");
    output1.println("");
    output1.print("Mean: " + nf(meanFOM, 0, 2) + "; ");
    output1.print("St. deviation: " + nf(SD_FOM, 0, 2) + "; ");
    output1.print("Dispersion: " + nf(dispersionFOM, 0, 2) + "%; ");
    output1.print("Maximum: " + nf(FOM1[1], 0, 2) + "; ");
    output1.println("Minimum: " + nf(FOM1[n], 0, 2) + "; ");
    output1.println("");
    output1.println("First order moment of all different rectangles(having surface one) are given as follows");
    for (int j4 = 1; j4 < n / 2 + 1; j4 = j4 + 1) {
	output1.print(nf(FOM2[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
    output1.println("");
    for (int j4 = n / 2 + 1; j4 < n + 1; j4 = j4 + 1) {
	output1.print(nf(FOM2[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
 
    output1.println("");
    output1.println("");
    output1.println("Moment of Inertia of all different rectangles are given as follows");
    for (int j4 = 1; j4 < n / 2 + 1; j4 = j4 + 1) {
	output1.print(nf(MOI[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
    output1.println("");
    for (int j4 = n / 2 + 1; j4 < n + 1; j4 = j4 + 1) {
	output1.print(nf(MOI[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
 
    output1.println("");
    output1.println("");
    output1.print("Mean: " + nf(meanMOI, 0, 2) + "; ");
    output1.print("St. deviation: " + nf(SD_MOI, 0, 2) + "; ");
    output1.print("Dispersion: " + nf(dispersionMOI, 0, 2) + "%; ");
    output1.print("Maximum: " + nf(MOI1[1], 0, 2) + "; ");
    output1.println("Minimum: " + nf(MOI1[n], 0, 2) + "; ");
    output1.println("");
    output1.println("Moment of Inertia of all different rectangles(having surface one) are given as follows");
    for (int j4 = 1; j4 < n / 2 + 1; j4 = j4 + 1) {
	output1.print(nf(MOI2[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
    output1.println("");
    for (int j4 = n / 2 + 1; j4 < n + 1; j4 = j4 + 1) {
	output1.print(nf(MOI2[j4], 0, 2) + "(" + rectangles[j4 - 1] + ") ");
    }
 
    //finding graph is bipartite or not and then printing it 
    output1.println("");
    output1.println("");
    output1.print("Bi-partiteness: ");
    for (int i1 = 0; i1 < n / 2; i1 = i1 + 1) {
	if ((eigenRealValues1[i1]) == -(eigenRealValues1[n - 1 - i1])) {
	    if (i1 == n / 2 - 1)
		output1.println("Graph is Bi-partite");
	    continue;
	} else {
	    output1.println("Graph is not Bi-partite");
	    break;
	}
    }
 
 
    //if graph is non planar print it
    for (int i = 1; i < n + 1; i = i + 1) {
	for (int j4 = 1; j4 < n + 1; j4 = j4 + 1) {
	    if (distance[i][j4][n] < 5000)
		continue;
	    if (i == n && j4 == n) {
		if (nbrofedges > 3 * n - 6) {
		    output1.println("");
		    output1.println("Planarity: ");
		    output1.println("Obtained Graph is not planar");
 
 
		}
	    }
	}
    }
 
    output1.flush();
    output1.close();
}
