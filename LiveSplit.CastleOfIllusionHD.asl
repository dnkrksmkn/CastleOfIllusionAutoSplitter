state("COI")
{
	int loading : "COI.exe", 0x0065A128, 0xd0, 0x30, 0x20, 0xec, 0x560, 0x6c;
	string25 levelName : "COI.exe", 0x650500, 0x174, 0x518, 0x4, 0x3AC,0x0;
}

start
{
	return old.levelName.StartsWith("Castle of Illusion") && current.levelName == "";
}

reset
{
	return current.levelName == "Castle of Illusion" && old.levelName == "";
}

split
{
	return old.levelName == "" && !old.levelName.StartsWith("Castle of Illusion") && current.levelName != "";
}

isLoading
{
	return current.levelName != "";
}

gameTime
{
}
