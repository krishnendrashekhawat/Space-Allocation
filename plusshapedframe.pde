 
int t5 = 0;			//helps to find total length till the group is drawn
int t1 = 0;			//helps to find total height till the group is drawn
float[] A_original = new float[200];	//used to interchange length and height of a rectangle
float[] A_intrchnge = new float[200];
int d = 0, d1 = 0;		//variables
int no_rects = 0;		//calculates number of rectangles in running group
float totalarea = 0;
float[] k8 = new float[100];  
int k10 = 0; float k15 = 0; 

float[] r5 = new float[200];	//calculates total length and height of each group
float[] L_frame = new float[200];	//gives length of rectangular frame at every stage
float[] H_frame = new float[200];	//gives height of rectangular frame at every stage
float x = 180;			//intial position of starting point on x-axis
float y = 190;			//initial point of starting point on y-axis
int innerextraspace = 0;
int outerextraspace = 0;
int[] Grnumber = new int[5];
int[] spiral = new int[5];	//these spiral will be used to find which spiral is used
 
 
//this function in the end draws the plus shaped frame on the screen 
void plusshapedframe()
{
 
   // In this part, we intefchange length and height of members, calculate length and height 
   // of groups and then area of plus shaped frame
    for (int groupnumber = 0; groupnumber < no_Groups; groupnumber = groupnumber + 1)
	//considering each group one by one
    {
	t5 = 0;
	t1 = 0;
	d = 0;
	d1 = 0;
 
	k3 = Grnumber[groupnumber];
	//gives group number
	no_rects = (v[k3 + 1] - v[k3]);
	//number of rectangles in k3th group
 
	if (k3 == Grnumber[0] || k3 == Grnumber[1] || k3 == Grnumber[3]) {
	    //for 1st, 2nd and 4th group, if length of 1st rect < height of 1st rect
	    //then swap length and height of 1st rect to obtain final shape compact
	    if (length[members_grp[k3][0]] < height[members_grp[k3][0]]) {
		float temp = length[members_grp[k3][0]];
		length[members_grp[k3][0]] = height[members_grp[k3][0]];
		height[members_grp[k3][0]] = temp;
	    }
	}
 
	if (k3 == Grnumber[2] || k3 == Grnumber[4]) {
	    //for 3rd and 5th group, if length of 1st rect > height of 1st rect
	    //then swap length and height of 1st rect to obtain final shape compact
	    if (height[members_grp[k3][0]] < length[members_grp[k3][0]]) {
		float temp3 = height[members_grp[k3][0]];
		height[members_grp[k3][0]] = length[members_grp[k3][0]];
		length[members_grp[k3][0]] = temp3;
	    }
	}

	// interchanging length and height of members of each group if required
	if (k3 == Grnumber[groupnumber]) {
	    //considering 1st group
	    if (0 == spiral[groupnumber] || 1 == spiral[groupnumber] || 4 == spiral[groupnumber] || 5 == spiral[groupnumber])
		//when 1st or 2nd or 5th or 6th spiral is used
		shape1();
	    //this function interchange length and height of members of group if required
 
	    if (2 == spiral[groupnumber] || 3 == spiral[groupnumber] || 6 == spiral[groupnumber] || 7 == spiral[groupnumber])
		shape2();
 
	}
	//calculating length and height of each group
	if (k3 == Grnumber[0]) {
	    //considering 1st group
	    if (0 == spiral[0] || 1 == spiral[0] || 4 == spiral[0] || 5 == spiral[0])
		//when 1st or 2nd or 5th or 6th spiral is used
		L_and_H1_1();
	    //this gives length and height of group1
 
	    if (2 == spiral[0] || 3 == spiral[0] || 6 == spiral[0] || 7 == spiral[0])
		L_and_H2_1();
 
	}
 
 
	if (k3 == Grnumber[1]) {
	    //considering 2nd group
	    if (0 == spiral[1] || 1 == spiral[1] || 4 == spiral[1] || 5 == spiral[1])
		L_and_H1_2();
 
	    if (2 == spiral[1] || 3 == spiral[1] || 6 == spiral[1] || 7 == spiral[1])
		L_and_H2_2();
 
	}
 
 
	if (k3 == Grnumber[2]) {
	    //considering 3rd group
	    if (0 == spiral[2] || 1 == spiral[2] || 4 == spiral[2] || 5 == spiral[2])
		L_and_H1_3();
 
	    if (2 == spiral[2] || 3 == spiral[2] || 6 == spiral[2] || 7 == spiral[2])
		L_and_H2_3();
	}
 
 
	if (k3 == Grnumber[3]) {
	    //considering 4th group
	    if (0 == spiral[3] || 1 == spiral[3] || 4 == spiral[3] || 5 == spiral[3])
		L_and_H1_4();
 
	    if (2 == spiral[3] || 3 == spiral[3] || 6 == spiral[3] || 7 == spiral[3])
		L_and_H2_4();
 
	}
 
 
	if (k3 == Grnumber[4]) {
	    //considering 5th group
	    if (0 == spiral[4] || 1 == spiral[4] || 4 == spiral[4] || 5 == spiral[4])
		L_and_H1_5();
 
	    if (2 == spiral[4] || 3 == spiral[4] || 6 == spiral[4] || 7 == spiral[4])
		L_and_H2_5();
	}
 
    }
 
    //finding max(length(group1), length(group3), length(group5))
    for (int h = 0; h < 3; h = h + 1) {
	if (r5[2] >= r5[4] && r5[2] >= r5[8]) {
	    r5[10] = r5[2];
	    break;
	}
	if (r5[4] >= r5[2] && r5[4] >= r5[8]) {
	    r5[10] = r5[4];
	    break;
	}
	if (r5[8] >= r5[4] && r5[8] >= r5[2]) {
	    r5[10] = r5[8];
	    break;
	}
 
    }
 
    //finding max(height(group1), height(group2), height(group4))
    for (int h1 = 0; h1 < 3; h1 = h1 + 1) {
	if (r5[0] >= r5[1] && r5[0] >= r5[7]) {
	    r5[11] = r5[0];
	    break;
	}
 
	if (r5[1] >= r5[0] && r5[1] >= r5[7]) {
	    r5[11] = r5[1];
	    break;
	}
 
	if (r5[7] >= r5[0] && r5[7] >= r5[1]) {
	    r5[11] = r5[7];
	    break;
	}
 
    }
 
    //obtaining area of plus shaped frame
    totalarea = ((r5[3] + r5[6] + r5[10]) * r5[11] + (r5[5] + r5[9] + r5[11])
		 * r5[10]) - (r5[10] * r5[11]);
 
    //In this part, we obtain starting point of each group, then draw outer extra spaces
    // and groups to obtain plus shaped frame on the screen
    for (int groupnumber = 0; groupnumber < no_Groups; groupnumber = groupnumber + 1) {
 
	x = 180; y = 190;
	t5 = 0; t1 = 0; d = 0; d1 = 0;

	float[] k8 = new float[100]; //gives length or height of inner extra spaces
	int k10 = 0; float k15 = 0; 

	k3 = Grnumber[groupnumber];
	no_rects = (v[k3 + 1] - v[k3]);
 
	//obtaining length and height of rectangular frame at every step for each group
	if (k3 == Grnumber[groupnumber]) {	//considering group1
 
	    if (0 == spiral[groupnumber] || 1 == spiral[groupnumber] || 4 == spiral[groupnumber] || 5 == spiral[groupnumber])
		shape1_1();
	    //obtaining length and height of rectangular frame at every step for group1
 
	    if (2 == spiral[groupnumber] || 3 == spiral[groupnumber] || 6 == spiral[groupnumber] || 7 == spiral[groupnumber])
		shape2_1();
 
	}
	//getting starting point of group one
	if (k3 == Grnumber[0]) {
	    if (0 == spiral[0])
		extra1_1(4, 1);
	    //gives starting point of group1
 
	    if (1 == spiral[0])
		extra1_1(2, 3);
 
	    if (2 == spiral[0])
		extra1_1(3, 4);
 
	    if (3 == spiral[0])
		extra1_1(1, 2);
 
	    if (4 == spiral[0])
		extra1_1(4, 3);
 
	    if (5 == spiral[0])
		extra1_1(2, 1);
 
	    if (6 == spiral[0])
		extra1_1(1, 4);
 
	    if (7 == spiral[0])
		extra1_1(3, 2);
 
	}
	//getting starting point of group2 and drawing extra space 
	//becoz of the diff between height of group1 and group2
	if (k3 == Grnumber[1]) {
 
	    if (0 == spiral[1])
		extra1_2(1, 2, 1, 4);
 
	    if (1 == spiral[1])
		extra1_2(1, 4, 3, 2);
 
	    if (2 == spiral[1])
		extra1_2(0, 1, 4, 3);
 
	    if (3 == spiral[1])
		extra1_2(0, 3, 2, 1);
 
	    if (4 == spiral[1])
		extra1_2(1, 2, 3, 4);
 
	    if (5 == spiral[1])
		extra1_2(1, 4, 1, 2);
 
	    if (6 == spiral[1])
		extra1_2(0, 3, 4, 1);
 
	    if (7 == spiral[1])
		extra1_2(0, 1, 2, 3);
 
	}
	//getting starting point of group3 and drawing extra space parallel to 
	//right of group3 or group1 becoz of diff between length of group 1, 3, 5 
	if (k3 == Grnumber[2]) {	//considering group3
 
	    if (0 == spiral[2])	//when spiral 1 is used
		extra1_3(0, 3, 4);
 
	    if (1 == spiral[2])
		extra1_3(0, 1, 2);
 
	    if (2 == spiral[2])
		extra1_3(1, 2, 3);
 
	    if (3 == spiral[2])
		extra1_3(1, 4, 1);
 
	    if (4 == spiral[2])
		extra1_3(0, 1, 4);
 
	    if (5 == spiral[2])
		extra1_3(0, 3, 2);
 
	    if (6 == spiral[2])
		extra1_3(1, 2, 1);
 
	    if (7 == spiral[2])
		extra1_3(1, 4, 3);
 
	}
	//getting starting point of group4 and drawing extra space below to 
	//group1 or 2 or 4 becoz of diff between height of group 1, 2, 4
	if (k3 == Grnumber[3]) {	//considering group4
 
	    if (0 == spiral[3])	//when spiral 1 is used
		extra1_4(4, 1);
 
	    if (1 == spiral[3])
		extra1_4(2, 3);
 
	    if (2 == spiral[3])
		extra1_4(3, 4);
 
	    if (3 == spiral[3])
		extra1_4(1, 2);
 
	    if (4 == spiral[3])
		extra1_4(4, 3);
 
	    if (5 == spiral[3])
		extra1_4(2, 1);
 
	    if (6 == spiral[3])
		extra1_4(1, 4);
 
	    if (7 == spiral[3])
		extra1_4(3, 2);
 
	}
	//getting starting point of group5 and drawing extra space parallel 
	//to right of group5 becoz of diff between length of group 1, 3, 5
	if (k3 == Grnumber[4]) {	//considering group5
 
	    if (0 == spiral[4])	//when spiral 1 is used
		extra1_5(1, 4);
 
	    if (1 == spiral[4])
		extra1_5(3, 2);
 
	    if (2 == spiral[4])
		extra1_5(4, 3);
 
	    if (3 == spiral[4])
		extra1_5(2, 1);
 
	    if (4 == spiral[4])
		extra1_5(3, 4);
 
	    if (5 == spiral[4])
		extra1_5(1, 2);
 
	    if (6 == spiral[4])
		extra1_5(4, 1);
 
	    if (7 == spiral[4])
		extra1_5(2, 3);
 
	}

	//drawing each group
	if (k3 == Grnumber[groupnumber]) {	//considering group1
 
	    if (0 == spiral[groupnumber])	//when spiral 1 is used
		shape1_2();	//drawing group1
 
	    if (1 == spiral[groupnumber])
		shape2_2();
 
	    if (2 == spiral[groupnumber])
		shape3_2();
 
	    if (3 == spiral[groupnumber])
		shape4_2();
 
	    if (4 == spiral[groupnumber])
		shape5_2();
 
	    if (5 == spiral[groupnumber])
		shape6_2();
 
	    if (6 == spiral[groupnumber])
		shape7_2();
 
	    if (7 == spiral[groupnumber])
		shape8_2();
 
	}
 
    }
 
 
    x = 180;
    y = 190;
    //intial position on x-axis and y-axis                      
 
    //calculating length and height of plus shaped frame 
    float a = (r5[3] + r5[6] + r5[10]);
    float b = (r5[5] + r5[9] + r5[11]);
 
   // drawing outer boundary to plus shaped frame
  /*  strokeWeight(4);
    line(x, y, x, y - r5[5]);
    line(x, y - r5[5], x + r5[10], y - r5[5]);
    line(x + r5[10], y - r5[5], x + r5[10], y);
    line(x + r5[10], y, x + r5[10] + r5[6], y);
    line(x + r5[10] + r5[6], y, x + r5[10] + r5[6], y + r5[11]);
    line(x + r5[10] + r5[6], y + r5[11], x + r5[10], y + r5[11]);
    line(x + r5[10], y + r5[11], x + r5[10], y + r5[11] + r5[9]);
    line(x + r5[10], y + r5[11] + r5[9], x, y + r5[11] + r5[9]);
    line(x, y + r5[11] + r5[9], x, y + r5[11]);
    line(x, y + r5[11], x - r5[3], y + r5[11]);
    line(x - r5[3], y + r5[11], x - r5[3], y);
    line(x - r5[3], y, x, y);
    strokeWeight(0);*/
  
    //increasing length of plot  
    if (plot[0] <= a)
	plot[0] = plot[0] + (a - plot[0]) + 80;
 
    //increasing height of plot 
    if (plot[1] <= b)
	plot[1] = plot[1] + (b - plot[1]) + 80;
 
   // this is for drawing index on the screen
   rect(x + r5[10]+20, y + plot[1] - r5[5] + 10-190, 12, 12);
    fill(250);
    rect(x + r5[10]+20, y + plot[1] - r5[5] + 30-190, 12, 12);
    fill(75);
    rect(x + r5[10]+20, y + plot[1] - r5[5] + 50-190, 12, 12);
    //fill(0, 140, 60);
    //rect(x + r5[10]+20, y + plot[1] - r5[5] + 70-90, 12, 12);
 
    fill(10, 0, 0);
    PFont myFont = createFont("Times", 14);
    textFont(myFont);
    text("- Given spaces", x + r5[10] + 42, y + plot[1] - r5[5] + 21-190);
    text("- Inner extra space", x + r5[10] + 42, y + plot[1] - r5[5] + 41-190);
    text("- Outer extra space", x + r5[10] + 42, y + plot[1] - r5[5] + 60-190);
    // text("- Parts of Outer Rectangle", x + r5[10] + 22, y + plot[1] - r5[5] + 80);
    noFill();
 
    //Drawing plot and dividing it into eight parts
 /*   if (plot[0] >= a && plot[1] >= b) {
 
	strokeWeight(4);
	rect(x - r5[3] - ((plot[0] - a) / 2), y - r5[5] - (plot[1] - b) / 2, plot[0], plot[1]);	//drawing outer plot
	strokeWeight(0);
	fill(0, 140, 60);
 
	rect(x - r5[3] - ((plot[0] - a) / 2), y - r5[5] - (plot[1] - b) / 2, (plot[0] - a) / 2 + r5[3], (plot[1] - b) / 2 + r5[5]);
	rect(x, y - r5[5] - (plot[1] - b) / 2, r5[10], (plot[1] - b) / 2);
	rect(x + r5[10], y - r5[5] - (plot[1] - b) / 2, r5[6] + (plot[0] - a) / 2, (plot[1] - b) / 2 + r5[5]);
	rect(x + r5[10] + r5[6], y, (plot[0] - a) / 2, r5[11]);
	rect(x - r5[3] - ((plot[0] - a) / 2), y, (plot[0] - a) / 2, r5[11]);
	rect(x - r5[3] - ((plot[0] - a) / 2), y + r5[11], (plot[0] - a) / 2 + r5[3], r5[9] + (plot[1] - b) / 2);
	rect(x, y + r5[11] + r5[9], r5[10], (plot[1] - b) / 2);
	rect(x + r5[10], y + r5[11], (plot[0] - a) / 2 + r5[6], r5[9] + (plot[1] - b) / 2);
 
	noFill();
    }*/
}
 
 
//this function interchange the length and height of the members of any group if required 
//when 1st or 2nd or 5th or 6th spiral is used for corresponding group 
void shape1()
{
 
    //this is for the second rectangle of any group
    if (length[members_grp[k3][1]] < length[members_grp[k3][0]]) {
	A_original[d] = (length[members_grp[k3][0]] - length[members_grp[k3][1]]) * height[members_grp[k3][1]];
	//here A_original[0] gives area of extra space when 2nd member has length length[1] and height height[1]
	d++;
    } else {
	A_original[d] = (length[members_grp[k3][1]] - length[members_grp[k3][0]]) * height[members_grp[k3][0]];
	d++;
    }
 
 
    if (length[members_grp[k3][0]] > height[members_grp[k3][1]]) {
	//here A_original[0] gives area of extra space when 2nd member has length height[1] and height length[1]
	A_intrchnge[d1] = (length[members_grp[k3][0]] - height[members_grp[k3][1]]) * length[members_grp[k3][1]];
	d1++;
    } else {
	A_intrchnge[d1] = (-length[members_grp[k3][0]] + height[members_grp[k3][1]]) * height[members_grp[k3][0]];
	d1++;
    }
 
 
    //getting length and height of 2nd member for which area of extra space is minimum
    if (A_original[0] > A_intrchnge[0]) {
	float p2;
	p2 = length[members_grp[k3][1]];
	length[members_grp[k3][1]] = height[members_grp[k3][1]];
	height[members_grp[k3][1]] = p2;
    }
 
  //calculating initial value of height of rectangular frame
    H_frame[t1] = height[members_grp[k3][0]];
    t1++;
 
    //calculating initial value of length of rectangular frame
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	L_frame[t5] = length[members_grp[k3][1]];
	t5++;
    } else {
	L_frame[t5] = length[members_grp[k3][0]];
	t5++;
    }
 
    int j = 1;
 
    for (int i = 2; i < no_rects; i = i + 1) {
 
	if (j % 4 == 1) {	//interchange of length and height of 3rd, 7th, 11th and so on rectangles
	    H_frame[t1] = (height[members_grp[k3][i - 1]] + H_frame[t1 - 1]);
	    t1++;
 
 
	    if (H_frame[t1 - 1] - height[members_grp[k3][i]] > 0) {
		A_original[d] = (H_frame[t1 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-H_frame[t1 - 1] + height[members_grp[k3][i]]) * L_frame[t5 - 1];
		d++;
	    }
 
 
	    if (H_frame[t1 - 1] - length[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (H_frame[t1 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-H_frame[t1 - 1] + length[members_grp[k3][i]]) * L_frame[t5 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1]) {
		//if A_original[]<A_intrchnge[], it swaps length and height of given rectangle
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		//if height of this rectangle is > sum of heights calculated above then 
		//it save height of this rectangle as sum of heights calculated above
		H_frame[t1 - 1] = height[members_grp[k3][i]];
	    }
 
	}
 
 
	if (j % 4 == 2) {	//interchange of length and height of 4th, 8th, 12th and so on rectangles
 
	    L_frame[t5] = L_frame[t5 - 1] + length[members_grp[k3][i - 1]];
	    t5++;
 
	    if (L_frame[t5 - 1] - length[members_grp[k3][i]] > 0) {
		A_original[d] = (L_frame[t5 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-L_frame[t5 - 1] + length[members_grp[k3][i]]) * H_frame[t1 - 1];
		d++;
	    }
 
 
	    if (L_frame[t5 - 1] - height[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (L_frame[t5 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-L_frame[t5 - 1] + height[members_grp[k3][i]]) * H_frame[t1 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1])
		//swaps length and height of given rectangle
	    {
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1])
		//if length of this rectangle > sum of lengths calculated above then 
		//it save length of this rectangle as sum of lengths calculated above
		L_frame[t5 - 1] = length[members_grp[k3][i]];
 
	}
 
 
	if (j % 4 == 3) {	//interchange of length and height of 5th, 9th, 13th and so on rectangles
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
 
	    if (H_frame[t1 - 1] - height[members_grp[k3][i]] > 0) {
		A_original[d] = (H_frame[t1 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-H_frame[t1 - 1] + height[members_grp[k3][i]]) * L_frame[t5 - 1];
		d++;
	    }
 
 
	    if (H_frame[t1 - 1] - length[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (H_frame[t1 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-H_frame[t1 - 1] + length[members_grp[k3][i]]) * L_frame[t5 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1]) {
		//if A_original[]<A_intrchnge[], it swaps length and height of given rectangle
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		H_frame[t1 - 1] = height[members_grp[k3][i]];
	    }
 
	}
 
 
	if (j % 4 == 0) {	//interchange of length and height of 6th, 10th, 14th and so on rectangles
 
	    L_frame[t5] = L_frame[t5 - 1] + length[members_grp[k3][i - 1]];
	    t5++;
 
 
	    if (L_frame[t5 - 1] - length[members_grp[k3][i]] > 0) {
		A_original[d] = (L_frame[t5 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-L_frame[t5 - 1] + length[members_grp[k3][i]]) * H_frame[t1 - 1];
		d++;
	    }
 
 
	    if (L_frame[t5 - 1] - height[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (L_frame[t5 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-L_frame[t5 - 1] + height[members_grp[k3][i]]) * H_frame[t1 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1])
		//if A_original[]>A_intrchnge[], it swaps length and height of given rectangle
	    {
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1])
		L_frame[t5 - 1] = length[members_grp[k3][i]];
 
	}
 
	j = j + 1;
 
    }
 
}
 
 
//this function interchange the length and height of the members of any group if required 
//when 3rd or 4th or 7th or 8th spiral is used for corresponding group  
void shape2()
{
 
    //this is for the second rectangle of any group
    if (height[members_grp[k3][1]] < height[members_grp[k3][0]]) {
	A_original[d] = (height[members_grp[k3][0]] - height[members_grp[k3][1]]) * length[members_grp[k3][1]];
	d++;
    } else {
	A_original[d] = (height[members_grp[k3][1]] - height[members_grp[k3][0]]) * length[members_grp[k3][0]];
	d++;
    }
 
 
    if (length[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	A_intrchnge[d1] = (length[members_grp[k3][1]] - height[members_grp[k3][0]]) * length[members_grp[k3][0]];
	d1++;
    } else {
	A_intrchnge[d1] = (-length[members_grp[k3][1]] + height[members_grp[k3][0]]) * height[members_grp[k3][1]];
	d1++;
    }
 
 
    if (A_original[0] > A_intrchnge[0]) {
	float p2;
	p2 = length[members_grp[k3][1]];
	length[members_grp[k3][1]] = height[members_grp[k3][1]];
	height[members_grp[k3][1]] = p2;
    }
 
 
    L_frame[t5] = length[members_grp[k3][0]];
    t5++;
 
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	H_frame[t1] = height[members_grp[k3][1]];
	t1++;
    } else {
	H_frame[t1] = height[members_grp[k3][0]];
	t1++;
    }
 
 
    int j = 1;
 
    for (int i = 2; i < no_rects; i = i + 1) {
 
	if (j % 4 == 1) {
	    L_frame[t5] = (length[members_grp[k3][i - 1]] + L_frame[t5 - 1]);
	    t5++;
 
 
	    if (L_frame[t5 - 1] - length[members_grp[k3][i]] > 0) {
		A_original[d] = (L_frame[t5 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-L_frame[t5 - 1] + length[members_grp[k3][i]]) * H_frame[t1 - 1];
		d++;
	    }
 
 
	    if (L_frame[t5 - 1] - height[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (L_frame[t5 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-L_frame[t5 - 1] + height[members_grp[k3][i]]) * H_frame[t1 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1])
		//if A_original[]>A_intrchnge[], it swaps length and height of given rectangle
	    {
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		L_frame[t5 - 1] = length[members_grp[k3][i]];
	    }
 
	}
 
 
	if (j % 4 == 2) {
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
 
	    if (H_frame[t1 - 1] - height[members_grp[k3][i]] > 0) {
		A_original[d] = (H_frame[t1 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-H_frame[t1 - 1] + height[members_grp[k3][i]]) * L_frame[t5 - 1];
		d++;
	    }
 
 
	    if (H_frame[t1 - 1] - length[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (H_frame[t1 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-H_frame[t1 - 1] + length[members_grp[k3][i]]) * L_frame[t5 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1]) {
		//if A_original[]<A_intrchnge[], it swaps length and height of given rectangle
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1])
		H_frame[t1 - 1] = height[members_grp[k3][i]];
 
	}
 
	if (j % 4 == 3) {
 
	    L_frame[t5] = (length[members_grp[k3][i - 1]] + L_frame[t5 - 1]);
	    t5++;
 
 
	    if (L_frame[t5 - 1] - length[members_grp[k3][i]] > 0) {
		A_original[d] = (L_frame[t5 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-L_frame[t5 - 1] + length[members_grp[k3][i]]) * H_frame[t1 - 1];
		d++;
	    }
 
 
	    if (L_frame[t5 - 1] - height[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (L_frame[t5 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-L_frame[t5 - 1] + height[members_grp[k3][i]]) * H_frame[t1 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1])
		//if A_original[]>A_intrchnge[], it swaps length and height of given rectangle
	    {
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		L_frame[t5 - 1] = length[members_grp[k3][i]];
	    }
 
	}
 
 
	if (j % 4 == 0) {
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
 
	    if (H_frame[t1 - 1] - height[members_grp[k3][i]] > 0) {
		A_original[d] = (H_frame[t1 - 1] - height[members_grp[k3][i]]) * length[members_grp[k3][i]];
		d++;
	    } else {
		A_original[d] = (-H_frame[t1 - 1] + height[members_grp[k3][i]]) * L_frame[t5 - 1];
		d++;
	    }
 
 
	    if (H_frame[t1 - 1] - length[members_grp[k3][i]] > 0) {
		A_intrchnge[d1] = (H_frame[t1 - 1] - length[members_grp[k3][i]]) * height[members_grp[k3][i]];
		d1++;
	    } else {
		A_intrchnge[d1] = (-H_frame[t1 - 1] + length[members_grp[k3][i]]) * L_frame[t5 - 1];
		d1++;
	    }
 
 
	    if (A_original[i - 1] > A_intrchnge[i - 1]) {
		//if A_original[]<A_intrchnge[], it swaps length and height of given rectangle
		float p2;
		p2 = length[members_grp[k3][i]];
		length[members_grp[k3][i]] = height[members_grp[k3][i]];
		height[members_grp[k3][i]] = p2;
	    }
 
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1])
		H_frame[t1 - 1] = height[members_grp[k3][i]];
	}
 
	j = j + 1;
    }
 
}
 
//this function gives the length and height of group1 when spiral 1 or 2 or 5 or 6 is used
void L_and_H1_1()
{
    if (no_rects > 1) {
	if (no_rects % 2 == 0)
	    r5[0] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of first group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[0] = H_frame[t1 - 1];
	if (no_rects % 2 == 1)
	    r5[2] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of first group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[2] = L_frame[t5 - 1];
    } else {
	r5[2] = length[members_grp[k3][0]];
	//calculates length of first group when number of space is one 
	r5[0] = height[members_grp[k3][0]];
	//calculates height of first group when number of space is one 
    }
}
 
 
//this function gives the length and height of group2 when spiral 1 or 2 or 5 or 6 is used
void L_and_H1_2()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 0)
	    r5[1] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of second group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[1] = H_frame[t1 - 1];
	if (no_rects % 2 == 1)
	    r5[3] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of second group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[3] = L_frame[t5 - 1];
    } else {
	r5[1] = height[members_grp[k3][no_rects - 1]];
	//calculates height of second group when number of space is one 
	r5[3] = length[members_grp[k3][no_rects - 1]];
	//calculates length of second group when number of space is one 
    }
 
}
 
 
//this function gives the length and height of group3 when spiral 1 or 2 or 5 or 6 is used
void L_and_H1_3()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 1)
	    r5[4] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of third group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[4] = L_frame[t5 - 1];
	if (no_rects % 2 == 0)
	    r5[5] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of third group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[5] = H_frame[t1 - 1];
    } else {
	r5[4] = length[members_grp[k3][no_rects - 1]];
	//calculates length of third group when number of space is one 
	r5[5] = height[members_grp[k3][no_rects - 1]];
	//calculates height of third group when number of space is one 
    }
 
}
 
 
//this function gives the length and height of group4 when spiral 1 or 2 or 5 or 6 is used
void L_and_H1_4()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 1)
	    r5[6] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of fourth group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[6] = L_frame[t5 - 1];
	if (no_rects % 2 == 0)
	    r5[7] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of fourth group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[7] = H_frame[t1 - 1];
    } else {
	r5[6] = length[members_grp[k3][no_rects - 1]];
	//calculates length of fourth group when number of space is one 
	r5[7] = height[members_grp[k3][no_rects - 1]];
	//calculates height of fourth group when number of space is one 
    }
 
}
 
 
//this function gives the length and height of group5 when spiral 1 or 2 or 5 or 6 is used
void L_and_H1_5()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 1)
	    r5[8] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of fifth group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[8] = L_frame[t5 - 1];
	if (no_rects % 2 == 0)
	    r5[9] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of fifth group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[9] = H_frame[t1 - 1];
    } else {
	r5[8] = length[members_grp[k3][no_rects - 1]];
	//calculates length of fifth group when number of space is one 
	r5[9] = height[members_grp[k3][no_rects - 1]];
	//calculates height of fifth group when number of space is one 
    }
}
 
 
//this function gives the length and height of group1 when spiral 3 or 4 or 7 or 8 is used 
void L_and_H2_1()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 1)
	    r5[0] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of first group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[0] = H_frame[t1 - 1];
	if (no_rects % 2 == 0)
	    r5[2] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of first group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[2] = L_frame[t5 - 1];
    } else {
	r5[2] = length[members_grp[k3][0]];
	//calculates length of first group when number of space is one 
	r5[0] = height[members_grp[k3][0]];
	//calculates height of first group when number of space is one 
    }
 
}
 
 
//this function gives the length and height of group2 when spiral 3 or 4 or 7 or 8 is used 
void L_and_H2_2()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 1)
	    r5[1] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of second group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[1] = H_frame[t1 - 1];
	if (no_rects % 2 == 0)
	    r5[3] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of second group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[3] = L_frame[t5 - 1];
    } else {
	r5[1] = height[members_grp[k3][no_rects - 1]];
	//calculates height of second group when number of space is one 
	r5[3] = length[members_grp[k3][no_rects - 1]];
	//calculates length of second group when number of space is one 
    }
}
 
 
//this function gives the length and height of group3 when spiral 3 or 4 or 7 or 8 is used 
void L_and_H2_3()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 0)
	    r5[4] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of third group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[4] = L_frame[t5 - 1];
	if (no_rects % 2 == 1)
	    r5[5] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of third group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[5] = H_frame[t1 - 1];
    } else {
	r5[4] = length[members_grp[k3][no_rects - 1]];
	//calculates length of third group when number of space is one 
	r5[5] = height[members_grp[k3][no_rects - 1]];
	//calculates height of third group when number of space is one 
    }
 
}
 
 
//this function gives the length and height of group4 when spiral 3 or 4 or 7 or 8 is used 
void L_and_H2_4()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 0)
	    r5[6] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of fourth group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[6] = L_frame[t5 - 1];
	if (no_rects % 2 == 1)
	    r5[7] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of fourth group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[7] = H_frame[t1 - 1];
    } else {
	r5[6] = length[members_grp[k3][no_rects - 1]];
	//calculates length of fourth group when number of space is one 
	r5[7] = height[members_grp[k3][no_rects - 1]];
	//calculates height of fourth group when number of space is one 
    }
 
}
 
 
//this function gives the length and height of group5 when spiral 3 or 4 or 7 or 8 is used 
void L_and_H2_5()
{
 
    if (no_rects > 1) {
	if (no_rects % 2 == 0)
	    r5[8] = length[members_grp[k3][no_rects - 1]] + L_frame[t5 - 1];
	//calculates length of fifth group when number of rectangles are greater than one 
	if (no_rects % 2 == 1)
	    r5[8] = L_frame[t5 - 1];
	if (no_rects % 2 == 1)
	    r5[9] = height[members_grp[k3][no_rects - 1]] + H_frame[t1 - 1];
	//calculates height of fifth group when number of rectangles are greater than one 
	if (no_rects % 2 == 0)
	    r5[9] = H_frame[t1 - 1];
    } else {
	r5[8] = length[members_grp[k3][no_rects - 1]];
	//calculates length of fifth group when number of space is one 
	r5[9] = height[members_grp[k3][no_rects - 1]];
	//calculates height of fifth group when number of space is one 
    }
}
 
 
//this function calculates length and height of rectangular frame at every step 
//for each group when spiral 1 or 2 or 5 or 6 is used
void shape1_1()
{
 
    t5 = 0;
    t1 = 0;
    k10 = 0;
 
    for (int i = 0; i < no_rects; i = i + 1) {
	k8[i] = 0;
    }
 
 A_original[0] = abs(length[members_grp[k3][1]] - length[members_grp[k3][0]]);
    H_frame[t1] = height[members_grp[k3][0]];	//it saves height of first rectangle as H_frame[0]
    t1++;
 
 
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	//bigger length among 1st and 2nd rectangle is saved as L_frame[0]
	L_frame[t5] = length[members_grp[k3][1]];
	t5++;
    } else {
	L_frame[t5] = length[members_grp[k3][0]];
	t5++;
    }
 
    int j = 1;
 
    for (int i = 2; i < no_rects; i = i + 1) {
 
	if (j % 4 == 1) {	//gives height of the rectangular frame for 3rd, 7th, 11th and so on rectangles
	    H_frame[t1] = (height[members_grp[k3][i - 1]] + H_frame[t1 - 1]);
	    t1++;
 
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		k8[k10] = (height[members_grp[k3][i]] - H_frame[t1 - 1]);
		//saving diff of these two heights in k8[]
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
	}
 
	if (j % 4 == 2) {	//gives length of the rectangular frame for 4th, 8th, 12th and so on rectangles
 
	    L_frame[t5] = L_frame[t5 - 1] + length[members_grp[k3][i - 1]];
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		k8[k10] = (length[members_grp[k3][i]] - L_frame[t5 - 1]);
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
 
	if (j % 4 == 3) {	//gives height of the rectangular frame for 5th, 9th, 13th and so on rectangles
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		k8[k10] = height[members_grp[k3][i]] - H_frame[t1 - 1];
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
 
	if (j % 4 == 0) {	//gives length of the rectangular frame for 6th, 10th, 14th and so on rectangles
 
	    L_frame[t5] = L_frame[t5 - 1] + length[members_grp[k3][i - 1]];
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		k8[k10] = (length[members_grp[k3][i]] - L_frame[t5 - 1]);
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
 
	j = j + 1;
    }
 
}
 
 
//this function calculates length and height of rectangular frame at every step
//for each group when spiral 3 or 4 or 7 or 8 is used
void shape2_1()
{
 
    t5 = 0;
    t1 = 0;
    k10 = 0;
 
    for (int i = 0; i < no_rects; i = i + 1) {
	k8[i] = 0;
    }
 
 A_original[0] = abs(height[members_grp[k3][1]] - height[members_grp[k3][0]]);
    L_frame[t5] = length[members_grp[k3][0]];
    t5++;
 
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	H_frame[t1] = height[members_grp[k3][1]];
	t1++;
    } else {
	H_frame[t1] = height[members_grp[k3][0]];
	t1++;
    }
 
 
    int j = 1;
 
    for (int i = 2; i < no_rects; i = i + 1) {
 
	if (j % 4 == 1) {
 
	    L_frame[t5] = (length[members_grp[k3][i - 1]] + L_frame[t5 - 1]);
	    t5++;
 
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		k8[k10] = (length[members_grp[k3][i]] - L_frame[t5 - 1]);
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		k8[k10] = (height[members_grp[k3][i]] - H_frame[t1 - 1]);
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
 
	if (j % 4 == 3) {
 
	    L_frame[t5] = (length[members_grp[k3][i - 1]] + L_frame[t5 - 1]);
	    t5++;
 
	    if (length[members_grp[k3][i]] > L_frame[t5 - 1]) {
		k8[k10] = (length[members_grp[k3][i]] - L_frame[t5 - 1]);
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    H_frame[t1] = H_frame[t1 - 1] + height[members_grp[k3][i - 1]];
	    t1++;
 
	    if (height[members_grp[k3][i]] > H_frame[t1 - 1]) {
		k8[k10] = (height[members_grp[k3][i]] - H_frame[t1 - 1]);
		k10++;
	    } else {
		k8[k10] = 0;
		k10++;
	    }
 
	}
	j = j + 1;
    }
 
}

//this function gives the starting point of group1
void extra1_1(int p1, int p2)
{
    for (int i1 = p1; i1 < no_rects; i1 = i1 + 4) {
	x = x + length[members_grp[k3][i1]];
    }
    
    for (int i1 = p2; i1 < no_rects; i1 = i1 + 4) {
	y = y + height[members_grp[k3][i1]];
    }
    
}
 
 
//this function gives the starting point of group2 and draws extra space below 
//group1 or group2 because of the difference in height of group1 and group2
void extra1_2(int p1, int p2, int p3, int p4)
{
    float r7 = 0, r19 = 0, r20 = 0, p5 = 0;
    
    for (int i1 = p1; i1 < no_rects; i1 = i1 + 2) {
	x = x - k8[i1];
	k15 = k15 + k8[i1];
    }
 
    if (p1 == 1) {
	x = x - L_frame[0];
	p5 = L_frame[0];
    }
 
    if (p1 == 0) {
	x = x - length[members_grp[k3][0]];
	p5 = length[members_grp[k3][0]];
    }
 
    for (int i1 = p2; i1 < no_rects; i1 = i1 + 4) {
	x = x - length[members_grp[k3][i1]];
	r20 = r20 + length[members_grp[k3][i1]];
    }
 
    for (int i1 = p3; i1 < no_rects; i1 = i1 + 4) {
	y = y + height[members_grp[k3][i1]];
	r7 = r7 + height[members_grp[k3][i1]];
    }
 
    fill(75);
 
    if (r5[1] > r5[0]) {
	//if length of group2 is greater group1 then it draws a rectangle below to group1
	rect(x + p5 + r20 + k15, y + r5[0] - r7, r5[2], r5[1] - r5[0]);
	outerextraspace++;
    }
 
    if (r5[1] < r5[0]) {
	//if length of group2 is smaller group1 then it draws a rectangle below to group2
 
	for (int i1 = p4; i1 < no_rects; i1 = i1 + 4) {
	    r19 = r19 + length[members_grp[k3][i1]];
	}
	rect(x - r19, y + r5[1] - r7, r5[3], -r5[1] + r5[0]);
	outerextraspace++;
    }
    noFill();
}
 
 
//this function gives the starting point of group3 and draws extra space 
//parallel to the right of group1 or group3 becoz of the diff in length of group 1, 3 and 5 
void extra1_3(int p1, int p2, int p3)
{
    
   float r8 = 0, r9 = 0, r22 = 0, r23 = 0, r24 = 0;
    k15 = 0;
 
    for (int i1 = p1; i1 < no_rects; i1 = i1 + 2) {
	y = y - k8[i1];
	k15 = k15 + k8[i1];
    }
 
    if (p1 == 0) {
	y = y - height[members_grp[k3][0]];
	r9 = r9 + height[members_grp[k3][0]];
    }
 
 
    if (p1 == 1) {
	y = y - H_frame[0];
	r9 = r9 + H_frame[0];
    }
 
    for (int i1 = p2; i1 < no_rects; i1 = i1 + 4) {
	y = y - height[members_grp[k3][i1]];
	r9 = r9 + height[members_grp[k3][i1]];
    }
 
 
    for (int i1 = p3; i1 < no_rects; i1 = i1 + 4) {
	x = x + length[members_grp[k3][i1]];
	r8 = r8 + length[members_grp[k3][i1]];
    }
 
    r22 = r5[2];
    r23 = r5[4];
    r24 = r5[8];
 
    fill(75);
    //after drawing group3, here there are 7 possibilities for drawing extra spaces
    //once any possibility is satisfied we stop there 
    for (int i = 0; i < 7; i = i + 1) {
 
	if (r23 < r22 && r22 > r24) {	//if length of group1 is > group3 and group5
	    //we draw a rectangle above group1 parallel to group3
	    rect(x + r23 - r8, y + r9 - r5[5] + k15, r22 - r23, r5[5]);
	    outerextraspace++;	//increase number of extra spaces by one
	    r22 = 0;
	    r23 = 0;
	    r24 = 0;
	    i = 7;
	}
 
 
	if (r23 > r22 && r23 > r24) {	//if length of group3 > group1 and group5
	    //draw a rectangle below group3 parallel to group1 
	    if (r5[1] > r5[0]) {
		rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[1]);
	    }
 
	    if (r5[1] <= r5[0]) {
		rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[0]);
	    }
 
	    if (r5[1] != r5[0]) {
		outerextraspace++;	//increase number of extra spaces by one
	    }
	    r22 = 0;
	    r23 = 0;
	    r24 = 0;
	    i = 7;
 
	}
 
 
	if (r23 < r24 && r22 < r24) {	//if length of group5 > group1 and group3
 
	    if (r22 > r23) {	//if length of group1 is greater than group3
		outerextraspace++;	//increase number of extra spaces by one
		rect(x + r23 - r8, y + r9 - r5[5] + k15, r22 - r23, r5[5]);
		//draw a rectangle above group1 parallel to group3
		//then a big rectangle above group5 parallel to group1 and group3
 
		if (r5[1] > r5[0]) {
		    rect(x + r22 - r8, y + r9 - r5[5] + k15, r24 - r22, r5[5] + r5[1] + k15);
		}
 
		if (r5[1] <= r5[0]) {
		    rect(x + r22 - r8, y + r9 - r5[5] + k15, r24 - r22, r5[5] + r5[0] + k15);
		}
 
		if (r5[1] != r5[0])
		    outerextraspace++;	//increase number of extra spaces by one          
 
		r22 = 0;
		r23 = 0;
		r24 = 0;
		i = 7;
	    }
	}
 
 
	if (r23 < r24 && r22 < r24) {	//if length of group5 > group1 and group3
 
	    if (r22 < r23) {	//if length of group3 is greater than group1
		if (r5[1] >= r5[0]) {	//draw a rectangle below group3 parallel to group1
		    rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[1]);
		}
		//draw a big rectangle above group5 parallel to group1 and group3
		if (r5[1] < r5[0]) {
		    rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[0]);
		}
 
		if (r5[1] >= r5[0]) {
		    rect(x + r23 - r8, y + r9 - r5[5] + k15, r24 - r23, r5[5] + r5[1]);
		}
 
		if (r5[1] < r5[0]) {
		    rect(x + r23 - r8, y + r9 - r5[5] + k15, r24 - r23, r5[5] + r5[0]);
		}
 
		if (r5[1] != r5[0]) {	//increase number of extra spaces by two
		    outerextraspace++;
		    outerextraspace++;
		}
 
		r22 = 0;
		r23 = 0;
		r24 = 0;
		i = 7;
	    }
	}
 
 
	if (r23 == r22 && r22 < r24) {	//if length of group5 > group1 and group3
	    //and length of group3 is equal to group1
	    //then draw a big rectangle above group5 parallel to group1 and group3 
 
	    if (r5[1] >= r5[0])
		rect(x - r8 + r22, y + r9 + k15 - r5[5], r24 - r22, r5[1] + r5[5] + k15);
 
	    if (r5[1] < r5[0])
		rect(x - r8 + r22, y + r9 + k15 - r5[5], r24 - r22, r5[0] + r5[5] + k15);
 
	    if (r5[1] != r5[0])
		outerextraspace++;	//increase number of extra spaces by one                      
 
	    r22 = 0;
	    r23 = 0;
	    r24 = 0;
	    i = 7;
 
	}
 
 
	if (r24 == r22) {	//if length of group5 is equal to group1
 
	    if (r22 > r23) {	//if length of group1 is greater than group3
		outerextraspace++;	//increase number of extra spaces by one
		//draw a rectangle above group1 parallel to group3
		rect(x + r23 - r8, y + r9 - r5[5] + k15, r22 - r23, r5[5]);
		r22 = 0;
		r23 = 0;
		r24 = 0;
		i = 7;
	    }
 
	    if (r22 < r23) {	//if length of group3 is greater than group1 
		//draw a rectangle below group3 parallel to group1
		if (r5[1] >= r5[0]) {
		    rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[1]);
		}
 
		if (r5[1] < r5[0]) {
		    rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[0]);
		}
 
		if (r5[1] != r5[0]) {
		    outerextraspace++;	//increase number of extra spaces by one
		}
 
		r22 = 0;
		r23 = 0;
		r24 = 0;
		i = 7;
	    }
 
	}
 
 
	if (r24 == r23) {	//if length of group5 is equal to group3
 
	    if (r22 > r23) {	//if length of group1 > group3
		outerextraspace++;	//increase number of extra spaces by one
		//draw a rectangle above group1 parallel to group3
		rect(x + r23 - r8, y + r9 - r5[5] + k15, r22 - r23, r5[5] + k15);
		r22 = 0;
		r23 = 0;
		r24 = 0;
		i = 7;
	    }
 
 
	    if (r22 < r23) {	//if length of group3 is greater than group1 
		//draw a rectangle below group3 parallel to group1
		if (r5[1] >= r5[0]) {
		    rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[1]);
		}
 
		if (r5[1] < r5[0]) {
		    rect(x - r8 + r22, y + r9 + k15, r23 - r22, r5[0]);
		}
 
		if (r5[1] != r5[0]) {
		    outerextraspace++;	//increase number of extra spaces by one
		}
 
		r22 = 0;
		r23 = 0;
		r24 = 0;
		i = 7;
	    }
	}
    }
    noFill();
}
 
 
//this function gives the starting point of group4 and draws extra space 
//below group 1 or 2 or 4 because of diff between lengths of group 1, 2 and 4
void extra1_4(int p1, int p2)
{
   float r10 = 0, r11 = 0, r12 = 0, r13 = 0, r25 = 0, r26 = 0, r27 = 0;
   
    for (int i1 = p1; i1 < no_rects; i1 = i1 + 4) {
	x = x + length[members_grp[k3][i1]];
	r10 = r10 + length[members_grp[k3][i1]];
    }
 
    for (int i1 = p2; i1 < no_rects; i1 = i1 + 4) {
	y = y + height[members_grp[k3][i1]];
	r11 = r11 + height[members_grp[k3][i1]];
    }
 
    r25 = r5[2];
    r26 = r5[4];
    r27 = r5[8];
 
    //calculations for obtaining starting point of extra space
    for (int i1 = 0; i1 < 9; i1 = i1 + 1) {
 
	if (r26 > r25 && r26 > r27) {
	    x = x + r26;
	    r12 = r26;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r26 < r25 && r25 > r27) {
	    x = x + r25;
	    r12 = r25;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r26 < r27 && r25 < r27) {
	    x = x + r27;
	    r12 = r27;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r26 == r25 && r25 < r27) {
	    x = x + r27;
	    r12 = r27;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r26 == r25 && r25 > r27) {
	    x = x + r25;
	    r12 = r25;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r26 == r27 && r25 < r26) {
	    x = x + r26;
	    r12 = r26;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r26 == r27 && r25 > r26) {
	    x = x + r25;
	    r12 = r25;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r25 == r27 && r25 > r26) {
	    x = x + r25;
	    r12 = r25;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
 
	if (r25 == r27 && r25 < r26) {
	    x = x + r26;
	    r12 = r26;
	    r25 = 0;
	    r26 = 0;
	    r27 = 0;
	    i1 = 10;
	}
    }
 
    if (r5[2] == r5[4] && r5[2] == r5[8]) {
	x = x + r5[2];
	r12 = r5[2];
    }
 
    if (r5[1] >= r5[0])
	r13 = r5[1];
    else
	r13 = r5[0];
 
    fill(75);
    if (r5[7] >= r13) {		//if height of group4 > group1 and group2 
	//draw a big rectangle below group1 and group2 
	rect(x - r10 - r12 - r5[3], y + r13 - r11, r12 + r5[3], r5[7] - r13);
    } else {			//draw a rectangle below group4 
	rect(x - r10, y + r5[7] - r11, r5[6], -r5[7] + r13);
    }
    noFill();
 
    if (r5[7] != r13) {
	outerextraspace++;	//increase number of extra spaces by one
    }
}
 
 
 //this function gives the starting point of group5 and draws extra space 
 //parallel to group5 because of the diff in height of group1, group2 and group4
void extra1_5(int p1, int p2)
{
 
    float r14 = 0, r15 = 0, r16 = 0, r17 = 0, r28 = 0, r29 = 0, r30 = 0;
  
    for (int i1 = p1; i1 < no_rects; i1 = i1 + 4) {
	y = y + height[members_grp[k3][i1]];
	r15 = r15 + height[members_grp[k3][i1]];
    }
 
    for (int i1 = p2; i1 < no_rects; i1 = i1 + 4) {
	x = x + length[members_grp[k3][i1]];
	r14 = r14 + length[members_grp[k3][i1]];
    }
 
    r28 = r5[0];
    r29 = r5[1];
    r30 = r5[7];
 
    //calculation for getting starting point of extra space
    for (int i1 = 0; i1 < 9; i1 = i1 + 1) {
	if (r29 > r28 && r29 > r30) {
	    r17 = r29;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r28 > r29 && r28 > r30) {
	    r17 = r28;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r29 < r30 && r28 < r30) {
	    r17 = r30;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r29 == r30 && r28 < r30) {
	    r17 = r30;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r29 == r30 && r28 > r30) {
	    r17 = r28;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r29 == r28 && r28 < r30) {
	    r17 = r30;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r29 == r28 && r28 > r30) {
	    r17 = r28;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r28 == r30 && r29 < r30) {
	    r17 = r30;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
 
	if (r28 == r30 && r29 > r30) {
	    r17 = r29;
	    y = y + r17;
	    r28 = 0;
	    r29 = 0;
	    r30 = 0;
	    i1 = 10;
	}
    }
 
    if (r5[1] == r5[7] && r5[0] == r5[7]) {
	r17 = r5[7];
	y = y + r17;
    }
 
    if (r5[4] > r5[2]) {
	r16 = r5[4];
    }
 
    if (r5[4] <= r5[2]) {
	r16 = r5[2];
    }
 
    if (r5[8] < r16) {		//if length of group5 is smaller than group1 and group3 
	//draws a rectangle below group 1 parallel to group5 
	fill(75);
	rect(x - r14 + r5[8], y - r15, r16 - r5[8], r5[9]);
	noFill();
	outerextraspace++;	//increase number of extra space by one
    }
}
 
//variables 
int x1 = 1, x2 = 1;
 
//this function draws any group when spiral 1 is used 
void shape1_2()
{
 
    //this prints number of every first rectangle of any group
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 8), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws frist rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
	//this prints number of every second rectangle of any group
 
	PFont myFont1 = createFont("Times", 16);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x + (length[members_grp[k3][1]] / 4), y + 5 - (height[members_grp[k3][1]] / 2));
	noFill();
 
	//this is to draw 2nd rectangle of any group
	if (length[members_grp[k3][1]] < length[members_grp[k3][0]]) {	//if length of 2nd rectangle < 1st rectangle
	    rect(x, y - height[members_grp[k3][1]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //draws second rectangle of any group
	    fill(250);
	    rect(x + length[members_grp[k3][1]], y - height[members_grp[k3][1]], A_original[0], height[members_grp[k3][1]]);
	    //draws a rectangle above first rectangle of length A_original[0] and height of 2nd rectangle
	    noFill();
	} else {
	    rect(x, y - height[members_grp[k3][1]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][0]], y, A_original[0], height[members_grp[k3][0]]);
	    //draws a rectangle below second rectangle of length A_original[0] and height of 1st rectangle
	    noFill();
	}
 
 
	if (length[members_grp[k3][1]] != length[members_grp[k3][0]]) {
	    innerextraspace++; //increase number of extra spaces by one
	}			
    }
 
    H_frame[0] = height[members_grp[k3][0]];
    //it saves height of first rectangle as H_frame[0]
 
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	//bigger length among first and second rectangle is saved as L_frame[0]
	L_frame[0] = length[members_grp[k3][1]];
    } else {
	L_frame[0] = length[members_grp[k3][0]];
    }
 
    y = y - height[members_grp[k3][1]];	//getting starting point of next member
    int j = 1;
    x1 = 1; x2 = 1;
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
 
	if (j % 4 == 1) {	// it draws 3rd, 7th, 11th and so on rectangles
 
	    x = x + L_frame[x1 - 1];
	    //getting starting point of the space to be drawn
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    //height of rectangular frame just obtained above
	    x2++;
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		//draws rectangle of height H_frame[] and length of given rectangle.
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;	//increase number of extra space by one
	    }
	    //it prints space number of 3rd, 7th, 11th and so on rectangles
	    PFont myFont2 = createFont("Times", 16);
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 5 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (height[members_grp[k3][i1]] > (H_frame[x2 - 1])) {
		fill(250);
		//if height of this rectangle is greater than height of rectangular frame calculated above then 
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		//it draws a rectangle just below to 2nd last rectangle
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		//if height of this rectangle is greater than sum of heights calculated above
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
		//then it save height of this rectangle as height of rectangular frame calculated above
	    }
 
	}
 
	if (j % 4 == 2) {	//draws 4th, 8th, 12th and so on rectangles
 
	    y = y + H_frame[x2 - 1];
	    x = x - L_frame[x1 - 1];
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		//it draws a rectangle of length L_frame[] and height of given rectangle
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;	//increase number of extra space by one
	    }
	    //it prints number to 4th or 8th or 12th or so on rectangles
	    PFont myFont3 = createFont("Times", 16);
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - H_frame[x2 - 1], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		//it draws a rectangle just parallel to last rectangle
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    //save length of this rectangle as sum of lengths calculated above
	}
 
 
	if (j % 4 == 3) {	//draws 5th, 9th, 13th and so on rectangles
 
	    x = x - length[members_grp[k3][i1]];
	    y = y - H_frame[x2 - 1];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < H_frame[x2 - 1]) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != H_frame[x2 - 1]) {
		innerextraspace++;
	    }
 
	    PFont myFont4 = createFont("Times", 16);	//it prints number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);	//it draws 5th or 9th or 13th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {	//draws 6th, 10th, 14th and so on rectangles
 
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
	    y = y - height[members_grp[k3][i1]];
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }
 
	    PFont myFont5 = createFont("Times", 16);	//this prints number to 6th or 10th or 14th or so on rectangles 
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);	//this draws 6th or 10th or 14th or so on rectangles 
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
//this function draws any group when spiral 2 is used  
void shape2_2()
{
 
    //this prints number of every first rectangle of any group
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 4), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws first rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 14);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x + (length[members_grp[k3][1]] / 3), y + height[members_grp[k3][1]] / 2 + height[members_grp[k3][0]]);
	noFill();
 
	//this is to draw 2nd rectangle of any group
 
	if (length[members_grp[k3][1]] < length[members_grp[k3][0]]) {
	    //if length of second rectangle is smaller than first rectangle
 
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][1]], y + height[members_grp[k3][0]], A_original[0], height[members_grp[k3][1]]);
	    //it draws a rectangle above first rectangle of length A_original[0] and height of 2nd rectangle
	    noFill();
	} else {
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][0]], y, A_original[0], height[members_grp[k3][0]]);
	    //it draws a rectangle below second rectangle of A_original[0] and height of 1st rectangle
	    noFill();
	}
 
 
	if (length[members_grp[k3][1]] != length[members_grp[k3][0]]) {
	    innerextraspace++;
	}			//increase number of extra spaces by one
 
    }
 
    H_frame[0] = height[members_grp[k3][0]];	//it saves height of first rectangle as H_frame[0]
 
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	//bigger length among first and second rectangle is saved as L_frame[0]
	L_frame[0] = length[members_grp[k3][1]];
    } else {
	L_frame[0] = length[members_grp[k3][0]];
    }
 
    int j = 1;
    x1 = 1; x2 = 1;
 
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
	if (j % 4 == 1) {
 
	    x = x - length[members_grp[k3][i1]];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    PFont myFont2 = createFont("Times", 16);	//it prints number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 5 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);	// it draws 3rd, 7th, 11th and so on rectangle
 
	    if (height[members_grp[k3][i1]] > (H_frame[x2 - 1])) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		//it draws a rectangle i.e. extra space just below to 2nd last rectangle
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];	//if height of this rectangle is greater than sum of heights calculated above 
		//then it save height of this rectangle as sum of heights calculated above
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    y = y - height[members_grp[k3][i1]];
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);	//it draws 4th or 8th or 12th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		//it draws a rectangle just parallel to last rectangle
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
 
	}
 
	if (j % 4 == 3) {
 
	    x = x + L_frame[x1 - 1];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);	//it draws 5th or 9th or 13th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		//it draws a rectangle just below to last rectangle
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    y = y + H_frame[x2 - 1];
	    x = x - L_frame[x1 - 1];
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont5 = createFont("Times", 16);
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);	//this draws 6th or 10th or 14th or so on rectangles 
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - H_frame[x2 - 1], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		//it draws a rectangle just parallel to 2nd and 3rd last rectangles 
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
void shape3_2()
{

    //this print number of every first rectangle of any group 
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 4), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws first rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 14);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x + length[members_grp[k3][0]] + (length[members_grp[k3][1]] / 3), y + (height[members_grp[k3][1]] / 2));
	noFill();
 
	//this is to draw 2nd rectangle of any group
	if (height[members_grp[k3][1]] < height[members_grp[k3][0]]) {
 
	    rect(x + length[members_grp[k3][0]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][0]], y + height[members_grp[k3][1]], length[members_grp[k3][1]], A_original[0]);
	    noFill();
	}
 
	else {
 
	    rect(x + length[members_grp[k3][0]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group
	    fill(250);
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][0]], A_original[0]);
	    noFill();
	}
 
 
	if (height[members_grp[k3][1]] != height[members_grp[k3][0]]) {
	    innerextraspace++;
	}
 
    }
 
    L_frame[0] = length[members_grp[k3][0]];
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	H_frame[0] = height[members_grp[k3][1]];
    } else {
	H_frame[0] = height[members_grp[k3][0]];
    }
 
    x = x + L_frame[0];
    int j = 1;
    x1 = 1; x2 = 1;
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
 
	if (j % 4 == 1) {
 
	    x = x - L_frame[x1 - 1];
	    y = y + H_frame[x2 - 1];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    PFont myFont2 = createFont("Times", 16);
	    //it print number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 5 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (length[members_grp[k3][i1]] > (L_frame[x1 - 1])) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - H_frame[x2 - 1], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    y = y - H_frame[x2 - 1];
	    x = x - length[members_grp[k3][i1]];
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    //it gives number to 4th or 8th or 12th or so on rectangles
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	if (j % 4 == 3) {
	    y = y - height[members_grp[k3][i1]];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    //it prints number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 5th or 9th or 13th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
	    x = x + L_frame[x1 - 1];
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont5 = createFont("Times", 16);
	    //this gives number to 6th or 10th or 14th or so on rectangles 
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //this draws 6th or 10th or 14th or so on rectangles 
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
//it draws any group when spiral 4 is used 
void shape4_2()
{

    //this print number of every first rectangle of any group
 
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 4), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws frist rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 14);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x - length[members_grp[k3][1]]
	     + (length[members_grp[k3][1]] / 3), y + (height[members_grp[k3][1]] / 2));
	noFill();
 
 
	//this is to draw 2nd rectangle of any group
	if (height[members_grp[k3][1]] < height[members_grp[k3][0]]) {
 
	    rect(x - length[members_grp[k3][1]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x - length[members_grp[k3][1]], y + height[members_grp[k3][1]], length[members_grp[k3][1]], A_original[0]);
	    noFill();
	} else {
 
	    rect(x - length[members_grp[k3][1]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][0]], A_original[0]);
	    noFill();
	}
	if (height[members_grp[k3][1]] != height[members_grp[k3][0]]) {
	    innerextraspace++;
	}			//increase number of extra space by one
    }
 
    L_frame[0] = length[members_grp[k3][0]];
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	H_frame[0] = height[members_grp[k3][1]];
    } else {
	H_frame[0] = height[members_grp[k3][0]];
    }
 
    int j = 1;
    x1 = 1;
    x2 = 1;
    x = x - length[members_grp[k3][1]];
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
 
	if (j % 4 == 1) {
 
	    y = y - height[members_grp[k3][i1]];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
 
	    PFont myFont2 = createFont("Times", 16);
	    //it print number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + (height[members_grp[k3][i1]] / 2));
	    noFill();
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (length[members_grp[k3][i1]] > (L_frame[x1 - 1])) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    x = x + L_frame[x1 - 1];
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    //it prints number to 4th or 8th or 12th or so on rectangles
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	if (j % 4 == 3) {
 
	    y = y + H_frame[x2 - 1];
	    x = x - L_frame[x1 - 1];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    //it prints number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 5th or 9th or 13th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - (H_frame[x2 - 1]), length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    y = y - H_frame[x2 - 1];
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
	    x = x - length[members_grp[k3][i1]];
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont5 = createFont("Times", 16);
	    //this prints number to 6th or 10th or 14th or so on rectangles 
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //this draws 6th or 10th or 14th or so on rectangles 
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
//it draws any group when spiral 5 is used  
void shape5_2()
{

    //this print number of every first rectangle of any group
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 8), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws frist rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
 
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 16);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x + (length[members_grp[k3][1]] / 4), y + height[members_grp[k3][0]] + (height[members_grp[k3][1]] / 2));
	noFill();
 
	//this is to draw 2nd rectangle of any group
	if (length[members_grp[k3][1]] < length[members_grp[k3][0]]) {
 
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][1]], y + height[members_grp[k3][0]], A_original[0], height[members_grp[k3][1]]);
	    noFill();
	} else {
 
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][0]], y, A_original[0], height[members_grp[k3][0]]);
	    noFill();
	}
 
	if (length[members_grp[k3][1]] != length[members_grp[k3][0]]) {
	    innerextraspace++;
	}			//increase number of extra spaces by one
    }
 
    H_frame[0] = height[members_grp[k3][0]];
    //it saves height of first rectangle as H_frame[0]
 
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	L_frame[0] = length[members_grp[k3][1]];
    } else {
	L_frame[0] = length[members_grp[k3][0]];
    }
 
    y = y + H_frame[0];
    int j = 1;
    x1 = 1;
    x2 = 1;
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
	if (j % 4 == 1) {
	    y = y - H_frame[x2 - 1];
	    x = x + L_frame[x1 - 1];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
 
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    PFont myFont2 = createFont("Times", 16);
	    //it print number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 5 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (height[members_grp[k3][i1]] > (H_frame[x2 - 1])) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 2) {
	    y = y - height[members_grp[k3][i1]];
	    x = x - L_frame[x1 - 1];
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    //it prints number to 4th or 8th or 12th or so on rectangles
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	}
 
 
	if (j % 4 == 3) {
 
	    x = x - length[members_grp[k3][i1]];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < H_frame[x2 - 1]) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    //it prints number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 5th or 9th or 13th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
	    y = y + H_frame[x2 - 1];
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont5 = createFont("Times", 16);
	    //this prints number to 6th or 10th or 14th or so on rectangles 
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //this draws 6th or 10th or 14th or so on rectangles 
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - H_frame[x2 - 1], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
 //it draws any group when spiral 6 is used 
void shape6_2()
{

    //this print number of every first rectangle of any group
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 4), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws frist rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
 
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 14);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x + (length[members_grp[k3][1]] / 3), y - height[members_grp[k3][1]] / 2);
	noFill();
 
	//this is to draw 2nd rectangle of any group 
	if (length[members_grp[k3][1]] < length[members_grp[k3][0]]) {
 
	    rect(x, y - height[members_grp[k3][1]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][1]], y - height[members_grp[k3][1]], A_original[0], height[members_grp[k3][1]]);
	    noFill();
	} else {
 
	    rect(x, y - height[members_grp[k3][1]], length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][0]], y, A_original[0], height[members_grp[k3][0]]);
	    noFill();
	}
 
	if (length[members_grp[k3][1]] != length[members_grp[k3][0]]) {
	    innerextraspace++;
	}			//increase number of extra spaces by one
    }
 
    H_frame[0] = height[members_grp[k3][0]];
    //it saves height of first rectangle as H_frame[0]
 
    if (length[members_grp[k3][1]] > length[members_grp[k3][0]]) {
	L_frame[0] = length[members_grp[k3][1]];
    } else {
	L_frame[0] = length[members_grp[k3][0]];
    }
 
    y = y - height[members_grp[k3][1]];
    int j = 1;
    x1 = 1;
    x2 = 1;
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
	if (j % 4 == 1) {
 
	    x = x - length[members_grp[k3][i1]];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    PFont myFont2 = createFont("Times", 16);
	    //it print number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 5 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (height[members_grp[k3][i1]] > (H_frame[x2 - 1])) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    y = y + H_frame[x2 - 1];
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    //it prints number to 4th or 8th or 12th or so on rectangles
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - H_frame[x2 - 1], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
 
	}
 
	if (j % 4 == 3) {
 
	    x = x + L_frame[x1 - 1];
	    y = y - H_frame[x2 - 1];
	    H_frame[x2] = (height[members_grp[k3][i1 - 1]] + H_frame[x2 - 1]);
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    //it prints number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 5th or 9th or 13th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    y = y - height[members_grp[k3][i1]];
	    x = x - L_frame[x1 - 1];
	    L_frame[x1] = L_frame[x1 - 1] + length[members_grp[k3][i1 - 1]];
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont5 = createFont("Times", 16);
	    //this prints number to 6th or 10th or 14th or so on rectangles 
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //this draws 6th or 10th or 14th or so on rectangles 
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1])
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
 
 //it draws any group when spiral 7 is used 
void shape7_2()
{  
    //this print number of every first rectangle of any group
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 4), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws frist rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 14);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x - (length[members_grp[k3][1]] / 2), y + (height[members_grp[k3][1]] / 2));
	noFill();
 
	//this is to draw 2nd rectangle of any group
 
	if (height[members_grp[k3][1]] < height[members_grp[k3][0]]) {
 
	    rect(x - length[members_grp[k3][1]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x - length[members_grp[k3][1]], y + height[members_grp[k3][1]], length[members_grp[k3][1]], A_original[0]);
	    noFill();
	}
 
	else {
 
	    rect(x - length[members_grp[k3][1]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][0]], A_original[0]);
	    noFill();
	}
	if (height[members_grp[k3][1]] != height[members_grp[k3][0]]) {
	    innerextraspace++;
	}			//increase number of extra space by one
    }
 
    L_frame[0] = length[members_grp[k3][0]];
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	H_frame[0] = height[members_grp[k3][1]];
    } else {
	H_frame[0] = height[members_grp[k3][0]];
    }
 
    x = x - length[members_grp[k3][1]];
    int j = 1;
    x1 = 1;
    x2 = 1;
 
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
 
	if (j % 4 == 1) {
 
 
	    y = y + H_frame[x2 - 1];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    PFont myFont2 = createFont("Times", 16);
	    //it print number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 5 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (length[members_grp[k3][i1]] > (L_frame[x1 - 1])) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - H_frame[x2 - 1], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    y = y - H_frame[x2 - 1];
	    x = x + L_frame[x1 - 1];
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    //it prints number to 4th or 8th or 12th or so on rectangles
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	if (j % 4 == 3) {
	    y = y - height[members_grp[k3][i1]];
	    x = x - L_frame[x1 - 1];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    //it prints number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 5th or 9th or 13th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
	    x = x - length[members_grp[k3][i1]];
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    //this prints number to 6th or 10th or 14th or so on rectangles 
	    PFont myFont5 = createFont("Times", 16);
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //this draws 6th or 10th or 14th or so on rectangles 
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}
 
 //it draws any group when spiral 8 is used 
void shape8_2()
{
    //this print number of every first rectangle of any group 
    PFont myFont = createFont("Times", 12);
    textFont(myFont);
    fill(255, 0, 0);
    text(rectangles[members_grp1[k3][0]], x + (length[members_grp[k3][0]] / 4), y + 8 + (height[members_grp[k3][0]] / 2));
    noFill();
 
    //this draws frist rectangle of any group
    rect(x, y, length[members_grp[k3][0]], height[members_grp[k3][0]]);
 
    if (no_rects > 1) {
	//this print number of every second rectangle of any group
	PFont myFont1 = createFont("Times", 14);
	textFont(myFont1);
	fill(110, 5, 110);
	text(rectangles[members_grp1[k3][1]], x + length[members_grp[k3][0]] + (length[members_grp[k3][1]] / 3), y + (height[members_grp[k3][1]] / 2));
	noFill();
 
	//this is to draw 2nd rectangle of any group
 
	if (height[members_grp[k3][1]] < height[members_grp[k3][0]]) {
 
	    rect(x + length[members_grp[k3][0]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x + length[members_grp[k3][0]], y + height[members_grp[k3][1]], length[members_grp[k3][1]], A_original[0]);
	    noFill();
	} else {
 
	    rect(x + length[members_grp[k3][0]], y, length[members_grp[k3][1]], height[members_grp[k3][1]]);
	    //this draws second rectangle of any group 
	    fill(250);
	    rect(x, y + height[members_grp[k3][0]], length[members_grp[k3][0]], A_original[0]);
	    noFill();
	}
 
	if (height[members_grp[k3][1]] != height[members_grp[k3][0]]) {
	    innerextraspace++;
	}			//increase number of extra space by one
    }
 
    L_frame[0] = length[members_grp[k3][0]];
 
    if (height[members_grp[k3][1]] > height[members_grp[k3][0]]) {
	H_frame[0] = height[members_grp[k3][1]];
    } else {
	H_frame[0] = height[members_grp[k3][0]];
    }
 
    int j = 1;
    x1 = 1;
    x2 = 1;
    x = x + L_frame[0];
 
    for (int i1 = 2; i1 < no_rects; i1 = i1 + 1) {
 
	if (j % 4 == 1) {
	    x = x - L_frame[x1 - 1];
	    y = y - height[members_grp[k3][i1]];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    PFont myFont2 = createFont("Times", 16);
	    //it print number of 3rd, 7th, 11th and so on rectangles 
	    textFont(myFont2);
	    fill(1, 1, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + (height[members_grp[k3][i1]] / 2));
	    noFill();
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    // it draws 3rd, 7th, 11th and so on rectangle
 
	    if (length[members_grp[k3][i1]] > (L_frame[x1 - 1])) {
		fill(250);
		rect(x + L_frame[x1 - 1], y + height[members_grp[k3][i1]], length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 2) {
 
	    x = x - length[members_grp[k3][i1]];
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont3 = createFont("Times", 16);
	    //it gives number to 4th or 8th or 12th or so on rectangles
	    textFont(myFont3);
	    fill(253, 128, 10);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 4th or 8th or 12th or so on rectangles
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x + length[members_grp[k3][i1]], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	if (j % 4 == 3) {
 
	    y = y + H_frame[x2 - 1];
	    L_frame[x1] = (length[members_grp[k3][i1 - 1]] + L_frame[x1 - 1]);
	    x1++;
 
 
	    if (length[members_grp[k3][i1]] < L_frame[x1 - 1]) {
		rect(x, y, L_frame[x1 - 1], height[members_grp[k3][i1]]);
		fill(250);
		rect(x + length[members_grp[k3][i1]], y, L_frame[x1 - 1] - length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] != L_frame[x1 - 1]) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont4 = createFont("Times", 16);
	    //it gives number to 5th or 9th or 13th or so on rectangles 
	    textFont(myFont4);
	    fill(25, 128, 250);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //it draws 5th or 9th or 13th or so on rectangles
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		fill(250);
		rect(x + L_frame[x1 - 1], y - (H_frame[x2 - 1]), length[members_grp[k3][i1]] - L_frame[x1 - 1], H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (length[members_grp[k3][i1]] > L_frame[x1 - 1]) {
		L_frame[x1 - 1] = length[members_grp[k3][i1]];
	    }
 
	}
 
	if (j % 4 == 0) {
 
	    y = y - H_frame[x2 - 1];
	    x = x + L_frame[x1 - 1];
	    H_frame[x2] = H_frame[x2 - 1] + height[members_grp[k3][i1 - 1]];
	    x2++;
	    x = x - length[members_grp[k3][i1]];
 
 
	    if (height[members_grp[k3][i1]] < (H_frame[x2 - 1])) {
		rect(x, y, length[members_grp[k3][i1]], H_frame[x2 - 1]);
		fill(250);
		rect(x, y + height[members_grp[k3][i1]], length[members_grp[k3][i1]], H_frame[x2 - 1] - height[members_grp[k3][i1]]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] != (H_frame[x2 - 1])) {
		innerextraspace++;
	    }			//increase number of extra space by one
 
	    PFont myFont5 = createFont("Times", 16);
	    //this prints number to 6th or 10th or 14th or so on rectangles 
	    textFont(myFont5);
	    fill(25, 228, 50);
	    text(rectangles[members_grp1[k3][i1]], x + (length[members_grp[k3][i1]] / 3), y + 10 + (height[members_grp[k3][i1]] / 3));
	    noFill();
 
	    rect(x, y, length[members_grp[k3][i1]], height[members_grp[k3][i1]]);
	    //this draws 6th or 10th or 14th or so on rectangles 
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1]) {
		fill(250);
		rect(x - L_frame[x1 - 1], y + H_frame[x2 - 1], L_frame[x1 - 1], height[members_grp[k3][i1]] - H_frame[x2 - 1]);
		noFill();
	    }
 
	    if (height[members_grp[k3][i1]] > H_frame[x2 - 1])
		H_frame[x2 - 1] = height[members_grp[k3][i1]];
	}
 
	j++;
    }
 
}

