//=============================================================================
// DTXK2SMGHead.
//
// Damage type for the XK2 SMG headshots
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DTT9CNHead extends DT_BWBulletHead;

defaultproperties
{
     DeathStrings(0)="%o took a hail of %k's T9CN bullets to the face."
     DeathStrings(1)="%k wiped the smile off %o's face with %kh T9CN."
     DeathStrings(2)="%o lost %vh dopey head to %k's T9CN burst."
     EffectChance=0.500000
     WeaponClass=Class'BWBP_SKC_Pro.T9CNMachinePistol'
     DeathString="%o took a hail of %k's T9CN bullets to the face."
     FemaleSuicide="%o silenced herself."
     MaleSuicide="%o silenced himself."
     bFastInstantHit=True
}