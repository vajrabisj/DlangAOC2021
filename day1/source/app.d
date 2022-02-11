import std.stdio;
import std.string;
import std.range;
import std.range.primitives;
import std.algorithm.iteration;
import std.algorithm.mutation;

void main()
{
	File inputfile = File("input.txt","r");
	int[] amt;
	int j,i;
	int[] sumamt,diffamt;
	while(!inputfile.eof()){
		inputfile.readf("%d ", &i);
		amt ~= i;
	}
	writeln("there are ", amt.length, " elements in the array now.");
	writeln("starting to operate on slice now...");
	for(j=0;j<=(amt.length)-3;j++){
		sumamt ~= sum(amt[j..3+j]);
		if(j>1){diffamt ~= sumamt[j-1]-sumamt[j-2];}
	}
	writeln("done, there are ", diffamt.filter!(x=>x>0).walkLength, " posi diff.");
}
