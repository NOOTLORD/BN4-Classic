//=============================================================================
// EKS43Katana.
//
// A large sword that takes advantage of a sweeping melee attack. More range
// than akinfe, but slower and can't be thrown. Can be used to block otehr
// melee attacks and has a held attack for secondary which sweeps down and is
// prone to headshots.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class EKS43Katana extends BallisticMeleeWeapon;

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

// End AI Stuff =====

defaultproperties
{
     ItemName="EKS-43"
     BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_EKS43'
     BigIconCoords=(Y1=32,Y2=230)
     IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_EKS43'
     IconCoords=(X2=127,Y2=31)  
     ManualLines(0)=""
     GunLength=0.000000
     ParamsClasses(0)=Class'EKS43WeaponParamsComp'
     FireModeClass(0)=Class'BallisticProV55.EKS43PrimaryFire'
     FireModeClass(1)=Class'BallisticProV55.EKS43SecondaryFire' 
     BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.209000)
     SelectAnimRate=1.500000
     BringUpTime=0.300000
     PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.209000)
     PutDownAnimRate=1.500000
     PutDownTime=0.300000
     AIRating=0.700000
     CurrentRating=0.700000
     Description=""
     Priority=12
     CenteredOffsetY=7.000000
     CenteredRoll=0
     CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	 InventoryGroup=3
	 GroupOffset=3
     PickupClass=Class'BallisticProV55.EKS43Pickup'
     AttachmentClass=Class'BallisticProV55.EKS43Attachment'
     Mesh=SkeletalMesh'BW_Core_WeaponAnim.EKS43_FPm'
     DrawScale=0.300000
     SpecialInfo(0)=(Info="240.0;10.0;-999.0;-1.0;-999.0;-999.0;-999.0")
}