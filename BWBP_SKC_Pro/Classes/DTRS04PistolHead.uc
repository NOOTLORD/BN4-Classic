//=============================================================================
// DTGRSXXPistolHead.
//
// Damage type for m10111242 Pistol headshots
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class DTRS04PistolHead extends DT_BWBulletHead;

defaultproperties
{
     DeathStrings(0)="%o was force fed %k's RS04 bullets."
     DeathStrings(1)="%k's lodged some RS04 bullets in %o's head."
     DeathStrings(2)="%o took %k's RS04 round right in the eye."
     DeathStrings(3)="%k removed %o's head with a .45 RS04 bullet."
     WeaponClass=Class'BWBP_SKC_Pro.RS04Pistol'
     DeathString="%o was force fed %k's RS04 bullets."
     FemaleSuicide="%o somehow shot herself."
     MaleSuicide="%o managed to shoot himself."
}