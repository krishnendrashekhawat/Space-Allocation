// gives members of each group
int members_grp[][] = new int[400][2000];
// gives obtained number of groups
int no_Groups = 0;
// v[i+1]-v[i] counts the number of rectangles in jth group
int[] v = new int[5000];
int k3 = 0;
// gives required number of groups
int number_of_groups = 5;
 
// Particularly for plus shaped frame, we need five group, therefore,
// this function obtains five groups
void groups()
{
    int membrs_grp0[][] = new int[5000][5000];
    int[] no_rec_grp = new int[5000];
    int[] max_rec = new int[5000];
    int[] v4 = new int[5000];
    int[] v5 = new int[5000];
    int[] v6 = new int[5000];
    //We have given size of array quite large, even if some error comes related to array,
    // we need to increase the size of array
 
    int k2 = 0, z = 0, j1 = 0, k4 = 0, u1 = 0, i2 = 0, p3 = p, v1 = 0, z1 = 0, n1 = n;
 
    membrs_grp0[0][0] = 0;	// making first rectangle as first member of first group
    v[0] = 0;
 
    // obtaining all groups
    for (int i4 = 0; i4 < n; i4 = i4 + 1) {
 
	z = 0;
	k2 = 0;
	v[0] = 0;
	j1 = 0;
	v1 = 0;
	k4 = 0;
	n1 = n;
	membrs_grp0[0][0] = 0;
	i2 = 0;
	no_Groups = 0;
	u1 = 0;
	//u1 counts total no. of rectangles in all groups       
	int k7 = 0;
 
	for (int k3 = 0; k3 < n; k3 = k3 + 1) {
	    // We start by finding first member of each group 
	    for (int i = 0; i < u1; i = i + 1) {
		for (int k1 = 0; k1 < k3; k1 = k1 + 1) {
		    for (int w = 0; w < v[k4 + 1] - v[k4]; w = w + 1) {
			if (members_grp[k1][w] == j1) {
			    //checking given rectangles is covered in existing group or not
			    j1++;
			    if (j1 == n) {
				//if all rectangles are covered then exit this part
				k1 = k3;
				u1 = 0;
				no_Groups = k3;
				// no_Groups gives obtained number of groups
				z1 = k3;
				v1 = -1;
				k3 = n;
				n1 = 0;
				if (no_Groups == number_of_groups) {
				    // stoping process of finding groups
				    i4 = n;
				}
			    }
			} else {
			    membrs_grp0[k3][0] = j1;
			    // this gives first member of group k3
			}
		    }
		    k4++;
		}
		k4 = 0;
	    }
	    k4 = 0;
	    j1 = 0;
 
	    //obtaining group members
	    for (int h = 0; h < n1; h = h + 1) {
		for (int h1 = 0; h1 < p3; h1 = h1 + 1) {
		    int h2 = 0;
		    if ((membrs_grp0[k3][z] == a[h1]) && (a[h1] != b[h1])) {
			for (int i = 0; i < v1 + 1; i = i + 1) {
			    if (b[h1] == membrs_grp0[k3][v1 - i]) {
				h2++;
			    }
			}
 
 
			if (h2 == 0) {
			    v1++;
			    membrs_grp0[k3][v1] = b[h1];
			}
		    }
 
		    if ((membrs_grp0[k3][z] == b[h1]) && (a[h1] != b[h1])) {
			for (int i = 0; i < v1 + 1; i = i + 1) {
			    if (a[h1] == membrs_grp0[k3][v1 - i])
				h2++;
			}
 
 
			if (h2 == 0) {
			    v1++;
			    membrs_grp0[k3][v1] = a[h1];
			}
		    }
 
		    if ((membrs_grp0[k3][0] == a[h1]) && (a[h1] == b[h1])) {
			membrs_grp0[k3][v1] = a[h1];
 
			h1 = p3;
		    }
		}
 
		if (z == v1)
		    h = n1 + 1;
		if (z != v1)
		    z++;
	    }
 
	    if (k3 < n) {
		v1 = v1;
	    } else {
		v1 = -1;
	    }
 
	    for (int i = 0; i < v1 + 1; i = i + 1) {
 
		members_grp[k3][i] = membrs_grp0[k3][i];
	    }
 
	    u1 = u1 + v1 + 1;
	    k2++;
	    v[k2] = u1;
	    v1 = 0;
	    z = 0;
	}
 
 
	// If number of obtained groups is less than number of required groups then 
	// finding the group having maximum numbers of members and then spliting it in two
	if (no_Groups < number_of_groups) {
	    //calculating number of rectangles in each group and put it in v2[j]
	    for (int j = 0; j < no_Groups; j = j + 1) {
		no_rec_grp[j] = v[j + 1] - v[j];
	    }
 
	    // finding the group having maximum number of rectangles
	    for (int i = 0; i < no_Groups; i = i + 1) {
		for (int j = i + 1; j < no_Groups; j = j + 1) {
		    if (no_rec_grp[i] < no_rec_grp[j]) {
			int temp = no_rec_grp[i];
			no_rec_grp[i] = no_rec_grp[j];
			no_rec_grp[j] = temp;
		    }
		}
	    }
 
	    // finding group_number having maximum number of rectangles
	    for (int j = 0; j < no_Groups; j = j + 1) {
		if ((v[j + 1] - v[j]) == no_rec_grp[0]) {
		    max_rec[0] = j;
		    break;
		}
	    }
 
	    //calculate weights among different members of group having max rectangles
	    for (int i = 0; i < no_rec_grp[0]; i = i + 1) {
		for (int j = i + 1; j < no_rec_grp[0]; j = j + 1) {
		    v4[i2] = adjmat[members_grp[max_rec[0]][i]][members_grp[max_rec[0]][j]];
		    i2++;
		}
	    }
 
	    //finding those two members having minimum weight between them 
	    for (int i = 0; i < i2; i = i + 1) {
		for (int j = i + 1; j < i2; j = j + 1) {
		    if (v4[i] > v4[j]) {
			int temp = v4[i];
			v4[i] = v4[j];
			v4[j] = temp;
		    }
		}
	    }
 
	    //obtaining member's number having minimum weight
	    for (int i = 0; i < no_rec_grp[0]; i = i + 1) {
		for (int j = i + 1; j < no_rec_grp[0]; j = j + 1) {
		    if (v4[0] == adjmat[members_grp[max_rec[0]][i]][members_grp[max_rec[0]][j]]) {
			v5[0] = members_grp[max_rec[0]][i];
			v5[1] = members_grp[max_rec[0]][j];
		    }
		}
	    }
 
	    // finding all those members which are adjacent to above 2 members and put them -1 so that they won't be adjacent 
	    for (int j = 0; j < no_rec_grp[0]; j = j + 1) {
		p = p3;
		for (int i = 0; i < p; i = i + 1) {
 
		    if (i >= p3)
			break;
		    if (a[i] == members_grp[max_rec[0]][j] || b[i] == members_grp[max_rec[0]][j]) {
			for (int k = i; k < p3; k = k + 1) {
			    a[k] = a[k + 1];
			    b[k] = b[k + 1];
			}
			p3--;
			i--;
		    }
		}
	    }
 
	    //spliting above group in two, one with v5[0] and other with v5[1] by comparing weights of each member with v5[0] and v5[1]
	    for (int i = 0; i < no_rec_grp[0]; i = i + 1) {
		if (members_grp[max_rec[0]][i] == v5[0] || members_grp[max_rec[0]][i] == v5[1])
		    continue;
		if (adjmat[v5[0]][members_grp[max_rec[0]][i]] > adjmat[v5[1]][members_grp[max_rec[0]][i]]) {
		    v6[k7] = v5[0];
		    k7++;
		    v6[k7] = members_grp[max_rec[0]][i];
		    k7++;
		} else {
		    v6[k7] = v5[1];
		    k7++;
		    v6[k7] = members_grp[max_rec[0]][i];
		    k7++;
		}
	    }
	    //finding members which are adjacent to v5[0] and v5[1]
	    for (int k8 = 0; k8 < k7; k8 = k8 + 2) {
		a[p3] = v6[k8];
		b[p3] = v6[k8 + 1];
 
		p3++;
	    }
 
 
	    //if bychance none of member is adjacent to v5[0], then v5[0] itself forms a group
	    int k5 = 0;
	    for (int i = 0; i < p3; i = i + 1) {
		if ((a[i] != v5[0]) && (b[i] != v5[0])) {
		    k5++;
		}
	    }
 
	    if (k5 == p3) {
		a[p3] = v5[0];
		b[p3] = v5[0];
		p3++;
	    }
//if bychance none of member is adjacent to v5[1], then v5[1] itself forms a group
	    int k9 = 0;
	    for (int i = 0; i < p3; i = i + 1) {
		if ((a[i] != v5[1]) && (b[i] != v5[1])) {
		    k9++;
		}
	    }
 
	    if (k9 == p3) {
		a[p3] = v5[1];
		b[p3] = v5[1];
		p3++;
	    }
 
	}
	// If number of obtained groups is greater than number of required groups then 
	// finding two groups having minimum number of members and then add them
	if (no_Groups > number_of_groups) {
 
	    //calculating number of rectangles in each group
	    for (int j = 0; j < no_Groups; j = j + 1) {
		no_rec_grp[j] = v[j + 1] - v[j];
	    }
 
//arranging groups in ascending order acoording to number of members            
	    for (int i = 0; i < no_Groups; i = i + 1) {
		for (int j = i + 1; j < no_Groups; j = j + 1) {
		    if (no_rec_grp[i] > no_rec_grp[j]) {
			int temp = no_rec_grp[i];
			no_rec_grp[i] = no_rec_grp[j];
			no_rec_grp[j] = temp;
		    }
		}
	    }
 
	    //finding first group_number having minimum number of rectangles 
	    for (int j = 0; j < no_Groups; j = j + 1) {
		if ((v[j + 1] - v[j]) == no_rec_grp[0]) {
		    max_rec[0] = j;
		    break;
		}
	    }
 
	    //finding second group_number having minimum number of rectangles
	    for (int j = 0; j < no_Groups; j = j + 1) {
		if (j == max_rec[0])
		    continue;
		if ((v[j + 1] - v[j]) == no_rec_grp[1]) {
		    max_rec[1] = j;
		    break;
		}
	    }
 
	    //finding weights among members of above two groups
	    for (int i = 0; i < no_rec_grp[0]; i = i + 1) {
		for (int j = 0; j < no_rec_grp[1]; j = j + 1) {
		    v4[i2] = adjmat[members_grp[max_rec[0]][i]][members_grp[max_rec[1]][j]];
		    i2++;
		}
	    }
 
	    //arranging above weights in acending order
	    for (int i = 0; i < i2; i = i + 1) {
		for (int j = i + 1; j < i2; j = j + 1) {
		    if (v4[i] > v4[j]) {
			int temp = v4[i];
			v4[i] = v4[j];
			v4[j] = temp;
		    }
		}
	    }
 
	    //finding two members having maximum weight among them and make them adjacent to make two groups as one
	    for (int i = 0; i < no_rec_grp[0]; i = i + 1) {
		for (int j = 0; j < no_rec_grp[1]; j = j + 1) {
		    if (v4[i2 - 1] == adjmat[members_grp[max_rec[0]][i]][members_grp[max_rec[1]][j]]) {
			a[p3] = members_grp[max_rec[0]][i];
			b[p3] = members_grp[max_rec[1]][j];
			p3++;
			break;
		    }
		}
	    }
 
	}
 
    }
 
}
