state("IncPc")
{
    byte loading : "IncPc.exe", 0x35ACF0;                       //0 if loading, 1 if not
	byte level : "IncPc.exe", 0x304AE4;							//# = Level number, 0 for title screen and battle mode
	byte fmv : "binkw32.dll", 0x6521C;							//1 if FMV playing, 0 if not
}

start
{
	if (current.level == 1 & old.level == 0 & current.fmv == 0) {return true;}
	if (current.level == 1 & current.fmv == 0 & old.fmv == 1) {return true;}
}

split
{
    return (current.loading < old.loading);
}

isLoading
{
    return (current.loading == 0);
}