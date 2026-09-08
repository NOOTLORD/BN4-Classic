//=============================================================================
// X4SecondaryFire.
//
// Hold fire to draw back the weapon and release to slash out at your opponent.
// Good for sneaking up on enemies and tearing out their various bits and pieces.
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class X4SecondaryFire extends BallisticMeleeFire;

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
     bReleaseFireOnDie=False
     bAISilent=True
     bFireOnRelease=True
     AmmoClass=Class'BallisticProV55.Ammo_X4Knife'
     AmmoPerFire=0
}