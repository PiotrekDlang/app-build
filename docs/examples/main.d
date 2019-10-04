module build;

import draft.script;
import draft.build;

void build()
{
	auto builder = Builder("build.cfg");
	
	builder.check();
	builder.compile();
	//link();
	//deploy();
	//clean();

}


void main(string args)
{
	build();
}



