//=============================================================================
// AM67Pistol
//
// A powerful sidearm designed for close combat. The .50 bulelts are very
// deadly up, but weaken at range. Secondary is a blinging flash attachment.
//
// Realistic AM67 uses a laser instead of the flash
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class AM67Pistol extends BallisticHandgun;

simulated function PlayIdle()
{
	super.PlayIdle();

	if (bPendingSightUp || SightingState != SS_None || bScopeView || !CanPlayAnim(IdleAnim, ,"IDLE"))
		return;
	FreezeAnimAt(0.0);
}

// AI Interface =====
function byte BestMode()	{	return 0;	}

function float GetAIRating()
{
	local Bot B;
	
	local float Dist;
	local float Rating;

	B = Bot(Instigator.Controller);
	
	if ( B == None )
		return AIRating;

	Rating = Super.GetAIRating();

	if (B.Enemy == None)
		return Rating;

	Dist = VSize(B.Enemy.Location - Instigator.Location);
	
	return class'BUtil'.static.DistanceAtten(Rating, 0.5, Dist, 1536, 2048); 
}

// tells bot whether to charge or back off while using this weapon
function float SuggestAttackStyle()	{	return 0.7;	}
// tells bot whether to charge or back off while defending against this weapon
function float SuggestDefenseStyle()	{	return -0.7;	}
// End AI Stuff =====

defaultproperties
{
	ItemName="AM67"
	AIReloadTime=1.500000
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_AM67'
    BigIconCoords=(Y1=48,X2=511,Y2=212)
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_AM67'
	IconCoords=(X2=127,Y2=31)
	ManualLines(0)=""
	ParamsClasses(0)=Class'AM67WeaponParamsComp'
	FireModeClass(0)=Class'BallisticProV55.AM67PrimaryFire'
	FireModeClass(1)=Class'BCoreProV55.BallisticScopeFire'	
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.155000)
	SelectAnimRate=1.000000
	BringUpTime=0.900000
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.155000)
	PutDownAnimRate=1.000000
	PutDownTime=0.600000
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipHit',Volume=0.500000)
	ClipInFrame=0.650000
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipIn',Volume=0.500000)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipOut',Volume=0.500000)
	CockSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Cock',Volume=0.500000)
	AIRating=0.800000
	CurrentRating=0.8000000
	Description=""
	SightAnimScale=0.300000
	SightBobScale=0.500000
	Priority=24
	InventoryGroup=2
	GroupOffset=2
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	PickupClass=Class'BallisticProV55.AM67Pickup'
	AttachmentClass=Class'BallisticProV55.AM67Attachment'
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.AM67_FPm'
	DrawScale=0.300000
	SpecialInfo(0)=(Info="120.0;15.0;0.8;50.0;0.0;0.5;-999.0")
}