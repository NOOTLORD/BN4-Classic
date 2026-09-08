//=============================================================================
// X8 knife primary.
//
// Slicing.
//=============================================================================
class X8PrimaryFire extends BallisticMeleeFire;

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
     SwipePoints(0)=(offset=(Pitch=2000,Yaw=4000))
     SwipePoints(1)=(offset=(Pitch=1000))
     SwipePoints(3)=(offset=(Pitch=1000,Yaw=-2000))
     SwipePoints(4)=(offset=(Pitch=2000,Yaw=-4000))
     SwipePoints(5)=(Weight=-1)
     SwipePoints(6)=(Weight=-1)
     TraceRange=(Min=130.000000,Max=130.000000)
     KickForce=100
     bAISilent=True
     AmmoClass=Class'BWBP_SKC_Pro.Ammo_X8Knife'
     AmmoPerFire=0
}