//=============================================================================
// DTAH250PistolHead.
//
// Damage type for the AH250 Pistol headshots
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTAH250PistolHead extends DT_BWBulletHead;

defaultproperties
{
     DeathStrings(0)="%k blasted away at %o's skull with %kh AH250."
     DeathStrings(1)="%k shot out %o's eye with %kh AH250."
     DeathStrings(2)="%o swallowed %k's AH250 Eagle round whole."
     DeathStrings(3)="%k gave a new meaning of 'Eagle Eye' to %o."
     DamageIdent="Pistol"
     WeaponClass=Class'BWBP_SKC_Pro.AH250Pistol'
     DeathString="%k blasted away at %o's skull with %kh AH250."
     FemaleSuicide="%o killed herself with the AH250."
     MaleSuicide="%o killed himself with the AH250."
     VehicleDamageScaling=0.150000
}