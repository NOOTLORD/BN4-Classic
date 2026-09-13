//=============================================================================
// EKS43Attachment.
//
// Attachment for EKS43 sword.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class EKS43Attachment extends BallisticMeleeAttachment;

defaultproperties
{
	WeaponClass=class'EKS43Katana'
	IdleHeavyAnim="TwoHand_Idle"
	IdleRifleAnim="TwoHand_Idle"
	MeleeStrikeAnim="TwoHand_Slam"
	MeleeAltStrikeAnim="TwoHand_Smash"
	ImpactManager=class'IM_Katana'
	InstantMode=MU_Both
	TrackAnimMode=MU_Both
	bHeavy=True
	WaterTracerClass=class'TraceEmitter_WaterBullet'
	RelativeLocation=(Y=-2.000000,Z=-10.000000)
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.EKS43_TPm'
	DrawScale=0.100000
}