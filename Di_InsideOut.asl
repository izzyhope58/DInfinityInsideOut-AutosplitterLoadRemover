state("DisneyInfinity3")
{
	int missionComplete : "DisneyInfinity3.exe", 0x01E8A9B8, 0x20C;     //1 during "Mission Complete" message/screen, 0 otherwise
	int janglesStatus : "DisneyInfinity3.exe", 0x01E1CEA0, 0X268;       //1 during Jangles Status Screen, 0 otherwise
	int levelSelectScreen : "DisneyInfinity3.exe", 0x1BADB98;           //2 if on level Select Screen, 0 if not
	int loading : "DisneyInfinity3.exe", 0x1E128FC;                     //1 if loading, 0 if not
}

update
{
	if (timer.CurrentTime.GameTime.GetValueOrDefault().TotalMilliseconds < 300 && current.loading == 1)
	{
		timer.SetGameTime(new TimeSpan(0));
	}
}

start
{
	if (current.loading > old.loading) {
		if (current.levelSelectScreen == 2) {return true;}
	}
}

split
{
	if (current.missionComplete < old.missionComplete) {return true;}
	if (current.janglesStatus < old.janglesStatus) {return true;}
}

isLoading
{
	return (current.loading == 1);
}
