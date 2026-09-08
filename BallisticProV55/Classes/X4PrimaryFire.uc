//=============================================================================
// X4PrimaryFire.
//
// Rapid swinging of the knife. Effective in an insane melee.
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class X4PrimaryFire extends BallisticMeleeFire;

var() Array<name> SliceAnims;
var int SliceAnim;

simulated event ModeDoFire()
{
	FireAnim = SliceAnims[SliceAnim];
	SliceAnim++;
	if (SliceAnim >= SliceAnims.Length)
		SliceAnim = 0;

	Super.ModeDoFire();
}

simulated function bool HasAmmo()
{
	return true;
}

defaultproperties
{
     SliceAnims(0)="Slash1"
     SliceAnims(1)="Slash2"
     SliceAnims(2)="Slash3"
     SliceAnims(3)="Slash4"
     KickForce=100
     bAISilent=True
     AmmoClass=Class'BallisticProV55.Ammo_X4Knife'
     AmmoPerFire=0
}