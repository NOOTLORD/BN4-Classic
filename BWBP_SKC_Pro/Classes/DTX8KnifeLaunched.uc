//=============================================================================
// DTX8KnifeLaunched .
//
// Damagetype for HandLaunched X8 Knife
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTX8KnifeLaunched extends DT_BWBlade;

defaultproperties
{
     DeathStrings(0)=""
     SimpleKillString="X8 Launched"
     bCanBeBlocked=False
     bNeverSevers=True
     WeaponClass=Class'BWBP_SKC_Pro.X8Knife'
     DeathString="%k's X8 Ballistic Knife reached out and touched %o."
     FemaleSuicide="%o shot a knife at herself."
     MaleSuicide="%o shot a knife at himself."
     KDamageImpulse=1000.000000
}