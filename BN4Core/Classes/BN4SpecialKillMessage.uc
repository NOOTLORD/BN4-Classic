class BN4SpecialKillMessage extends LocalMessage;

var(Messages)	localized string 	DecapitationString;

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	return Default.DecapitationString;
}

static simulated function ClientReceive( 
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	P.PlayRewardAnnouncement('HeadShot',1);
}

defaultproperties
{
	bFadeMessage=True
	bIsSpecial=True
	bIsUnique=True
	Lifetime=2
	bBeep=False
    DrawColor=(R=255,G=0,B=0,A=255)
	DecapitationString="Headshot"
	StackMode=SM_Down
	PosX=0.500000
    PosY=0.600000
	FontSize=0
}