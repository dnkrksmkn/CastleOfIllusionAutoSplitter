state("COI")
{
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
	
	bool newLevel = false;

	int currIndex = timer.CurrentSplitIndex;
	switch( currIndex )
	{
		case 0:
			newLevel = current.levelName != "Castle of Illusion";
			break;
		case 1:
			newLevel = current.levelName != "Enchanted Forest - Act 1";
			break;
		case 2: 
			newLevel = current.levelName != "Enchanted Forest - Act 2";
			break;
		case 3:
			newLevel = current.levelName != "Enchanted Forest - Act 3";
			break;
		case 4:
			newLevel = current.levelName != "Castle of Illusion";
			break;
		case 5:
			newLevel = current.levelName != "Toyland - Act 1";
			break;
		case 6:
			newLevel = current.levelName != "Toyland - Act 2";
			break;
		case 7:
			newLevel = current.levelName != "Toyland - Act 3";
			break;
		case 8:
			newLevel = current.levelName != "Castle of Illusion";
			break;
		case 9:
			newLevel = current.levelName != "The Storm - Act 1";
			break;
		case 10:
			newLevel = current.levelName != "The Storm - Act 2";
			break;
		case 11:
			newLevel = current.levelName != "The Storm - Act 3";
			break;
		case 12:
			newLevel = current.levelName != "Castle of Illusion";
			break;
		case 13:
			newLevel = current.levelName != "The Library - Act 1";
			break;
		case 14:
			newLevel = current.levelName != "The Library - Act 2";
			break;
		case 15:
			newLevel = current.levelName != "The Library - Act 3";
			break;
		case 16:
			newLevel = current.levelName != "Castle of Illusion";
			break;
		case 17:
			newLevel = current.levelName != "The Castle - Act 1";
			break;
		case 18:
			newLevel = current.levelName != "The Castle - Act 2";
			break;
		case 19:
			newLevel = current.levelName != "The Castle - Act 3";
			break;
		case 20:
			newLevel = current.levelName != "Castle of Illusion";
			break;
		case 21:
			newLevel = current.levelName != "Mizrabel's Tower";
			break;
		case 22:
			newLevel = current.levelName != "Mizrabel's Tower - Finale";
			break;
		default:
			break;
	}

	bool isLoadingToLobby = (current.levelName == "Castle of Illusion");
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
