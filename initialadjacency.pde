int[] a = new int[100]; // gives first element of initial adjacent pair
int[] b = new int[100]; // gives second element of initial adjacent pair
int p = 0, q = 0; // these variables gives number of initial adjacency pairs

// This function calculates initial adjacency pairs 
// from the given allocation matrix
void initialadjacency()
{
    int adjmat1[][] = new int[20][20]; // initial adjacency matrix
    int[] k = new int[100]; // array to avoid repeatition
    k[0] = 1000; 
    int r1 = 10; // hightest number in allocation matrix
     int t = 0, r=0;
 
    for (int i1 = 0; i1 < 10; i1 = i1 + 1) {
	for (int i = 0; i < n; i = i + 1) {
	    for (int p = 0; p < t; p = p + 1) {
		if (k[p] == i) {
		    r = 0;
		    break;
		} else
		    r = n;
	    }
 
	    if (i == 0 && r1 == 10)
		r = n;
 
	    //obtaining initial adjacency matrix from given allocation matrix
	    for (int j = 0; j < r; j = j + 1) {
		if (adjmat[i][j] == r1) {
		    adjmat1[i][j] = r1;
		    k[t] = i;
		    t++;
		    k[t] = j;
		    t++;
		}
	    }
 
	}
	r1--;
    }
 
//obtaining initial adjacency pairs 
    for (int i = 0; i < n; i = i + 1) {
	for (int j = 0; j < n; j = j + 1) {
	    if (adjmat1[i][j] > 0) {
		a[p] = i;
		p++;
		b[q] = j;
		q++;
	    }
	}
    }
 
}
