import std.stdio, std.range, std.algorithm, std.string, std.conv, std.array, std.typecons;

struct LineXY{
	char xy;
	int xycord;
	int[] xyi;
}

void main()
{
	int x1,x2,y1,y2;
	LineXY line;
	LineXY[] lines;
	auto inputfile = File("input.txt");
	while(!inputfile.eof()){
		inputfile.readf("%d,%d -> %d,%d", &x1,&y1,&x2,&y2); inputfile.readln();
		if(x1==x2){
			line = LineXY('x',x1,[min(y1,y2),max(y1,y2)]); pragma(msg, typeof(line));
		}else if(y1==y2){
			line = LineXY('y',y1,[min(x1,x2),max(x1,x2)]); pragma(msg, typeof(line));
		}
		lines ~= line;
	}
	writeln(lines);
	int i=0;
	foreach(l;lines){
		writeln(i,": ", l.xy, " of ", l.xycord, " in ", l.xyi, " with length ", (l.xyi[1]-l.xyi[0]));
		i++;
	}
	
}
