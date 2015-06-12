state("COI")
{
// worked only for me
//	string25 levelName : "COI.exe", 0x650500, 0x174, 0x518, 0x4, 0x3AC,0x0;

	string25 levelName : "COI.exe", 0x649D08, 0x7c, 0x0;
}

start
{
	return old.levelName.StartsWith("Castle of Illusion") && current.levelName == "";
}


split
{
	bool loadingScreen = ( old.levelName == "" && current.levelName != "" ); // The level name is empty except for on the loading screen.
	String currSplitName = timer.CurrentSplit.Name;
	
	bool newLevel = currSplitName != current.levelName;

	if( timer.CurrentSplitIndex > 0 )
	{
		
		newLevel = ( currSplitName != current.levelName );
	}

	bool isLoadingToLobby = (current.levelName == "Castle of Illusion");
	int currIndex = timer.CurrentSplitIndex;
	bool lobbyMeansSplit =  currIndex == 3 || 
				currIndex == 7 ||
				currIndex == 11 ||
				currIndex == 15 ||
				currIndex == 19;

	return loadingScreen && newLevel && (!isLoadingToLobby || lobbyMeansSplit);
}

isLoading
{
	return current.levelName != "";
}

gameTime
{
}
