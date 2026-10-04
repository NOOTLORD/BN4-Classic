//=============================================================================
// AM67Attachment.
//
// 3rd person weapon attachment for AM67 Pistol
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class AM67Attachment extends HandgunAttachment;

defaultproperties
{
	WeaponClass=class'AM67Pistol'
	MuzzleFlashClass=class'D49FlashEmitter'
	AltMuzzleFlashClass=class'AM67FlashEmitter'
	ImpactManager=class'IM_BigBullet'
	BrassClass=class'Brass_Pistol'
	TracerClass=class'TraceEmitter_Pistol'
	WaterTracerClass=class'TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.700000)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=0.950000
	CockingAnim="Cock_RearPull"
	CockAnimRate=0.850000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.AM67_TPm'
	DrawScale=0.140000
}