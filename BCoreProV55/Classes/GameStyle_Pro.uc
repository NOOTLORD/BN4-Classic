//=============================================================================
// GameStyle_Pro
//
// Defines the Ballistic Pro game style.
//=============================================================================
class GameStyle_Pro extends BC_GameStyle_Fixed;

defaultproperties
{
	Index=GS_Pro
	StyleName="Pro"
	RecoilScale=0.7f
	bRunInADS=False
	SightBobScale=0.3f
	// General
	MaxInventoryCapacity=14
	ConflictWeaponSlots=11
	ConflictEquipmentSlots=3
    bAlternativePickups=False
	bUniversalMineLights=True
	// Pawn
	bBrightPlayers=True
	bHealthRegeneration=True
    StartingHealth=100
    PlayerHealthMax=100
    PlayerSuperHealthMax=100
	bShieldRegeneration=False
    StartingShield=0
	PlayerShieldMax=100
	// Movement
	bPlayerDeceleration=False
	bAllowDodging=False
	bAllowDoubleJump=False
	// this value is a fallback which is overridden by weapon ADS move factor,
	// and should be the highest possible ADS movement multiplier for your style
    PlayerWalkSpeedFactor=0.900000
	PlayerCrouchSpeedFactor=0.450000
    PlayerStrafeScale=1.000000
    PlayerBackpedalScale=1.000000
    PlayerGroundSpeed=340.000000
	PlayerAnimationGroundSpeed=340.000000
    PlayerAirSpeed=340.000000
    PlayerAccelRate=2048.000000
    PlayerJumpZ=340.000000
	PlayerDodgeSpeedFactor=1.500000
    PlayerDodgeZ=210.000000
	bEnableSprint=true
	StaminaChargeRate=15
	StaminaDrainRate=0.000000
	SprintSpeedFactor=1.4f
	JumpDrain=0
    HealthKillReward=0
	KillRewardHealthMax=100
	ShieldKillReward=0
	KillRewardShieldMax=100
}