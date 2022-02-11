import std.stdio, std.algorithm, std.array;

int[] lanternfishs = [1,4,1,1,1,1,5,1,1,5,1,4,2,5,1,2,3,1,1,1,1,5,4,2,1,1,3,1,1,1,1,1,1,1,2,1,1,1,1,1,5,1,1,1,1,1,1,1,1,1,4,1,1,1,1,5,1,4,1,1,4,1,1,1,1,4,1,1,5,5,1,1,1,4,1,1,1,1,1,3,2,1,1,1,1,1,2,3,1,1,2,1,1,1,3,1,1,1,2,1,2,1,1,2,1,1,3,1,1,1,3,3,5,1,4,1,1,5,1,1,4,1,5,3,3,5,1,1,1,4,1,1,1,1,1,1,5,5,1,1,4,1,2,1,1,1,1,2,2,2,1,1,2,2,4,1,1,1,1,3,1,2,3,4,1,1,1,4,4,1,1,1,1,1,1,1,4,2,5,2,1,1,4,1,1,5,1,1,5,1,5,5,1,3,5,1,1,5,1,1,2,2,1,1,1,1,1,1,1,4,3,1,1,4,1,4,1,1,1,1,4,1,4,4,4,3,1,1,3,2,1,1,1,1,1,1,1,4,1,3,1,1,1,1,1,1,1,5,2,4,2,1,4,4,1,5,1,1,3,1,3,1,1,1,1,1,4,2,3,2,1,1,2,1,5,2,1,1,4,1,4,1,1,1,4,4,1,1,1,1,1,1,4,1,1,1,2,1,1,2];
int days = 256;
ulong[int] fishassoc;


void countFishByArr(){
	int ndays=1;
	while(ndays<=days){
		int j=0;
		foreach(ref f;lanternfishs){
			if(f==0){
				f = 6;
				j++;
			}else{
				f--;
			}
		}
		while(j>0){
			lanternfishs ~= 8;
			j--;
		}
		writefln("day%d lanternfishs are: %s", ndays, lanternfishs);	
		ndays++;
	}
	writeln("the final lantern fish list is: ", lanternfishs);
	writefln("there are %d lanternfish now...", lanternfishs.length);
}

void setupFishAa(){
	foreach(f;lanternfishs){
		fishassoc[f]++;
	}
	writeln("setup done, fish base assocArray is ", fishassoc);
}
/*
[4:1, 3:2, 2:1, 1:1]
[3:1, 2:2, 1:1, 0:1]
[2:1, 1:2, 0:1, 6:1, 8:1]
[1:1, 0:2, 6:1, 5:1, 7:1, 8:1]
*/
void countFishByAssoc(){
	int ndays=1;
	while(ndays<=days){
		ulong[int] tempFA;
		foreach(k,v;fishassoc){
			//writeln("day ", ndays, " key is: ", k, " and value is: ", v);
			if(k==0){
				tempFA.remove(0);
				tempFA[6] += v;
				tempFA[8] = v;
			}else{
				tempFA[k-1] += fishassoc[k];
			}
			//writeln("day ", ndays, " temp is: ", tempFA);
		}
		fishassoc = tempFA;
		//writefln("day%d two fish assocArray is: %s", ndays, fishassoc);
		ndays++;
	}
	writefln("day%d the lanternfishs are: %s, and the total lanterfish is: %s", ndays, fishassoc, fishassoc.values.sum);
}

void main()
{
	//countFishByArr();
	setupFishAa();
	countFishByAssoc();	
}
