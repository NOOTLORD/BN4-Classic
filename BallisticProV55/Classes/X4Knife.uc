//=============================================================================
// Modified by (NL)NOOTLORD
// X4Knife.
//
// The X3's stronger brother, an equally lethal larger green handled knife for cutting eared 'fruit'.
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class X4Knife extends BallisticMeleeWeapon;

// choose between regular or alt-fire
function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return 0;

	if (VSize(B.Enemy.Location - Instigator.Location) > FireMode[0].MaxRange()*1.5)
		return 1;
	Result = FRand();
	if (vector(B.Enemy.Rotation) dot Normal(Instigator.Location - B.Enemy.Location) < 0.0)
		Result += 0.3;
	else
		Result -= 0.3;

	if (Result > 0.5)
		return 1;
	return 0;
}

// tells bot whether to charge or back off while using this weapon
function float SuggestAttackStyle()
{
	return 1;
}

// tells bot whether to charge or back off while defending against this weapon
function float SuggestDefenseStyle()
{
	return -1;
}
// End AI Stuff =====

defaultproperties
{
     ItemName="X4"
     BigIconMaterial=Texture'BW_Core_WeaponTex.X4.BigIcon_X4'
     BigIconCoords=(Y2=240)
     IconMaterial=Texture'BW_Core_WeaponTex.X4.SmallIcon_X4'
     IconCoords=(X2=128,Y2=32)
     ManualLines(0)=""
     GunLength=0.000000
     ParamsClasses(0)=Class'X4WeaponParamsComp'
     FireModeClass(0)=Class'BallisticProV55.X4PrimaryFire'
     FireModeClass(1)=Class'BallisticProV55.X4SecondaryFire'
     BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePullOut',Volume=0.109000)
     SelectAnimRate=1.250000
     BringUpTime=0.200000
     PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway',Volume=0.109000)
     PutDownAnimRate=1.000000
     PutDownTime=0.200000
     AIRating=0.700000
     CurrentRating=0.700000
     Description=""
     Priority=13
     CenteredOffsetY=7.000000
     CenteredRoll=0
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=3
     PickupClass=Class'BallisticProV55.X4Pickup'
     AttachmentClass=Class'BallisticProV55.X4Attachment'
     Mesh=SkeletalMesh'BW_Core_WeaponAnim.X4_FPm'
     DrawScale=0.300000
     PlayerViewOffset=(X=4.000000,Y=8.000000,Z=-10.000000)
     SpecialInfo(0)=(Info="180.0;6.0;-999.0;-1.0;-999.0;-999.0;-999.0")
}