class X8WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{    
	//=================================================================
    // PRIMARY FIRE
    //=================================================================	

		Begin Object Class=MeleeEffectParams Name=ArenaPrimaryEffectParams
			TraceRange=(Min=96.000000,Max=96.000000)
			WaterTraceRange=96.000000
			Damage=55
			DamageType=Class'BWBP_SKC_Pro.DTX8Knife'
			DamageTypeHead=Class'BWBP_SKC_Pro.DTX8Knife'
			DamageTypeArm=Class'BWBP_SKC_Pro.DTX8Knife'
			ChargeDamageBonusFactor=1.000000
			HookStopFactor=1.300000
			HookPullForce=100.000000
			BotRefireRate=0.800000
			WarnTargetPct=0.100000
			FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.500000,Radius=12.000000,batten=false)
		End Object
		
		Begin Object Class=FireParams Name=ArenaPrimaryFireParams
		    FireInterval=0.300000
			AmmoPerFire=0
			FireAnim="Slash1"
			FireAnimRate=1.500000
			FireEffectParams(0)=MeleeEffectParams'ArenaPrimaryEffectParams'
		End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
		Begin Object Class=ProjectileEffectParams Name=ArenaSecondaryEffectParams
			ProjectileClass=Class'BWBP_SKC_Pro.X8ProjectileHeld'
			SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
			Speed=7500.000000
			MaxSpeed=7500.000000
			Damage=80.000000
			MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
			BotRefireRate=1.000000
			WarnTargetPct=0.500000	
			FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=0.5,Radius=16.000000,batten=false)
		End Object

		Begin Object Class=FireParams Name=ArenaSecondaryFireParams
			FireInterval=1.700000
			BurstFireRateFactor=1.00
			PreFireAnim="PrepShoot"
			FireAnim="Shoot"	
		FireEffectParams(0)=ProjectileEffectParams'ArenaSecondaryEffectParams'
		End Object
	
	//=================================================================
	// RECOIL
	//=================================================================
	
	Begin Object Class=RecoilParams Name=UniversalRecoilParams
        ViewBindFactor=0.000000
        PitchFactor=0.000000
        YawFactor=0.000000
        DeclineTime=0.000000
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=UniversalAimParams
        ViewBindFactor=0.000000
        AimSpread=(Min=0,Max=0)
        ChaosDeclineTime=0.320000
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=UniversalParams    
        MagAmmo=1
        InventorySize=1
        RecoilParams(0)=RecoilParams'UniversalRecoilParams'
        AimParams(0)=AimParams'UniversalAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'UniversalParams'
}