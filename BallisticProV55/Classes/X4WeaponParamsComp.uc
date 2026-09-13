class X4WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{    
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
    Begin Object Class=MeleeEffectParams Name=ArenaPrimaryEffectParams
        TraceRange=(Min=130.000000,Max=130.000000)
        WaterTraceRange=130.000000
        Damage=70
        DamageType=Class'BallisticProV55.DTX4Knife'
        DamageTypeHead=Class'BallisticProV55.DTX4KnifeHead'
        DamageTypeArm=Class'BallisticProV55.DTX4Knife'
        HookStopFactor=1.700000
        HookPullForce=100.000000
        BotRefireRate=0.9900000
        WarnTargetPct=0.300000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.500000,Radius=12.000000,batten=false)
    End Object
    
    Begin Object Class=FireParams Name=ArenaPrimaryFireParams
        FireInterval=0.350000
        AmmoPerFire=0
        FireAnim="Slash1"
        FireAnimRate=1.500000
        FireEffectParams(0)=MeleeEffectParams'ArenaPrimaryEffectParams'
    End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
    Begin Object Class=MeleeEffectParams Name=ArenaSecondaryEffectParams
        TraceRange=(Min=130.000000,Max=130.000000)
        WaterTraceRange=130.000000
        Damage=90
        DamageType=Class'BallisticProV55.DTX4Knife'
        DamageTypeHead=Class'BallisticProV55.DTX4KnifeHead'
        DamageTypeArm=Class'BallisticProV55.DTX4Knife'
        HookStopFactor=1.700000
        HookPullForce=100.000000
        BotRefireRate=0.500000
        WarnTargetPct=0.500000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.500000,Radius=12.000000,batten=false)
    End Object
    
    Begin Object Class=FireParams Name=ArenaSecondaryFireParams
        FireInterval=0.800000
        AmmoPerFire=0
        PreFireAnim="PrepMelee"
        FireAnim="Melee"
        FireEffectParams(0)=MeleeEffectParams'ArenaSecondaryEffectParams'
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
        PlayerSpeedFactor=1.000000
        PlayerJumpFactor=1.000000
        InventorySize=1
        ViewOffset=(X=4.000000,Y=8.000000,Z=-10.000000)
        MagAmmo=1
        RecoilParams(0)=RecoilParams'UniversalRecoilParams'
        AimParams(0)=AimParams'UniversalAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'UniversalParams'
}