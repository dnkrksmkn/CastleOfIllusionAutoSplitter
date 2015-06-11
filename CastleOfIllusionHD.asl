state("COI")
{
	string25 levelName : "COI.exe", 0x650500, 0x174, 0x518, 0x4, 0x3AC,0x0;
}

start
{
	return old.levelName.StartsWith("Castle of Illusion") && current.levelName == "";
}


split
{
	return old.levelName == "" && current.levelName != "";
}

isLoading
{
	return current.levelName != "";
}

gameTime
{
}
