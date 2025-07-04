//=============================================================================
// M46Attachment.
//
// 3rd person weapon attachment for M46 Assault Rifle
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class M46Attachment extends BallisticAttachment;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetBoneScale (0, 0.0, 'Scope');
}

defaultproperties
{
	WeaponClass=class'M46AssaultRifle'
	MuzzleFlashClass=class'M50FlashEmitter'
	AltMuzzleFlashClass=class'M50M900FlashEmitter'
	ImpactManager=class'IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=class'Brass_M46AR'
	FlashMode=MU_Both
	TracerClass=class'TraceEmitter_Default'
	WaterTracerClass=class'TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.700000)
	ReloadAnim="Reload_AR"
	CockingAnim="Cock_RearPull"
	ReloadAnimRate=0.975000
	CockAnimRate=0.925000
	bRapidFire=True
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M46A1_TPm'
	DrawScale=0.275000
}
