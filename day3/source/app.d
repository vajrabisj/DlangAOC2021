import std.stdio, std.range, std.algorithm, std.string, std.conv, std.array;


void main()
{
	int n=0;
	auto basestate = File("input.txt").byLineCopy.filter!(l => !l.empty).array;
	writeln("base state is:		", basestate); pragma(msg, typeof(basestate));
	auto bstate = basestate.dup;
	writeln("copied base state is:	", bstate); pragma(msg, typeof(bstate));
	auto tbstate = bstate.transposed;
	writeln("transposed state is:	", tbstate); pragma(msg, typeof(tbstate));
	auto etbstate = tbstate.each.array.sort.group.assocArray;

	/*
	while(n<5){
		auto tbstate = bstate.transposed;
		//writeln("transposed is: ", tbstate);
		int m=0;
		foreach(line;tbstate){
			writeln("in line, n m", n,m);
			while(n==m){
				writeln("n and m", n,m);
				auto sortgroup = line.array.sort.group.assocArray;
				if(sortgroup['1']>sortgroup['0']){
						bstate = bstate.filter!(x=>x[n]=='1').array; writeln("after: ",bstate);
						break;
					}else{
						bstate = bstate.filter!(x=>x[n]=='0').array; writeln("after: ",bstate);
						break;
				}
			}
			m++;
			writeln("line is: ", line);
		}
		n++;	
	}*/
}