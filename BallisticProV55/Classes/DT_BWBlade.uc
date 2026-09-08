//=============================================================================
// DT_BWBlade.
//
// Base damage type that will play some pawn impact sounds for blades
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DT_BWBlade extends BallisticDamageType;

static function DoBloodEffects( vector HitLocation, float Damage, vector Momentum, Pawn Victim, bool bLowDetail )
{
	if (BallisticPawn(Victim) == None)
		super.DoBloodEffects( HitLocation, Damage, Momentum, Victim, bLowDetail );
}

defaultproperties
{
     BloodManagerName="BallisticProV55.BloodMan_Slash"
     bCanBeBlocked=True
     ShieldDamage=50
     bMetallic=True
     DamageIdent="Melee"
     DamageDescription=",Slash,Stab,"
     bInstantHit=True
     PawnDamageSounds(0)=SoundGroup'BW_Core_WeaponSound.Knife.KnifeFlesh'
	InvasionDamageScaling=3.000000
     VehicleDamageScaling=0.250000
     VehicleMomentumScaling=0.000000
     TransientSoundVolume=1.000000
}