int[] adjacentpair1 = new int[100];	//gives first element of all adjacency pairs
int[] adjacentpair2 = new int[100];	//gives second element of all adjacency pairs
int nbrofpairs = 0;		//gives number of adjacency pairs
int j1;
 
//this function calculates all possible adjacent pairs
void adjacencypairs()
{
 
    for (int k8 = 0; k8 < (no_Groups - 1); k8 = k8 + 1) {
	//this will consider central group and each other group one by one
	j1 = k8;
 
	for (int k9 = 0; k9 < no_Groups; k9 = k9 + 1) {	//this consider each group one by one
 
	    //these variables will be used in calculation for length and height of rectangular frame
	    t5 = 0; t1 = 0; d = 0; d1 = 0;
 
	    k3 = Grnumber[k9];	//gives group number
	    no_rects = (v[k3 + 1] - v[k3]);	//number of rectangles in corresponding group
 
           //this part calculates length and height of frame for central group and then
           // adjacent members of this group
	    if (k3 == Grnumber[0]) {	//considering 1st group
		if (0 == spiral[0] || 1 == spiral[0] || 4 == spiral[0] || 5 == spiral[0]) {
		    //when 1st or 2nd or 5th or 6th spiral is used for group one
		    adjacencycal1();	//calculates length and height of rectangular frame for group 1
		    if (k8 == 0)
			adjacency1();	//gives adjacency among members of group one
		}

		if (2 == spiral[0] || 3 == spiral[0] || 6 == spiral[0] || 7 == spiral[0]) {
		    //when 3rd or 4th or 7th or 8th spiral is used for group one
		    adjacencycal2();
		    if (k8 == 0)
			adjacency1();	//gives adjacency among members of group one
		}
 
	    }
 
            //this part calculates length and height of frame for other groups and then
           // adjacent members of the group
	    if (k8 == j1) {
		if (k3 == Grnumber[j1 + 1]) {	//considering 2nd group
		    if (0 == spiral[j1 + 1] || 1 == spiral[j1 + 1] || 4 == spiral[j1 + 1] || 5 == spiral[j1 + 1]) {
			//when 1st  or 2nd or 5th or 6th spiral is used for group two
			adjacencycal1();	//calculates length and height of rectangular frame for group two
			adjacency1();	//gives adjacency among members of group 2
		    }

		    if (2 == spiral[j1 + 1] || 3 == spiral[j1 + 1] || 6 == spiral[j1 + 1] || 7 == spiral[j1 + 1]) {
			adjacencycal2();
			adjacency1();
		    }
 
		}
	    }
 
           //this part obtains the members of group 1 which can be adjacent to members of group 2 and their height
	    if (k8 == 0) {
		if (k3 == Grnumber[0]) {	//considering group1
		    if (0 == spiral[0]) {	//when 1st spiral is used
			adjacencyHeight(1, 1);
			//finds which members of group 1 can be adjacent to members of group 2 and their height
		    }

		    if (1 == spiral[0]) {
			adjacencyHeight(3, 1);
		    }

		    if (2 == spiral[0]) {
			adjacencyHeight(4, 1);
		    }

		    if (3 == spiral[0]) {
			adjacencyHeight(2, 1);
		    }

		    if (4 == spiral[0]) {
			adjacencyHeight(1, 2);
		    }

		    if (5 == spiral[0]) {
			adjacencyHeight(3, 2);
		    }

		    if (6 == spiral[0]) {
			adjacencyHeight(2, 2);
		    }

		    if (7 == spiral[0]) {
			adjacencyHeight(4, 2);
		    }

		}
 
               //this part first obtains the members of group 2 which can be adjacent to members of group 1 
               //and their heights and then obtain adjacent members of these two groups
		if (k3 == Grnumber[1] && (0 == spiral[0] || 4 == spiral[0])) {
		    //considering group 2 when 1st or 5th spiral is used for group one
		    if (0 == spiral[1]) {
			adjacencyHeight(3, 4);
			//finds which members of group 2 can be adjacent to members of group 1 and their height
			findingadjacencies(2, 0);	//finding adjacency between members of group 1 and group 2
		    }
		    if (1 == spiral[1]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 0);
		    }
		    if (2 == spiral[1]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 0);
		    }
		    if (3 == spiral[1]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 0);
		    }
		    if (4 == spiral[1]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 0);
		    }
		    if (5 == spiral[1]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 0);
		    }
		    if (6 == spiral[1]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 0);
		    }
		    if (7 == spiral[1]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 0);
		    }
		}
 
 
		if (k3 == Grnumber[1] && (1 == spiral[0] || 5 == spiral[0])) {
		    //considering group 2 when 2nd or 6th spiral is used for group one
		    if (0 == spiral[1]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 2);
		    }
		    if (1 == spiral[1]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 2);
		    }
		    if (2 == spiral[1]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 2);
		    }
		    if (3 == spiral[1]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 2);
		    }
		    if (4 == spiral[1]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 2);
		    }
		    if (5 == spiral[1]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 2);
		    }
		    if (6 == spiral[1]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 2);
		    }
		    if (7 == spiral[1]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 2);
		    }
		}
 
		if (k3 == Grnumber[1] && (2 == spiral[0] || 7 == spiral[0])) {
		    //considering group 2 when 3rd or 8th spiral is used for group one
		    if (0 == spiral[1]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 3);
		    }
		    if (1 == spiral[1]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 3);
		    }
		    if (2 == spiral[1]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 3);
		    }
		    if (3 == spiral[1]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 3);
		    }
		    if (4 == spiral[1]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 3);
		    }
		    if (5 == spiral[1]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 3);
		    }
		    if (6 == spiral[1]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 3);
		    }
		    if (7 == spiral[1]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 3);
		    }
		}
 
		if (k3 == Grnumber[1] && (3 == spiral[0] || 6 == spiral[0])) {
		    //considering group 2 when 4th or 7th spiral is used for group one
		    if (0 == spiral[1]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 1);
		    }
		    if (1 == spiral[1]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 1);
		    }
		    if (2 == spiral[1]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 1);
		    }
		    if (3 == spiral[1]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 1);
		    }
		    if (4 == spiral[1]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 1);
		    }
		    if (5 == spiral[1]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 1);
		    }
		    if (6 == spiral[1]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 1);
		    }
		    if (7 == spiral[1]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 1);
		    }
		}
	    }
 
            //this part obtains the members of group 1 which can be adjacent to members of group 3 and their lengths
	    if (k8 == 1) {
		if (k3 == Grnumber[0]) {	//considering group1
		    if (0 == spiral[0]) {	//when 1st spiral is used
			adjacencyLength(2, 2);
			//gives members of group1 which can be adjacent to members of group3 and their lengths
		    }
		    if (1 == spiral[0]) {
			adjacencyLength(4, 2);
		    }
		    if (2 == spiral[0]) {
			adjacencyLength(1, 2);
		    }
		    if (3 == spiral[0]) {
			adjacencyLength(3, 2);
		    }
		    if (4 == spiral[0]) {
			adjacencyLength(4, 1);
		    }
		    if (5 == spiral[0]) {
			adjacencyLength(2, 1);
		    }
		    if (6 == spiral[0]) {
			adjacencyLength(1, 1);
		    }
		    if (7 == spiral[0]) {
			adjacencyLength(3, 1);;
		    }
		}
 
                //this part obtains the members of group 3 which can be adjacent to members of group 1 and 
                //their lengths and then adjacent members of these two groups
		if (k3 == Grnumber[2] && (0 == spiral[0] || 5 == spiral[0])) {
		    //considering group 3 when 1st or 6th spiral is used for group one
		    if (0 == spiral[2]) {	//when spiral 1 is used for group3
			adjacencyLength(4, 3);
			//gives which member of group3 can be adjacent to members of group1 and their lengths
			findingadjacencies(3, 1);
			//gives adjacency between members of group1 and group3
		    }
		    if (1 == spiral[2]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 1);
		    }
		    if (2 == spiral[2]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 1);
		    }
		    if (3 == spiral[2]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 1);
		    }
		    if (4 == spiral[2]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 1);
		    }
		    if (5 == spiral[2]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 1);
		    }
		    if (6 == spiral[2]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 1);
		    }
		    if (7 == spiral[2]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 1);
		    }
		}
		if (k3 == Grnumber[2] && (1 == spiral[0] || 4 == spiral[0])) {
		    //considering group 3 when 2nd or 5th spiral is used for group one
		    if (0 == spiral[2]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 3);
		    }
		    if (1 == spiral[2]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 3);
		    }
		    if (2 == spiral[2]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 3);
		    }
		    if (3 == spiral[2]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 3);
		    }
		    if (4 == spiral[2]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 3);
		    }
		    if (5 == spiral[2]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 3);
		    }
		    if (6 == spiral[2]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 3);
		    }
		    if (7 == spiral[2]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 3);
		    }
		}
 
		if (k3 == Grnumber[2] && (2 == spiral[0] || 6 == spiral[0])) {
		    //considering group 3 when 3rd or 7th spiral is used for group one
		    if (0 == spiral[2]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 0);
		    }
		    if (1 == spiral[2]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 0);
		    }
		    if (2 == spiral[2]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 0);
		    }
		    if (3 == spiral[2]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 0);
		    }
		    if (4 == spiral[2]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 0);
		    }
		    if (5 == spiral[2]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 0);
		    }
		    if (6 == spiral[2]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 0);
		    }
		    if (7 == spiral[2]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 0);
		    }
		}
 
		if (k3 == Grnumber[2] && (3 == spiral[0] || 7 == spiral[0])) {
		    //considering group 3 when 4th or 8th spiral is used for group one
		    if (0 == spiral[2]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 2);
		    }
		    if (1 == spiral[2]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 2);
		    }
		    if (2 == spiral[2]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 2);
		    }
		    if (3 == spiral[2]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 2);
		    }
		    if (4 == spiral[2]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 2);
		    }
		    if (5 == spiral[2]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 2);
		    }
		    if (6 == spiral[2]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 2);
		    }
		    if (7 == spiral[2]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 2);
		    }
		}
	    }
            
            //this part obtains the members of group 1 which can be adjacent to members of group 4 and their heights
	    if (k8 == 2) {
		if (k3 == Grnumber[0]) {	//considering group1
		    if (0 == spiral[0]) {	//when 1st spiral is used
			adjacencyHeight(3, 2);
			//gives which member of group1 can be adjacent to members of group4 and their heights
		    }
		    if (1 == spiral[0]) {
			adjacencyHeight(1, 2);
		    }
		    if (2 == spiral[0]) {
			adjacencyHeight(2, 2);
		    }
		    if (3 == spiral[0]) {
			adjacencyHeight(4, 2);
		    }
		    if (4 == spiral[0]) {
			adjacencyHeight(3, 1);
		    }
		    if (5 == spiral[0]) {
			adjacencyHeight(1, 1);
		    }
		    if (6 == spiral[0]) {
			adjacencyHeight(4, 1);
		    }
		    if (7 == spiral[0]) {
			adjacencyHeight(2, 1);
		    }
		}
 
                 //this part obtains the members of group 4 which can be adjacent to members of group 1 
                 //and their heights and then adjacent members of these two groups
		if (k3 == Grnumber[3] && (0 == spiral[0] || 4 == spiral[0])) {
		    //considering group 4 when 1st or 5th spiral is used for group one
		    if (0 == spiral[3]) {	//when spiral 1 is used for group4
			adjacencyHeight(1, 3);
			//gives which members of group4 can be adjacent to members of group1 and their heights
			findingadjacencies(0, 2);	//gives adjacent between members of group1 and group4
		    }
		    if (1 == spiral[3]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 2);
		    }
		    if (2 == spiral[3]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 2);
		    }
		    if (3 == spiral[3]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 2);
		    }
		    if (4 == spiral[3]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 2);
		    }
		    if (5 == spiral[3]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 2);
		    }
		    if (6 == spiral[3]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 2);
		    }
		    if (7 == spiral[3]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 2);
		    }
		}
 
		if (k3 == Grnumber[3] && (1 == spiral[0] || 5 == spiral[0])) {
		    //considering group 4 when 2nd or 6th spiral is used for group one
		    if (0 == spiral[3]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 0);
		    }
		    if (1 == spiral[3]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 0);
		    }
		    if (2 == spiral[3]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 0);
		    }
		    if (3 == spiral[3]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 0);
		    }
		    if (4 == spiral[3]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 0);
		    }
		    if (5 == spiral[3]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 0);
		    }
		    if (6 == spiral[3]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 0);
		    }
		    if (7 == spiral[3]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 0);
		    }
		}
 
		if (k3 == Grnumber[3] && (2 == spiral[0] || 7 == spiral[0])) {
		    //considering group 4 when 3rd or 8th spiral is used for group one
		    if (0 == spiral[3]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 1);
		    }
		    if (1 == spiral[3]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 1);
		    }
		    if (2 == spiral[3]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 1);
		    }
		    if (3 == spiral[3]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 1);
		    }
		    if (4 == spiral[3]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 1);
		    }
		    if (5 == spiral[3]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 1);
		    }
		    if (6 == spiral[3]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 1);
		    }
		    if (7 == spiral[3]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 1);
		    }
		}
 
		if (k3 == Grnumber[3] && (3 == spiral[0] || 6 == spiral[0])) {
		    //considering group 4 when 4th or 7th spiral is used for group one
		    if (0 == spiral[3]) {
			adjacencyHeight(1, 3);
			findingadjacencies(0, 3);
		    }
		    if (1 == spiral[3]) {
			adjacencyHeight(3, 3);
			findingadjacencies(2, 3);
		    }
		    if (2 == spiral[3]) {
			adjacencyHeight(4, 3);
			findingadjacencies(3, 3);
		    }
		    if (3 == spiral[3]) {
			adjacencyHeight(2, 3);
			findingadjacencies(1, 3);
		    }
		    if (4 == spiral[3]) {
			adjacencyHeight(1, 4);
			findingadjacencies(0, 3);
		    }
		    if (5 == spiral[3]) {
			adjacencyHeight(3, 4);
			findingadjacencies(2, 3);
		    }
		    if (6 == spiral[3]) {
			adjacencyHeight(2, 4);
			findingadjacencies(1, 3);
		    }
		    if (7 == spiral[3]) {
			adjacencyHeight(4, 4);
			findingadjacencies(3, 3);
		    }
		}
	    }
 
            //this part obtains the members of group 1 which can be adjacent to members of group 5 and their lengths
	    if (k8 == 3) {
		if (k3 == Grnumber[0]) {	//considering group1
		    if (0 == spiral[0]) {	//when spiral 1 is used for group1
			adjacencyLength(4, 1);
			//gives members of group1 which can be adjacent to members of group5 and their length
		    }
		    if (1 == spiral[0]) {
			adjacencyLength(2, 1);
		    }
		    if (2 == spiral[0]) {
			adjacencyLength(3, 1);
		    }
		    if (3 == spiral[0]) {
			adjacencyLength(1, 1);
		    }
		    if (4 == spiral[0]) {
			adjacencyLength(2, 2);
		    }
		    if (5 == spiral[0]) {
			adjacencyLength(4, 2);
		    }
		    if (6 == spiral[0]) {
			adjacencyLength(3, 2);
		    }
		    if (7 == spiral[0]) {
			adjacencyLength(1, 2);
		    }
		}
 
                //this part obtains the members of group 5 which can be adjacent to members of group 1 
                //and their lengths and then adjacent members of these two groups
		if (k3 == Grnumber[4] && (0 == spiral[0] || 5 == spiral[0])) {
		    //considering group 5 when 1st or 6th spiral is used for group one
		    if (0 == spiral[4]) {	//when spiral 1 is used for group5
			adjacencyLength(2, 4);
			//gives members of group5 which can be adjacent to members of group1 and their length
			findingadjacencies(1, 3);	//gives adjacency between members of group1 and group5
		    }
		    if (1 == spiral[4]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 3);
		    }
		    if (2 == spiral[4]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 3);
		    }
		    if (3 == spiral[4]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 3);
		    }
		    if (4 == spiral[4]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 3);
		    }
		    if (5 == spiral[4]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 3);
		    }
		    if (6 == spiral[4]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 3);
		    }
		    if (7 == spiral[4]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 3);
		    }
		}
 
		if (k3 == Grnumber[4] && (1 == spiral[0] || 4 == spiral[0])) {
		    //considering group 5 when 2nd or 5th spiral is used for group one
		    if (0 == spiral[4]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 1);
		    }
		    if (1 == spiral[4]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 1);
		    }
		    if (2 == spiral[4]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 1);
		    }
		    if (3 == spiral[4]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 1);
		    }
		    if (4 == spiral[4]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 1);
		    }
		    if (5 == spiral[4]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 1);
		    }
		    if (6 == spiral[4]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 1);
		    }
		    if (7 == spiral[4]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 1);
		    }
		}
 
		if (k3 == Grnumber[4] && (2 == spiral[0] || 6 == spiral[0])) {
		    //considering group 5 when 3rd or 7th spiral is used for group one
		    if (0 == spiral[4]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 2);
		    }
		    if (1 == spiral[4]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 2);
		    }
		    if (2 == spiral[4]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 2);
		    }
		    if (3 == spiral[4]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 2);
		    }
		    if (4 == spiral[4]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 2);
		    }
		    if (5 == spiral[4]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 2);
		    }
		    if (6 == spiral[4]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 2);
		    }
		    if (7 == spiral[4]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 2);
		    }
		}
 
		if (k3 == Grnumber[4] && (3 == spiral[0] || 7 == spiral[0])) {
		    //considering group 5 when 4th or 8th spiral is used for group one
		    if (0 == spiral[4]) {
			adjacencyLength(2, 4);
			findingadjacencies(1, 0);
		    }
		    if (1 == spiral[4]) {
			adjacencyLength(4, 4);
			findingadjacencies(3, 0);
		    }
		    if (2 == spiral[4]) {
			adjacencyLength(1, 4);
			findingadjacencies(0, 0);
		    }
		    if (3 == spiral[4]) {
			adjacencyLength(3, 4);
			findingadjacencies(2, 0);
		    }
		    if (4 == spiral[4]) {
			adjacencyLength(4, 3);
			findingadjacencies(3, 0);
		    }
		    if (5 == spiral[4]) {
			adjacencyLength(2, 3);
			findingadjacencies(1, 0);
		    }
		    if (6 == spiral[4]) {
			adjacencyLength(1, 3);
			findingadjacencies(0, 0);
		    }
		    if (7 == spiral[4]) {
			adjacencyLength(3, 3);
			findingadjacencies(2, 0);
		    }
		}
 
	    }
 
	}
 
    }

}
 
//this function calculates length and height of the rectangular frame when spiral 1 or 2 or 5 or 6 is used for any group 
void adjacencycal1()
{
 
    H_frame[t1] = height[members_grp[k3][0]];
    //it saves height of first rectangle as H_frame[0]
    t1++;
 
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	//bigger length among first and second rectangle is saved as L_frame[0]
	L_frame[t5] = length[members_grp[k3][1]];
	t5++;
    } else {
	L_frame[t5] = length[members_grp[k3][0]];
	t5++;
    }
 
    int j = 1;
 
    for (int i = 2; i < no_rects; i = i + 1) {
 
	if (j % 4 == 1) {	//its gives height of rectangular frame when any group has 4*n+3 spaces where n starts from zero
 
	    H_frame[t1] = (height[members_grp[k3][i - 1]] + H_frame[t1 - 1]);
	    //it sum's the height of last two rectangles (or sum's height of last rectangle and sum of heights calculated in case j%4==3)
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		//if height of this rectangle > sum of heights calculated above
		H_frame[t1 - 1] = height[members_grp[k3][i]];
		//it save height of this rectangle as sum of heights calculated above
	    }
	}
 
 
	if (j % 4 == 2) {	//its gives length of rectangular frame when any group has 4*n+4 spaces
 
	    L_frame[t5] = L_frame[t5 - 1] + length[members_grp[k3][i - 1]];
	    //here it sum's the length of last two rectangles 
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		//if length of this rectangle > sum of lengths calculated above       
		L_frame[t5 - 1] = length[members_grp[k3][i]];
		//it save length of this rectangle as sum of lengths calculated above 
	    }
	}
 
	if (j % 4 == 3) {	//its gives height of rectangular frame when any group has 4*n+5 spaces
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    //here it sum's the height of last rectangles and sum of heights calculated in 1st case when j%4==1
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		//if height of this rectangle > sum of heights calculated above 
		H_frame[t1 - 1] = height[members_grp[k3][i]];
		//it save height of this rectangle as sum of heights calculated above
	    }
	}
 
	if (j % 4 == 0) {	//its gives length of rectangular frame when any group has 4*n+6 spaces
 
	    L_frame[t5] = L_frame[t5 - 1] + length[members_grp[k3][i - 1]];
	    //here it sum's length of last rectangle and sum of lengths calculated in case j%4==2
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1])
		//if length of this rectangle > sum of lengths calculated above 
		L_frame[t5 - 1] = length[members_grp[k3][i]];
	    //it save length of this rectangle as sum of lengths calculated above
	}
 
	j = j + 1;
    }
 
}
 
 
//this function calculates length and height of the rectangular frame when spiral 3 or 4 or 7 or 8 is used for any group
void adjacencycal2()
{
 
    L_frame[t5] = length[members_grp[k3][0]];	//it saves height of first rectangle as H_frame[0]
    t5++;
 
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	//bigger length among first and second rectangle is saved as L_frame[0]
	H_frame[t1] = height[members_grp[k3][1]];
	t1++;
    } else {
	H_frame[t1] = height[members_grp[k3][0]];
	t1++;
    }
 
    int j = 1;
 
    //now for spiral 3 or 4 or 7 or 8 there comes four cases
    for (int i = 2; i < no_rects; i = i + 1) {
 
	if (j % 4 == 1) {	//its gives length of rectangular frame when any group has 4*n+3 spaces
 
	    L_frame[t5] = (length[members_grp[k3][i - 1]] + L_frame[t5 - 1]);
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1])
		L_frame[t5 - 1] = length[members_grp[k3][i]];
 
	}
 
	if (j % 4 == 2) {	//its gives height of rectangular frame when any group has 4*n+4 spaces
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1])
		H_frame[t1 - 1] = height[members_grp[k3][i]];
 
	}
 
	if (j % 4 == 3) {	//its gives length of rectangular frame when any group has 4*n+5 spaces
 
	    L_frame[t5] = (length[members_grp[k3][i - 1]] + L_frame[t5 - 1]);
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1])
		L_frame[t5 - 1] = length[members_grp[k3][i]];
 
	}
 
	if (j % 4 == 0) {	//its gives height of rectangular frame when any group has 4*n+6 spaces
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1])
		H_frame[t1 - 1] = height[members_grp[k3][i]];
 
	}
 
	j = j + 1;
    }
 
}
 
 
//this function gives the adjacency among the members of any group independent of the spiral used 
void adjacency1()
{
    if (no_rects == 2) {	//if number of rectangles is two then both are adjacent to each other
 
	adjacentpair1[nbrofpairs] = members_grp1[k3][0];
	adjacentpair2[nbrofpairs] = members_grp1[k3][1];
	nbrofpairs++;
    }
 
 
    if (no_rects == 3) {	//if number of rectangles  is 3 then first one is adjacent to 2nd and 3rd rectangle
 
	adjacentpair1[nbrofpairs] = members_grp1[k3][0];
	adjacentpair2[nbrofpairs] = members_grp1[k3][1];
	nbrofpairs++;
 
	adjacentpair1[nbrofpairs] = members_grp1[k3][0];
	adjacentpair2[nbrofpairs] = members_grp1[k3][2];
	nbrofpairs++;
 
    }
 
 
    if (no_rects > 3) {
	//if number of rectangles is more than 3 then first rectangle is adjacent to 2nd,3rd,4th and 5th rectangle
	for (int i1 = 0; i1 < no_rects - 1; i1 = i1 + 1) {
	    if (i1 < 4) {
		adjacentpair1[nbrofpairs] = members_grp1[k3][0];
		adjacentpair2[nbrofpairs] = members_grp1[k3][i1 + 1];
		nbrofpairs++;
	    }
	}
    }
 
    for (int j5 = 1; j5 < no_rects - 1; j5 = j5 + 1) {
	//it starts from 2nd rectangle and each ith rectangle is adjacent to its next rectangle
	adjacentpair1[nbrofpairs] = members_grp1[k3][j5];
	adjacentpair2[nbrofpairs] = members_grp1[k3][j5 + 1];
	nbrofpairs++;
    }
 
    for (int j5 = 1; j5 < no_rects - 1; j5 = j5 + 1) {
	//it starts from 2nd rectangle and each ith rectangle is adjacent to its i+3th rectangle
	if ((j5 + 3) < no_rects) {
	    adjacentpair1[nbrofpairs] = members_grp1[k3][j5];
	    adjacentpair2[nbrofpairs] = members_grp1[k3][j5 + 3];
	    nbrofpairs++;
	}
    }
 
    for (int j5 = 1; j5 < no_rects; j5 = j5 + 1) {
	//it starts from 2nd rectangle and each ith rectangle is adjacent to i+4th rectangle
	if ((j5 + 4) < no_rects) {
	    adjacentpair1[nbrofpairs] = members_grp1[k3][j5];
	    adjacentpair2[nbrofpairs] = members_grp1[k3][j5 + 4];
	    nbrofpairs++;
	}
    }
 
}
 
//these variables are members of group1 which can be adjacent to members of group2 or group3 or group4 or group5 
int e1 = 0, e2 = 0, e3 = 0;			
int e4 = 0; //gives number of rectangles of group 1
//these variables are members of group2 or group3 or group4 or group5 which can be adjacent to members of group1
int f1 = 0, f2 = 0, f3 = 0;			
int f4 = 0; //gives number of rectangles of group2 or group3 or group4 or group5
//these variables gives length or height of members of group1 which can be adjacent to members of group2 or group3 or group4 or group5
float g1 = 0, g2 = 0, g3 = 0;	
//these variables gives length or height of members of group2 or group3 or group4 or group5 which can be adjacent to members of group1		
float h1 = 0, h2 = 0, h3 = 0;			
 
//In these function given below, instead of height or length of rectangles sometimes we are considering values of k1[] or k6[] calculated above
//which is height or length or that rectangle including inner extra space
 
//this function calculates members of 1st group which can be adjacent to members of 3rd and 5th group and their lengths 
void adjacencyLength(int p3, int p4)
{
    int p1 = p3 - 1;
 
    if (p1 == 1) {
	int r1;
	float s1;
	r1 = members_grp1[k3][no_rects - 1];	//this is rectangle number
	s1 = length[members_grp[k3][no_rects - 1]]; //length of this rectangle
	if (p4 == 1 || p4 == 2) {
	    e1 = r1;
	    g1 = s1;
	}
	if (p4 == 3 || p4 == 4) {
	    f1 = r1;
	    h1 = s1;
	}
    }
 
    if (p1 == 2) {
	if (no_rects == 1) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 1];
	    s1 = length[members_grp[k3][no_rects - 1]];
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects == 2) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 2];
	    r1 = members_grp1[k3][no_rects - 1];
	    s2 = length[members_grp[k3][no_rects - 2]];
	    s1 = length[members_grp[k3][no_rects - 1]];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
    }
 
    if (p1 == 3) {
	if (no_rects == 1) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 1];	//this is space number
	    s1 = length[members_grp[k3][no_rects - 1]];
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects == 2) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 2];	//this is space number
	    s1 = L_frame[0];
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects == 3) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 3];
	    r1 = members_grp1[k3][no_rects - 1];
	    s2 = L_frame[0];
	    s1 = length[members_grp[k3][no_rects - 1]];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
    }
 
    if (no_rects > p1) {
	if (no_rects % 4 == p3 % 4) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 1];	
	    s1 = L_frame[(no_rects-1) / 2];	
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects % 4 == (p3 + 1) % 4) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 1];
	    r1 = members_grp1[k3][no_rects - 2];
	    s2 = length[members_grp[k3][no_rects - 1]];
	    s1 = L_frame[no_rects / 2 - 1];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
 
	if (no_rects % 4 == (p3 + 2) % 4) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 2];
	    r1 = members_grp1[k3][no_rects - 3];
	    s2 = length[members_grp[k3][no_rects - 2]];
	    s1 = L_frame[(no_rects-1) / 2 - 1];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
 
	if (no_rects % 4 == (p3 + 3) % 4) {
	    int r1, r2, r3;
	    float s1, s2, s3;
	    r3 = members_grp1[k3][no_rects - 3];
	    r2 = members_grp1[k3][no_rects - 4];
	    r1 = members_grp1[k3][no_rects - 1];
	    s3 = length[members_grp[k3][no_rects - 3]];
	    s2 = L_frame[no_rects / 2 - 2];
	    s1 = length[members_grp[k3][no_rects - 1]];
 
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		e3 = r3;
		g1 = s1;
		g2 = s2;
		g3 = s3;
	    }
	    if (p4 == 2) {
		e1 = r3;
		e2 = r2;
		e3 = r1;
		g1 = s3;
		g2 = s2;
		g3 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		f3 = r3;
		h1 = s1;
		h2 = s2;
		h3 = s3;
	    }
	    if (p4 == 4) {
		f1 = r3;
		f2 = r2;
		f3 = r1;
		h1 = s3;
		h2 = s2;
		h3 = s1;
	    }
	}
 
    }
    if (p4 == 1 || p4 == 2)
	e4 = no_rects;
    if (p4 == 3 || p4 == 4)
	f4 = no_rects;
 
}

//this function calculates members of 1st group which can be adjacent to members of 2nd and 4th group and their heights  
void adjacencyHeight(int p3, int p4)
{
    int p1 = p3 - 1;
 
    if (p1 == 1) {
	int r1;
	float s1;
	r1 = members_grp1[k3][no_rects - 1];
	s1 = height[members_grp[k3][no_rects - 1]];
	if (p4 == 1 || p4 == 2) {
	    e1 = r1;
	    g1 = s1;
	}
	if (p4 == 3 || p4 == 4) {
	    f1 = r1;
	    h1 = s1;
	}
    }
 
    if (p1 == 2) {
	if (no_rects == 1) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 1];	
	    s1 = height[members_grp[k3][no_rects - 1]];
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects == 2) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 2];
	    r1 = members_grp1[k3][no_rects - 1];
	    s2 = height[members_grp[k3][no_rects - 2]];
	    s1 = height[members_grp[k3][no_rects - 1]];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
    }
 
    if (p1 == 3) {
	if (no_rects == 1) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 1];	
	    s1 = height[members_grp[k3][no_rects - 1]];
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects == 2) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 2];	
	    s1 = H_frame[0];
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects == 3) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 3];
	    r1 = members_grp1[k3][no_rects - 1];
	    s2 = H_frame[0];
	    s1 = height[members_grp[k3][no_rects - 1]];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
    }
 
    if (no_rects > p1) {
	if (no_rects % 4 == p3 % 4) {
	    int r1;
	    float s1;
	    r1 = members_grp1[k3][no_rects - 1];	
	    s1 = H_frame[(no_rects-1) / 2];	
	    if (p4 == 1 || p4 == 2) {
		e1 = r1;
		g1 = s1;
	    }
	    if (p4 == 3 || p4 == 4) {
		f1 = r1;
		h1 = s1;
	    }
	}
 
	if (no_rects % 4 == (p3 + 1) % 4) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 1];
	    r1 = members_grp1[k3][no_rects - 2];
	    s2 = height[members_grp[k3][no_rects - 1]];
	    s1 = H_frame[no_rects / 2 - 1];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
 
	if (no_rects % 4 == (p3 + 2) % 4) {
	    int r1, r2;
	    float s1, s2;
	    r2 = members_grp1[k3][no_rects - 2];
	    r1 = members_grp1[k3][no_rects - 3];
	    s2 = height[members_grp[k3][no_rects - 2]];
	    s1 = H_frame[(no_rects-1) / 2 - 1];
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		g1 = s1;
		g2 = s2;
	    }
	    if (p4 == 2) {
		e1 = r2;
		e2 = r1;
		g1 = s2;
		g2 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		h1 = s1;
		h2 = s2;
	    }
	    if (p4 == 4) {
		f1 = r2;
		f2 = r1;
		h1 = s2;
		h2 = s1;
	    }
	}
 
	if (no_rects % 4 == (p3 + 3) % 4) {
	    int r1, r2, r3;
	    float s1, s2, s3;
	    r3 = members_grp1[k3][no_rects - 3];
	    r2 = members_grp1[k3][no_rects - 4];
	    r1 = members_grp1[k3][no_rects - 1];
	    s3 = height[members_grp[k3][no_rects - 3]];
	    s2 = H_frame[no_rects / 2 - 2];
	    s1 = height[members_grp[k3][no_rects - 1]];
 
	    if (p4 == 1) {
		e1 = r1;
		e2 = r2;
		e3 = r3;
		g1 = s1;
		g2 = s2;
		g3 = s3;
	    }
	    if (p4 == 2) {
		e1 = r3;
		e2 = r2;
		e3 = r1;
		g1 = s3;
		g2 = s2;
		g3 = s1;
	    }
	    if (p4 == 3) {
		f1 = r1;
		f2 = r2;
		f3 = r3;
		h1 = s1;
		h2 = s2;
		h3 = s3;
	    }
	    if (p4 == 4) {
		f1 = r3;
		f2 = r2;
		f3 = r1;
		h1 = s3;
		h2 = s2;
		h3 = s1;
	    }
	}
 
    }
    if (p4 == 1 || p4 == 2)
	e4 = no_rects;
    if (p4 == 3 || p4 == 4)
	f4 = no_rects;
 
}

//Atmost 3 members of 1st group can be adjacent to atmost 3 members of any other groups. Therefore,
//there are nine possibilities to calculate how many members of 1st group can be adjacent to how
//many members of other groups. These nine possibilities in function adjacentrects(p1, p2).
void adjacenctrects(int p1, int p2)
{
    
    if (p1 == 1 && p2 == 1)
	adjacenctrects11();
 
    if (p1 == 1 && p2 == 2)
	adjacenctrects12();
 
    if (p1 == 1 && p2 == 3)
	adjacenctrects13();
 
    if (p1 == 2 && p2 == 1)
	adjacenctrects21();
 
    if (p1 == 2 && p2 == 2)
	adjacenctrects22();
 
    if (p1 == 2 && p2 == 3)
	adjacenctrects23();
 
    if (p1 == 3 && p2 == 1)
	adjacenctrects31();
 
    if (p1 == 3 && p2 == 2)
	adjacenctrects32();
 
    if (p1 == 3 && p2 == 3)
	adjacenctrects33();
 
}
 
// this function provides nine possibilities for adjacency of e1, e2 and e3
//with f1, f2, f3. This function will be used in other coming functions 
void adjacency(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8, int p9)
{
 
    if (p1 == 1) {
	adjacentpair1[nbrofpairs] = e1;
	adjacentpair2[nbrofpairs] = f1;
	nbrofpairs++;
    }
 
    if (p2 == 1) {
	adjacentpair1[nbrofpairs] = e1;
	adjacentpair2[nbrofpairs] = f2;
	nbrofpairs++;
    }
 
    if (p3 == 1) {
	adjacentpair1[nbrofpairs] = e1;
	adjacentpair2[nbrofpairs] = f3;
	nbrofpairs++;
    }
 
    if (p4 == 1) {
	adjacentpair1[nbrofpairs] = e2;
	adjacentpair2[nbrofpairs] = f1;
	nbrofpairs++;
    }
 
    if (p5 == 1) {
	adjacentpair1[nbrofpairs] = e2;
	adjacentpair2[nbrofpairs] = f2;
	nbrofpairs++;
    }
 
    if (p6 == 1) {
	adjacentpair1[nbrofpairs] = e2;
	adjacentpair2[nbrofpairs] = f3;
	nbrofpairs++;
    }
 
    if (p7 == 1) {
	adjacentpair1[nbrofpairs] = e3;
	adjacentpair2[nbrofpairs] = f1;
	nbrofpairs++;
    }
 
    if (p8 == 1) {
	adjacentpair1[nbrofpairs] = e3;
	adjacentpair2[nbrofpairs] = f2;
	nbrofpairs++;
    }
 
    if (p9 == 1) {
	adjacentpair1[nbrofpairs] = e3;
	adjacentpair2[nbrofpairs] = f3;
	nbrofpairs++;
    }
 
}

//There are nine possibilities to calculate adjacency among members of different groups.
//These nine possibilities and then their adjacency are discussed in coming nine functions.

//this function finds the adjacency pairs between group1(when it has only one member) and any other group(when it has only one member) 
void adjacenctrects11()
{
    adjacency(1, 0, 0, 0, 0, 0, 0, 0, 0);
}
 
 
//this function finds the adjacency pairs between group1(when it has two members) and any other group(when it has only one member) 
void adjacenctrects12()
{
 
    if (g2 >= h1) {
	//if height of 2nd space of group 1 > height of 1st space of group 2 
        //then 2nd space of group 1 is adjacent to first space of group1 
	adjacency(0, 0, 0, 1, 0, 0, 0, 0, 0);
    }
 
    if (g2 < h1) {
 
	adjacency(1, 0, 0, 1, 0, 0, 0, 0, 0);
    }
}
 
 //this function finds the adjacency pairs between group1(when it has 3 members) and any other group(when it has only one member)
void adjacenctrects13()
{
 
    if (h1 > g2 + g3) {
 
	adjacency(1, 0, 0, 1, 0, 0, 1, 0, 0);
    }
 
    if (g3 < h1 && h1 <= g2 + g3) {
 
	adjacency(0, 0, 0, 1, 0, 0, 1, 0, 0);
    }
 
    if (h1 <= g3) {
 
	adjacency(0, 0, 0, 0, 0, 0, 1, 0, 0);
    }
}
 
 //this function finds the adjacency pairs between group1(when it has only one member) and any other group(when it has 2 members)
void adjacenctrects21()
{
    if (h2 >= g1) {
	adjacency(0, 1, 0, 0, 0, 0, 0, 0, 0);
    }
 
    if (h2 < g1) {
 
	adjacency(1, 1, 0, 0, 0, 0, 0, 0, 0);
    }
}
 
 
//this function finds the adjacency pairs between group1(when it has 2 members) and any other group(when it has 2 members) 
void adjacenctrects22()
{
 
    if (h2 + h1 <= g2) {
 
	adjacency(0, 0, 0, 1, 1, 0, 0, 0, 0);
    }
 
    if (h2 < g2 && h1 > (g2 - h2)) {
 
	adjacency(1, 0, 0, 1, 1, 0, 0, 0, 0);
    }
 
    if (h2 > g2 && h2 < (g2 + g1)) {
 
	adjacency(1, 1, 0, 0, 1, 0, 0, 0, 0);
    }
 
    if (h2 >= (g2 + g1)) {
 
	adjacency(0, 1, 0, 0, 1, 0, 0, 0, 0);
 
    }
 
    if (h2 == g2) {
 
	adjacency(1, 0, 0, 0, 1, 0, 0, 0, 0);
    }
}
 
//this function finds the adjacency pairs between group1(when it has 3 members) and any other group(when it has 2 members) 
void adjacenctrects23()
{
 
    if (h2 + h1 <= g3) {
 
	adjacency(0, 0, 0, 0, 0, 0, 1, 1, 0);
    }
 
    if (h2 < g3 && h1 > (g3 - h2) && h1 <= (g3 - h2 + g2)) {
 
	adjacency(0, 0, 0, 1, 0, 0, 1, 1, 0);
    }
 
    if (h2 < g3 && h1 > (g2 + g3 - h2)) {
 
	adjacency(1, 0, 0, 1, 0, 0, 1, 1, 0);
    }
 
    if (h2 > g3 && h2 < (g2 + g3) && h1 <= (g2 + g3 - h2)) {
 
	adjacency(0, 0, 0, 1, 1, 0, 0, 1, 0);
    }
 
    if (h2 > g3 && h2 < (g2 + g3) && h1 > (g2 + g3 - h2)) {
 
	adjacency(1, 0, 0, 1, 1, 0, 0, 1, 0);
    }
 
    if (h2 > g2 + g3 && h2 < (g1 + g2 + g3)) {
 
	adjacency(1, 1, 0, 0, 1, 0, 0, 1, 0);
    }
 
    if (h2 >= (g1 + g2 + g3)) {
 
	adjacency(0, 1, 0, 0, 1, 0, 0, 1, 0);
    }
 
    if (h2 == g3 && h1 <= (g2)) {
 
	adjacency(0, 0, 0, 1, 0, 0, 0, 1, 0);
    }
 
    if (h2 == g3 && h1 > (g2)) {
 
	adjacency(1, 0, 0, 1, 0, 0, 0, 1, 0);
    }
 
    if (h2 == g3 + g2) {
 
	adjacency(1, 0, 0, 0, 1, 0, 0, 1, 0);
    }
}
 
//this function finds the adjacency pairs between group1(when it has 1 member) and any other group(when it has 3 members) 
void adjacenctrects31()
{
 
    if ((h2 + h3) < g1) {
 
	adjacency(1, 1, 1, 0, 0, 0, 0, 0, 0);
    }
 
    if (h2 + h3 >= g1 && g1 > h3) {
 
	adjacency(0, 1, 1, 0, 0, 0, 0, 0, 0);
    }
 
    if (h3 >= g1) {
 
	adjacency(0, 0, 1, 0, 0, 0, 0, 0, 0);
    }
 
}
 
//this function finds the adjacency pairs between group1(when it has 2 members) and any other group(when it has 3 members) 
void adjacenctrects32()
{
    if (g1 + g2 <= h3) {
 
	adjacency(0, 0, 1, 0, 0, 1, 0, 0, 0);
    }
 
    if (g2 < h3 && g1 > (h3 - g2) && g1 <= (h3 - g2 + h2)) {
 
	adjacency(0, 1, 1, 0, 0, 1, 0, 0, 0);
    }
 
    if (g2 < h3 && g1 > (h3 - g2 + h2)) {
 
	adjacency(1, 1, 1, 0, 0, 1, 0, 0, 0);
    }
 
    if (g2 > h3 && g2 < (h3 + h2) && g1 <= (h3 - g2 + h2)) {
 
	adjacency(0, 1, 0, 0, 1, 1, 0, 0, 0);
    }
 
    if (g2 > h3 && g2 < (h3 + h2) && g1 > (h3 - g2 + h2)) {
 
	adjacency(1, 1, 0, 0, 1, 1, 0, 0, 0);
    }
 
    if (g2 > (h3 + h2) && g2 < (h3 + h2 + h1)) {
 
	adjacency(1, 0, 0, 1, 1, 1, 0, 0, 0);
    }
 
    if (g2 >= (h3 + h2 + h1)) {
 
	adjacency(0, 0, 0, 1, 1, 1, 0, 0, 0);
    }
 
    if (g2 == (h3) && g1 <= (h2)) {
 
	adjacency(0, 1, 0, 0, 0, 1, 0, 0, 0);
    }
 
    if (g2 == (h3) && g1 > (h2)) {
 
	adjacency(1, 1, 0, 0, 0, 1, 0, 0, 0);
    }
 
    if (g2 == (h3 + h2)) {
 
	adjacency(1, 0, 0, 0, 1, 1, 0, 0, 0);
    }
}
 
//this function finds the adjacency pairs between group1(when it has 3 members) and any other group(when it has 3 members) 
void adjacenctrects33()
{
 
    if (g1 <= (h3 - g3 - g2)) {
 
	adjacency(0, 0, 1, 0, 0, 1, 0, 0, 1);
    }
 
    if (g2 < (h3 - g3) && g1 <= (h3 - g2 - g3 + h2)) {
 
	adjacency(0, 1, 1, 0, 0, 1, 0, 0, 1);
    }
 
    if (g2 < (h3 - g3) && g1 > (h3 - g2 - g3 + h2)) {
 
	adjacency(1, 1, 1, 0, 0, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 > (h3 - g3) && g1 <= (h3 - g2 - g3 + h2)) {
 
	adjacency(0, 1, 0, 0, 1, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 > (h3 - g3) && g1 > (h3 - g2 - g3 + h2) && g2 < (h3 + h2 - g3)) {
 
	adjacency(1, 1, 0, 0, 1, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 > (h3 + h2 - g3) && g2 < (h1 + h3 + h2 - g3)) {
 
	adjacency(1, 0, 0, 1, 1, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 >= (h3 + h2 + h1 - g3)) {
 
	adjacency(0, 0, 0, 1, 1, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 == (h3 - g3) && g1 <= (h2)) {
 
	adjacency(0, 1, 0, 0, 0, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 == (h3 - g3) && g1 > (h2)) {
 
	adjacency(1, 1, 0, 0, 0, 1, 0, 0, 1);
    }
 
    if (g3 < h3 && g2 == (h3 + h2 - g3)) {
 
	adjacency(1, 0, 0, 0, 1, 1, 0, 0, 1);
    }
 
    if (g3 == h3 && g1 + g2 <= (h2)) {
 
	adjacency(0, 1, 0, 0, 1, 0, 0, 0, 1);
    }
 
    if (g3 == h3 && g2 < h2 && g1 + g2 > (h2)) {
 
	adjacency(1, 1, 0, 0, 1, 0, 0, 0, 1);
    }
 
    if (g3 == h3 && g2 == h2) {
 
	adjacency(0, 1, 0, 0, 1, 0, 0, 0, 1);
    }
 
    if (g3 == h3 && g2 > h2 && g2 < (h1 + h2)) {
 
	adjacency(1, 0, 0, 1, 1, 0, 0, 0, 1);
    }
 
    if (g3 == h3 && g2 >= (h1 + h2)) {
 
	adjacency(0, 0, 0, 1, 1, 0, 0, 0, 1);
    }
 
    if (h1 <= (g3 - h3 - h2)) {
 
	adjacency(0, 0, 0, 0, 0, 0, 1, 1, 1);
    }
 
    if (h2 < (g3 - h3) && h1 <= (g3 - h2 - h3 + g2) && h1 > (g3 - h2 - h3)) {
 
	adjacency(0, 0, 0, 1, 0, 0, 1, 1, 1);
    }
 
    if (h2 < (g3 - h3) && h1 > (g3 - h2 - h3 + g2)) {
 
	adjacency(1, 0, 0, 1, 0, 0, 1, 1, 1);
    }
 
    if (h3 < g3 && h2 > (g3 - h3) && h1 <= (g3 - h2 - h3 + g2) && h2 < (g3 + g2 - h3)) {
 
	adjacency(0, 0, 0, 1, 1, 0, 0, 1, 1);
    }
 
    if (h3 < g3 && h2 > (g3 - h3) && h1 > (g3 - h2 - h3 + g2) && h2 < (g3 + g2 - h3)) {
 
	adjacency(1, 0, 0, 1, 1, 0, 0, 1, 1);
    }
 
    if (h3 < g3 && h2 > (g3 + g2 - h3) && h2 < (g1 + g3 + g2 - h3)) {
 
	adjacency(1, 1, 0, 0, 1, 0, 0, 1, 1);
    }
 
    if (h3 < g3 && h2 >= (g1 + g3 + g2 - h3)) {
 
	adjacency(0, 1, 0, 0, 1, 0, 0, 1, 1);
    }
 
    if (h3 < g3 && h2 == (g3 - h3) && h1 <= (g2)) {
 
	adjacency(0, 0, 0, 1, 0, 1, 0, 0, 1);
 
    }
 
    if (h3 < g3 && h2 == (g3 - h3) && h1 > (g2)) {
 
	adjacency(1, 0, 0, 1, 0, 1, 0, 0, 1);
    }
 
    if (h3 < g3 && h2 == (g3 + g2 - h3)) {
 
	adjacency(1, 0, 0, 0, 1, 1, 0, 0, 1);
    }
}


// From function adjacencyLength or adjacencyHeight, f4 or e4 can be >0, >1, >2 or >3.
//Implies in total 16 cases. These cases are discussed in d function findingadjacency(p1, p2).
void findingadjacencies(int p1, int p2)
{
 
    if (p1 == 0 && p2 == 1) {
	adjacenctrects1(1, 0);
    }
 
    if (p1 == 0 && p2 == 2) {
	adjacenctrects1(2, 0);
    }
 
    if (p1 == 0 && p2 == 3) {
	adjacenctrects1(3, 0);
    }
 
    if (p1 == 1 && p2 == 0) {
	adjacenctrects2(1, 0);
    }
 
    if (p1 == 1 && p2 == 1) {
 
	if (e4 == 1 && f4 == 1)
	    adjacenctrects(1, 1);
 
	if (f4 > 1)
	    adjacenctrects1(1, 1);
 
	if (e4 > 1)
	    adjacenctrects2(1, 1);
 
    }
 
    if (p1 == 1 && p2 == 2) {
	if (e4 == 1 && f4 == 1)
	    adjacenctrects(1, 1);
 
	if (e4 == 2 && f4 == 1)
	    adjacenctrects(1, 2);
 
	if (f4 > 1)
	    adjacenctrects1(2, 1);
 
	if (e4 > 2)
	    adjacenctrects2(1, 2);
    }
 
    if (p1 == 1 && p2 == 3) {
 
	if ((e4 == 1 || e4 == 2) && f4 == 1)
	    adjacenctrects(1, 1);
 
	if (e4 == 3 && f4 == 1)
	    adjacenctrects(1, 2);
 
	if (f4 > 1)
	    adjacenctrects1(3, 1);
 
	if (e4 > 3)
	    adjacenctrects2(1, 3);
    }
 
    if (p1 == 2 && p2 == 0) {
	adjacenctrects2(2, 0);
 
    }
 
    if (p1 == 2 && p2 == 1) {
 
	if (e4 == 1 && f4 == 1)
	    adjacenctrects(1, 1);
 
	if (e4 == 1 && f4 == 2)
	    adjacenctrects(2, 1);
 
	if (e4 > 1)
	    adjacenctrects2(2, 1);
 
	if (f4 > 2)
	    adjacenctrects1(1, 2);
    }
 
    if (p1 == 2 && p2 == 2) {
	if (e4 == 1 && f4 == 1)
	    adjacenctrects11();
 
	if (e4 == 1 && f4 == 2)
	    adjacenctrects21();
 
	if (f4 == 1 && e4 == 2)
	    adjacenctrects12();
 
	if (f4 == 2 && e4 == 2)
	    adjacenctrects22();
 
	if (e4 > p2)
	    adjacenctrects2(2, 2);
 
	if (f4 > p1)
	    adjacenctrects1(2, 2);
    }
 
    if (p1 == 2 && p2 == 3) {
	if (f4 == 1 && (e4 == 1 || e4 == 2))
	    adjacenctrects11();
 
	if (f4 == 1 && e4 == 3)
	    adjacenctrects12();
 
	if (f4 == 2 && (e4 == 1 || e4 == 2))
	    adjacenctrects21();
 
	if (f4 == 2 && e4 == 3)
	    adjacenctrects22();
 
	if (e4 > p2)
	    adjacenctrects2(2, 3);
 
	if (f4 > p1)
	    adjacenctrects1(3, 2);
    }
 
    if (p1 == 3 && p2 == 0) {
	adjacenctrects2(3, 0);
    }
 
    if (p1 == 3 && p2 == 1) {
 
	if ((f4 == 1 || f4 == 2) && e4 == 1)
	    adjacenctrects11();
 
	if (f4 == 3 && e4 == 1)
	    adjacenctrects21();
 
	if (e4 > 1)
	    adjacenctrects2(3, 1);
 
	if (f4 > 3)
	    adjacenctrects1(1, 3);
 
    }
 
    if (p1 == 3 && p2 == 2) {
	if ((f4 == 1 || f4 == 2) && e4 == 1)
	    adjacenctrects11();
 
	if (f4 == 3 && e4 == 1)
	    adjacenctrects21();
 
	if ((f4 == 1 || f4 == 2) && e4 == 2)
	    adjacenctrects12();
 
	if (f4 == 3 && e4 == 2)
	    adjacenctrects22();
 
	if (e4 > p2)
	    adjacenctrects2(3, 2);
 
	if (f4 > p1)
	    adjacenctrects1(2, 3);
 
    }
 
    if (p1 == 3 && p2 == 3) {
 
	if ((f4 == 1 || f4 == 2) && (e4 == 1 || e4 == 2))
	    adjacenctrects(1, 1);
 
	if (f4 == 3 && (e4 == 1 || e4 == 2))
	    adjacenctrects(2, 1);
 
	if ((f4 == 1 || f4 == 2) && e4 == 3)
	    adjacenctrects(1, 2);
 
	if (f4 == 3 && e4 == 3)
	    adjacenctrects(2, 2);
 
	if (e4 > p2)
	    adjacenctrects2(3, 3);
 
	if (f4 > p1)
	    adjacenctrects1(3, 3);
 
    }

//this calculates case when f4 > p1 and e4 > p2, also when f4 > 0 and e4 > 0  
    if (f4 > p1 && e4 > p2) {
	int variable1 = 0, variable2 = 0;
	for (int i = 0; i < 4; i = i + 1) {
	    variable1++;
	    if (i == 2)
		variable1--;
	    variable2 = 0;
	    for (int j = 0; j < 4; j = j + 1) {
		variable2++;
		if (j == 2)
		    variable2--;
 
		if ((f4 % 4 == (p1 + i + 1) % 4) && (e4 % 4 == (p2 + j + 1) % 4)) {
		    adjacenctrects(variable1, variable2);
		}
 
	    }
	}
    }
 
}

//this function calculates the case when f4 > p1 && e4 <= p2
void adjacenctrects1(int p3, int p1)
{
    int variable = 0;
    for (int i = 0; i < 4; i = i + 1) {
	variable++;
	if (i == 2)
	    variable--;
	if (f4 % 4 == (p1 + i + 1) % 4) {
	    if (p3 == 1) {
		if (e4 == 1)
		    adjacenctrects(variable, 1);
	    }
	    if (p3 == 2) {
		if (e4 == 1)
		    adjacenctrects(variable, 1);
		if (e4 == 2)
		    adjacenctrects(variable, 2);
	    }
	    if (p3 == 3) {
		if ((e4 == 1) || (e4 == 2))
		    adjacenctrects(variable, 1);
		if ((e4 == 3))
		    adjacenctrects(variable, 2);
	    }
	}
    }
}
 
//this function calculates the case when f4 <= p1 && e4 > p2 
void adjacenctrects2(int p4, int p2)
{
    int variable = 0;
    for (int i = 0; i < 4; i = i + 1) {
	variable++;
	if (i == 2)
	    variable--;
	if (e4 % 4 == (p2 + i + 1) % 4) {
	    if (p4 == 1) {
		if ((f4 == 1))
		    adjacenctrects(1, variable);
	    }
 
	    if (p4 == 2) {
		if ((f4 == 1))
		    adjacenctrects(1, variable);
		if ((f4 == 2))
		    adjacenctrects(2, variable);
	    }
	
 
	if (p4 == 3) {
	    if ((f4 == 1 || f4 == 2))
		adjacenctrects(1, variable);
	    if ((f4 == 3))
		adjacenctrects(2, variable);
	}
      }
 
    }
}
 

