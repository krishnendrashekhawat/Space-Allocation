int members_grp1[][] = new int[400][2000];

// In this function we arrange the members of each group 
// according to their sizes in ascending order
void arrangingsizes()
{
    //saving the values of array c1 in array c2 to keep original values in c2
    for (int k3 = 0; k3 < no_Groups; k3 = k3 + 1) 
    {
	for (int i = 0; i < (v[k3 + 1] - v[k3]); i = i + 1) 
        {
	    members_grp1[k3][i] = members_grp[k3][i];
	}
    }
    
   // arranging in ascending order
    for (int k3 = 0; k3 < no_Groups; k3 = k3 + 1) 
    {
	for (int j = 0; j < (v[k3 + 1] - v[k3]) - 1; j = j + 1) 
        {
	    for (int i = 0; i < (v[k3 + 1] - v[k3]) - 1; i = i + 1) 
            {
		if (length[members_grp[k3][i]] * height[members_grp[k3][i]] < 
                    length[members_grp[k3][i + 1]] * height[members_grp[k3][i + 1]])
                    {
        	//if area of ith rectangle is less then jth rectangle then it skip this step  
		    continue;
		} else		//otherwise we interchange length and height of ith and jth rectangle
		{
 
		    //interchanging length
		    float temp = length[members_grp[k3][i]];
		    length[members_grp[k3][i]] = length[members_grp[k3][i + 1]];
		    length[members_grp[k3][i + 1]] = temp;
 
		    //interchanging height
		    float temp3 = height[members_grp[k3][i]];
		    height[members_grp[k3][i]] = height[members_grp[k3][i + 1]];
		    height[members_grp[k3][i + 1]] = temp3;
 
		    //interchanging position
		    int temp1 = members_grp1[k3][i];
		    members_grp1[k3][i] = members_grp1[k3][i + 1];
		    members_grp1[k3][i + 1] = temp1;
 
		}
	    }
	}
    }
 
}
