module draft.build;

import std.process, std.stdio;


CommandResult build(string directoryPath, BuildOption option = BuildOption.Default)
{
	Config config;
	Script script;
	with(script)
	{
		check();
		compile();
		link();
		deploy();
		clean();
	}
}

	return ret;
}


enum CommandOk = CommandResult(true, [""], 0);

enum ResultFlag
{
	Check,
	Compile,
	Link,
	Deploy,
	Clean,
	Test
}

enum BuildOption
{
	Default,
	CleanExistingDirecory
}

struct CommandResult
{
	bool success;
	string[] output;
	int failCode;
}

struct BuildStepResult
{
}

struct BuildResult
{
	bool success;
	int payload = 0;
	/*
	// TODO define bit position
	void flag(ResultFlag)(bool success)
	{
		auto pos = 0;
		payload |= (success >> pos);
	}
	*/
}

struct Command
{

	string program;
	string[] options;
	string[] args() { return program ~ options;};	
}

BuildStepResult check(Config)
{
	return CommandOk;
}

BuildStepResult compile(Config config, BuildStatus status)
{
	BuildStep step("Compilation", config);
	step.checkEntry()
	// ldc compiler file
	Command listCmd = {program:"ls", options: ["-al"], };
	step.run(listCmd, exepectSuccess());

	// second
	Command cmdUser = {program:"whoami"};
	run(cmdUser);
	//run(Command("ls",["-al"]));
	run({program:"", options: ["-al",""]});
	return CommandOk;
}

CommandResult link(Config, CommandResult compiler)
{
	return CommandOk;
}

CommandResult deploy(Config, CommandResult linker)
{
	return CommandOk;
}

CommandResult clean(Config, CommandResult deployment)
{
	return CommandOk;
}

CommandResult test(Config)
{
	return CommandOk;
}

CommandResult run(Command command)
{
	auto pid = spawnProcess(command.args);
	auto errorCode = wait(pid);
	return CommandResult();
}

/*
 *
 * files:
 * 		app.d
 *
 * 
 * rdmd app.d
 *
 */
