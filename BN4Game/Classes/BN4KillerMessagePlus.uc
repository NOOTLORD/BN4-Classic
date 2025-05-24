class BN4KillerMessagePlus extends LocalMessage;

var(Message) localized string YouKilled;
var(Message) localized string YouKilledTrailer;

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	if (RelatedPRI_1 == None)
		return "";
	if (RelatedPRI_2 == None)
		return "";

	if (RelatedPRI_2.PlayerName != "")
		return Default.YouKilled@RelatedPRI_2.PlayerName@Default.YouKilledTrailer;
}

defaultproperties
{
     YouKilled="Killed"
     bIsUnique=True
     bFadeMessage=True
     Lifetime=2	 
     DrawColor=(G=160,R=0)
     StackMode=SM_Down
	 PosX=0.500000
     PosY=0.625000
     FontSize=0	
}
