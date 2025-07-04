//=============================================================================
// DT_PS9MDart.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class DT_PS9MDart extends DT_BWBullet;

defaultproperties
{
     DeathStrings(0)="%o was dissolved by %k's PS9m neurotoxin."
     DeathStrings(1)="%k's PS9m neurotoxin ate away at %o ."
     DeathStrings(2)="%o got a dose of neurotoxin from %k's PS9m."
     DeathStrings(3)="%k fulfilled %kh contract on %o."
     DeathStrings(4)="%k assassinated %o with a PS9m."
	EffectChance=0.500000
	DamageIdent="Pistol"
     WeaponClass=Class'BWBP_SKC_Pro.PS9mPistol'
     DeathString="%o was dissolved by %k's PS9m neurotoxin."
     FemaleSuicide="%o took some of her own medicine."
     MaleSuicide="%o took some of his own medicine."
	bFastInstantHit=True
	VehicleDamageScaling=0.100000
	TagMultiplier=0.7
	TagDuration=0.1
}