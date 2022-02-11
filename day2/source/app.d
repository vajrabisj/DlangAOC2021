import std.stdio;
import std.string;

void main()
{
	File inputfile = File("input.txt", "r");
	string cmd;
	int steps;
	int[2] coordinates = [0,0];
	while(!inputfile.eof()){
		inputfile.readf("%s %d", &cmd, &steps);
		inputfile.readln(); //read the '\n'
		final switch(cmd){
			case "forward": coordinates[0] += steps; break;
			case "down": coordinates[1] += steps; break;
			case "up": coordinates[1] -= steps; break;
		}
	}
	writeln("the final coordinates is: ", coordinates);
	writeln("so the final result is: ", coordinates[0]*coordinates[1]);
}
