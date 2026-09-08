//=============================================================================
// DTX8KnifeLaunchedHead.
//
// Damagetype for launched X8 Knife hitting heads
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTX8KnifeLaunchedHead extends DT_BWBlade;

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	if ( PlayerController(Killer) == None )
		return;

	PlayerController(Killer).ReceiveLocalizedMessage( Class'BN4Core.BN4SpecialKillMessage', 0, Killer.PlayerReplicationInfo, None, None );
	xPRI = xPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	if ( xPRI != None )
	{
		xPRI.headcount++;
		if ( (xPRI.headcount == 15) && (UnrealPlayer(Killer) != None) )
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('HeadHunter',15);
	}
}

defaultproperties
{
     DeathStrings(0)=""
     SimpleKillString="X8 Launched"
     bCanBeBlocked=False
     bHeaddie=True
     bNeverSevers=True
     WeaponClass=Class'BWBP_SKC_Pro.X8Knife'
     DeathString="%k's knife defied all odds to enter %o's eye."
     FemaleSuicide="%o acupunctured her face."
     MaleSuicide="%o acupunctured his face."
     KDamageImpulse=1000.000000
}