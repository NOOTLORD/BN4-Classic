//=============================================================================
// DTMD24PistolHead.
//
// Damage type for the MD24 Pistol headshots
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class DTMD24PistolHead extends DT_BWBulletHead;

defaultproperties
{
     DeathStrings(0)="%o's head was whisked away by %k's MD24 round."
     DeathStrings(1)="%k whipped %o's head off with %kh MD24 pistol."
     DeathStrings(2)="%k's MD24 round cleared away %o's cranium."
     DamageIdent="Pistol"
     WeaponClass=Class'BallisticProV55.MD24Pistol'
     DeathString="%o's head was whisked away by %k's MD24 round."
     FemaleSuicide="%o blew her ugly face off with an MD24."
     MaleSuicide="%o blew his ugly face off with an MD24."
     PawnDamageSounds(0)=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
     VehicleDamageScaling=0.000000
}
