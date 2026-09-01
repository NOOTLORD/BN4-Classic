//=============================================================================
// DTMJ51AssaultHead.
//
// DamageType for MJ51 headshots
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTMJ51AssaultHead extends DT_BWBulletHead;

defaultproperties
{
    WeaponClass=Class'MJ51Carbine'
    DeathString="%o got %vh brain shredded by %k's MJ51."
    FemaleSuicide="%o saw a bullet coming up the barrel of her MJ51."
    MaleSuicide="%o saw a bullet coming up the barrel of his MJ51."
    bFastInstantHit=true
    PawnDamageSounds(0)=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
    GibPerterbation=0.2000000
    KDamageImpulse=1000.0000000
    VehicleDamageScaling=0.6500000
}