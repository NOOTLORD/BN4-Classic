//=============================================================================
// EKS43SecondaryFire.
//
// Vertical/Diagonal held swipe for the EKS43. Uses swipe system and is prone
// to headshots because the highest trace that hits an enemy will be used to do
// the damage and check hit area.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class EKS43SecondaryFire extends BallisticMeleeFire;

event ModeDoFire()
{
	if (FRand() > 0.5)
	{
		PreFireAnim = 'PrepHack1';
		FireAnim = 'Hack1';
	}
	else
	{
		PreFireAnim = 'PrepHack2';
		FireAnim = 'Hack2';
	}
	Super.ModeDoFire();
}

simulated function bool HasAmmo()
{
	return true;
}

defaultproperties
{
     SwipePoints(0)=(offset=(Yaw=-1536))
     SwipePoints(1)=(offset=(Yaw=0))
     SwipePoints(2)=(offset=(Yaw=1536))
     WallHitPoint=1
     NumSwipePoints=3
     KickForce=100
     bAISilent=True
     AmmoClass=Class'BallisticProV55.Ammo_Knife'
     AmmoPerFire=0
}