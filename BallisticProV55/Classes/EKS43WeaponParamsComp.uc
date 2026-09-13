class EKS43WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{    
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
    Begin Object Class=MeleeEffectParams Name=ArenaPrimaryEffectParams
        TraceRange=(Min=165.000000,Max=165.000000)
        Fatigue=0.060000
		Damage=80
        DamageType=Class'BallisticProV55.DTEKS43Katana'
        DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
        DamageTypeArm=Class'BallisticProV55.DTEKS43Katana'
        HookStopFactor=1.700000
        HookPullForce=100.000000        
        BotRefireRate=0.990000
        WarnTargetPct=0.300000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=0.500000,Radius=24.000000,batten=false)
    End Object
    
    Begin Object Class=FireParams Name=ArenaPrimaryFireParams
        FireInterval=0.750000
        AmmoPerFire=0
        FireAnim="Slash1"
        FireEffectParams(0)=MeleeEffectParams'ArenaPrimaryEffectParams'
    End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
    Begin Object Class=MeleeEffectParams Name=ArenaSecondaryEffectParams
        TraceRange=(Min=165.000000,Max=165.000000)
        Damage=80
        DamageType=Class'BallisticProV55.DTEKS43Katana'
        DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
        DamageTypeArm=Class'BallisticProV55.DTEKS43Katana'
        HookStopFactor=1.700000
        HookPullForce=100.000000
        BotRefireRate=0.990000
        WarnTargetPct=0.500000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=0.500000,Radius=24.000000,batten=false)
    End Object
    
    Begin Object Class=FireParams Name=ArenaSecondaryFireParams
        FireInterval=1.200000
        AmmoPerFire=0
        PreFireAnim="PrepHack1"
        FireAnim="Hack1"
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
        ViewOffset=(X=7.200000,Z=-21.600000)
        MagAmmo=1
        RecoilParams(0)=RecoilParams'UniversalRecoilParams'
        AimParams(0)=AimParams'UniversalAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'UniversalParams'
}