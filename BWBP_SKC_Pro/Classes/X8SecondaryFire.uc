//=============================================================================
// X8 secondary fire.
//
// Launches a ballistic knife.
//=============================================================================
class X8SecondaryFire extends BallisticProjectileFire;

defaultproperties
{
     SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
     MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
     BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Radius=32.000000,batten=false)
     bAISilent=True
     bFireOnRelease=True
     bWaitForRelease=True
     AmmoClass=Class'BWBP_SKC_Pro.Ammo_X8Knife'
}