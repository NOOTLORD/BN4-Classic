//=============================================================================
// DTAM67PistolHead.
//
// Damage type for the AM67 Pistol headshots
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTAM67PistolHead extends DT_BWBulletHead;

defaultproperties
{
     DeathStrings(0)="%o's skull was shattered by %k's AM67."
     DeathStrings(1)="%k denounced %o's head with AM67 rounds."
     DeathStrings(2)="%o's head was negotiated off by %k's AM67."
     DamageIdent="Pistol"
     WeaponClass=Class'BallisticProV55.AM67Pistol'
     DeathString="%k blew %o's head off with %kh AM67."
     FemaleSuicide="%o blew her head off with the AM67."
     MaleSuicide="%o blew his head off with the AM67."
}