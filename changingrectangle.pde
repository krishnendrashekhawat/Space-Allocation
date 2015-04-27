int[] n_grp = new int[5];	//gives number of rectangles in each group
int change1[] = new int[3];	//first rectangle to be changed
int change2[] = new int[3];	//second rectangle to be changed
 
void changingrectangle()
{
 
  //calculating number of rectangles in each group
    for (int j = 0; j < no_Groups; j = j + 1) {
	n_grp[j] = v[j + 1] - v[j];
    }
 
    //transfering 1st rectangle i.e. change1[2] from group change1[0] to group change1[1]
    if (change1[2] > -1 && change1[2] < n) {
	members_grp[change1[1]][n_grp[change1[1]]] = change1[2];
        //increasing number of rectangles by one
	n_grp[change1[1]] = n_grp[change1[1]] + 1;
	
 
	//reducing number of rectangles of the group from which rectangle is transfered
	for (int j = 0; j < n_grp[change1[0]] - 1; j = j + 1) {
	    if (members_grp[change1[0]][j] == change1[2]) {
		//shifting position of members by one (which comes after rectangle change1[2]) to left in array
		for (int j1 = j; j1 < n_grp[change1[0]] - 1; j1 = j1 + 1) {
		    members_grp[change1[0]][j1] = members_grp[change1[0]][j1 + 1];
		}
	    }
	}
        //decreasing number of rectangles by one
	n_grp[change1[0]] = n_grp[change1[0]] - 1;
	
    }
    
    //transfering 2nd rectangle i.e. change2[2] from group change2[0] to group change2[1]
    if (change2[2] > -1 && change2[2] < n) {
 
	members_grp[change2[1]][n_grp[change2[1]]] = change2[2];
	n_grp[change2[1]] = n_grp[change2[1]] + 1;
 
	for (int j = 0; j < n_grp[change2[0]] - 1; j = j + 1) {
	    if (members_grp[change2[0]][j] == change2[2]) {
 
		for (int j1 = j; j1 < n_grp[change2[0]] - 1; j1 = j1 + 1) {
		    members_grp[change2[0]][j1] = members_grp[change2[0]][j1 + 1];
		}
	    }
	}
 
	n_grp[change2[0]] = n_grp[change2[0]] - 1;
    }
    
    //updating number of rectangles in each group
    for (int j = 0; j < no_Groups; j = j + 1) {
	v[j + 1] = n_grp[j] + v[j];
    }
 
}
