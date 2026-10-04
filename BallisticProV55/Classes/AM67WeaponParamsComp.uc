class AM67WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	

    Begin Object Class=InstantEffectParams Name=ArenaPriEffectParams
        WaterTraceRange=128.000000
		DecayRange=(Min=1050,Max=2100)
		RangeAtten=0.500000
        Damage=60.000000
        DamageType=Class'BallisticProV55.DTAM67Pistol'
        DamageTypeHead=Class'BallisticProV55.DTAM67PistolHead'
        DamageTypeArm=Class'BallisticProV55.DTAM67Pistol'
		MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
        FlashScaleFactor=0.900000
		FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Fire',Volume=1.100000)
        Recoil=1536.000000
        Chaos=0.200000
        Inaccuracy=(X=16,Y=16)
		BotRefireRate=0.700000
	    WarnTargetPct=0.400000
    End Object

    Begin Object Class=FireParams Name=ArenaPriFireParams
        FireInterval=0.500000
		BurstFireRateFactor=0.650000
        FireEffectParams(0)=InstantEffectParams'ArenaPriEffectParams'
    End Object 

	//=================================================================
	// RECOIL
	//=================================================================

    Begin Object Class=RecoilParams Name=ArenaRecoilParams
        XCurve=(Points=(,(InVal=0.1,OutVal=0.00),(InVal=0.2,OutVal=-0.06),(InVal=0.3,OutVal=-0.08),(InVal=0.40000,OutVal=0.05),(InVal=0.50000,OutVal=-0.02000),(InVal=0.600000,OutVal=0.06),(InVal=0.700000,OutVal=0.01),(InVal=0.800000,OutVal=-0.04000),(InVal=1.000000,OutVal=0.0)))
        YCurve=(Points=(,(InVal=0.1,OutVal=0.1),(InVal=0.2,OutVal=0.220000),(InVal=0.300000,OutVal=0.300000),(InVal=0.400000,OutVal=0.4500),(InVal=0.500000,OutVal=0.5500),(InVal=0.600000,OutVal=0.620000),(InVal=0.750000,OutVal=0.770000),(InVal=1.000000,OutVal=1.00000)))
        PitchFactor=1.000000
        XRandFactor=0.10000
        YRandFactor=0.10000
		MaxRecoil=8192.000000
		ClimbTime=0.100000
        DeclineTime=0.750000
		DeclineDelay=0.450000
		ViewBindFactor=1.000000
		ADSViewBindFactor=1.000000
		HipMultiplier=1.000000
		MaxMoveMultiplier=1.000000
		CrouchMultiplier=1.000000
    End Object

	//=================================================================
	// AIM
	//=================================================================

    Begin Object Class=AimParams Name=ArenaAimParams
        AimSpread=(Min=16,Max=128)
        AimAdjustTime=0.450000
		OffsetAdjustTime=0.300000
		CrouchMultiplier=0.800000
    	ADSMultiplier=1.000000
		SprintOffSet=(Pitch=0,Yaw=0)
        JumpChaos=0.200000
		FallingChaos=0.000000
    	SprintChaos=0.000000
        ChaosDeclineTime=0.450000
		ChaosDeclineDelay=0.000000
        ChaosSpeedThreshold=500.000000
    End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=ArenaParams_RDS
	    PlayerSpeedFactor=1.000000
    	PlayerJumpFactor=1.000000	
        InventorySize=4
		CockAnimRate=1.250000
	    ReloadAnimRate=1.250000
	    SightMoveSpeedFactor=0.900000
		SightingTime=0.250000
		SightOffset=(X=-24,Y=0.06,Z=4.43)
		ViewOffset=(X=20.00,Y=3.00,Z=-8.00)
        MagAmmo=9
		WeaponBoneScales(0)=(BoneName="Sight",Slot=12,Scale=1)
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
        FireParams(0)=FireParams'ArenaPriFireParams'
    End Object 
	
    Layouts(0)=WeaponParams'ArenaParams_RDS'
}