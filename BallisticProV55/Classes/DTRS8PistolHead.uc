//=============================================================================
// DTRS8PistolHead.
//
// Damage type for the RS8 Pistol Headshots
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTRS8PistolHead extends DT_BWBulletHead;

defaultproperties
{
     DeathStrings(0)="%k shut down %o's head with %kh RS8."
     DeathStrings(1)="%o found %vh head being obliterated by %k's 10mm RS8."
     DeathStrings(2)="%o's head was assassinated off by %k's RS8."
     DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.RS8Pistol'
     DeathString="%k shut down %o's head with %kh RS8."
     FemaleSuicide="%o silenced herself."
     MaleSuicide="%o silenced himself."
     bFastInstantHit=True
     VehicleDamageScaling=0.000000
}
