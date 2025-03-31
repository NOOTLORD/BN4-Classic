class Cachemode extends DeathMatch;

#exec OBJ LOAD FILE=WeaponSkins.utx
#exec OBJ LOAD FILE=UT2004Weapons.utx
#exec OBJ LOAD FILE=XEffectMat.utx
#exec OBJ LOAD FILE=WeaponStaticMesh.usx
#exec OBJ LOAD FILE=NewWeaponPickups.usx
#exec OBJ LOAD FILE="..\Textures\AW-2004Particles.utx"
#exec OBJ LOAD FILE=intro_characters.utx
#exec OBJ LOAD FILE=DemoPlayerSkins.utx
#exec OBJ LOAD FILE=PlayerSkins.utx
#exec OBJ LOAD FILE=InterfaceContent.utx
#exec OBJ LOAD FILE=LastManStanding.utx
#exec OBJ LOAD FILE=HUDContent.utx

var globalconfig bool		bCustomPreload;		// if true, precache non-Epic characters as well

static function FillPlayInfo(PlayInfo PlayInfo)
{
	Super(Info).FillPlayInfo(PlayInfo);  // Always begin with calling parent

	PlayInfo.AddSetting(default.BotsGroup,   "GameDifficulty",			GetDisplayText("GameDifficulty"), 		0, 2, "Select", default.GIPropsExtras[0], "Xb");

	PlayInfo.AddSetting(default.GameGroup,   "GoalScore",				GetDisplayText("GoalScore"), 			0, 0, "Text",     "3;0:999");
	PlayInfo.AddSetting(default.GameGroup,   "TimeLimit",				GetDisplayText("TimeLimit"), 			0, 0, "Text",     "3;0:999");
	PlayInfo.AddSetting(default.GameGroup,   "MaxLives",				GetDisplayText("MaxLives"), 			0, 0, "Text",     "3;0:999");
	PlayInfo.AddSetting(default.GameGroup,   "bWeaponStay",			GetDisplayText("bWeaponStay"), 			1, 0, "Check",             ,            ,    ,True);

	PlayInfo.AddSetting(default.RulesGroup,  "bAllowWeaponThrowing",	GetDisplayText("bAllowWeaponThrowing"), 1, 0, "Check",             ,            ,    ,True);
	PlayInfo.AddSetting(default.RulesGroup,  "bAllowBehindView",		GetDisplayText("bAllowBehindview"), 	1, 0, "Check",             ,            ,True,True);
	PlayInfo.AddSetting(default.RulesGroup,  "bWeaponShouldViewShake",	GetDisplayText("bWeaponShouldViewShake"),1, 0, "Check",            ,            ,    ,True);

	PlayInfo.AddSetting(default.ServerGroup, "bEnableStatLogging",		GetDisplayText("bEnableStatLogging"), 	0, 1, "Check",             ,            ,True);
	PlayInfo.AddSetting(default.ServerGroup, "bAdminCanPause",			GetDisplayText("bAdminCanPause"), 		1, 1, "Check",             ,            ,True,True);
	PlayInfo.AddSetting(default.ServerGroup, "MaxSpectators",			GetDisplayText("MaxSpectators"), 		1, 1, "Text",      "3;0:32",            ,True,True);
	PlayInfo.AddSetting(default.ServerGroup, "MaxPlayers",				GetDisplayText("MaxPlayers"), 			0, 1, "Text",      "3;0:32",            ,True);
	PlayInfo.AddSetting(default.ServerGroup, "MaxIdleTime",			GetDisplayText("MaxIdleTime"), 			0, 1, "Text",      "3;0:300",            ,True,True);

	// Add GRI's PIData
	if (default.GameReplicationInfoClass != None)
	{
		default.GameReplicationInfoClass.static.FillPlayInfo(PlayInfo);
		PlayInfo.PopClass();
	}

	if (default.VoiceReplicationInfoClass != None)
	{
		default.VoiceReplicationInfoClass.static.FillPlayInfo(PlayInfo);
		PlayInfo.PopClass();
	}

	if (default.BroadcastClass != None)
		default.BroadcastClass.static.FillPlayInfo(PlayInfo);

	else class'BroadcastHandler'.static.FillPlayInfo(PlayInfo);

	PlayInfo.PopClass();

	if (class'Engine.GameInfo'.default.VotingHandlerClass != None)
 	{
	 	class'Engine.GameInfo'.default.VotingHandlerClass.static.FillPlayInfo(PlayInfo);
	 	PlayInfo.PopClass();
	}
	else
		log("GameInfo::FillPlayInfo class'Engine.GameInfo'.default.VotingHandlerClass = None");
}

static function string GetDisplayText(string PropName)
{
	switch (PropName)
	{
		case "GameDifficulty":			return default.GIPropsDisplayText[0];
		case "bWeaponStay":				return default.GIPropsDisplayText[1];
		case "MaxSpectators":			return default.GIPropsDisplayText[4];
		case "MaxPlayers":				return default.GIPropsDisplayText[5];
		case "GoalScore":				return default.GIPropsDisplayText[6];
		case "MaxLives":				return default.GIPropsDisplayText[7];
		case "TimeLimit":				return default.GIPropsDisplayText[8];
		case "bEnableStatLogging":		return default.GIPropsDisplayText[9];
		case "bAllowWeaponThrowing":	return default.GIPropsDisplayText[10];
		case "bAllowBehindview":		return default.GIPropsDisplayText[11];
		case "bAdminCanPause":			return default.GIPropsDisplayText[12];
		case "MaxIdleTime":				return default.GIPropsDisplayText[13];
		case "bWeaponShouldViewShake":	return default.GIPropsDisplayText[14];
	}

	return Super.GetDisplayText(PropName);
}

static function string GetDescriptionText(string PropName)
{
	switch (PropName)
	{
		case "GameDifficulty":			return default.GIPropDescText[0];
		case "bWeaponStay":				return default.GIPropDescText[1];
		case "MaxSpectators":			return default.GIPropDescText[4];
		case "MaxPlayers":				return default.GIPropDescText[5];
		case "GoalScore":				return default.GIPropDescText[6];
		case "MaxLives":				return default.GIPropDescText[7];
		case "TimeLimit":				return default.GIPropDescText[8];
		case "bEnableStatLogging":		return default.GIPropDescText[9];
		case "bAllowWeaponThrowing":	return default.GIPropDescText[10];
		case "bAllowBehindview":		return default.GIPropDescText[11];
		case "bAdminCanPause":			return default.GIPropDescText[12];
		case "MaxIdleTime":				return default.GIPropDescText[13];
		case "bWeaponShouldViewShake":	return default.GIPropDescText[14];
	}

	return Super.GetDescriptionText(PropName);
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
	local int i;
	local array<xUtil.PlayerRecord> AllPlayerList, PlayerList;
	local bool bIsTeamGame;
	local class<GameInfo> GameClass;
	local Texture LoadedSkin, LoadedSkinBlue, LoadedFace, LoadedFaceBlue;
	
	myLevel.AddPrecacheMaterial(Material'UT2004Weapons.AssaultRifleTex0');
	myLevel.AddPrecacheMaterial(Material'XEffects.bulletpock');
	myLevel.AddPrecacheMaterial(Material'WeaponSkins.GrenadeTex');
	myLevel.AddPrecacheMaterial(Material'WeaponSkins.ShieldTex0');
	myLevel.AddPrecacheMaterial(Material'XGameShaders.Minigun_burst');
	myLevel.AddPrecacheMaterial(Material'XEffects.pcl_Spark');
	myLevel.AddPrecacheMaterial(Material'XEffects.EmitSmoke_t');
	myLevel.AddPrecacheMaterial(Material'XEffects.SmokeTex');
	myLevel.AddPrecacheMaterial(Material'XEffects.rocketblastmark');
    myLevel.AddPrecacheMaterial(Texture'XEffects.FlakTrailTex');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.we1_frames');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.exp2_frames');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.SmokeReOrdered');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.exp1_frames');
	myLevel.AddPrecacheMaterial(Material'XEffects.Rexpt');
	myLevel.AddPrecacheMaterial(Material'XEffects.SmokeAlphab_t');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.shock_ring_b');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.Shield.ShieldSpark');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.SlimeSkin');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.goop_green_a');
	myLevel.AddPrecacheMaterial(Material'XGameShaders.PlayerShield');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.Shield3rdFB');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.ShieldRip3rdFB');
 	myLevel.AddPrecacheMaterial(Material'XGameShaders.LinkGunShell');
	myLevel.AddPrecacheMaterial(Material'Engine.BlobTexture');
 	myLevel.AddPrecacheMaterial(Material'XGameShaders.LEnergy');
	myLevel.AddPrecacheMaterial(class'NewTransDeresBlue'.Default.Texture);
	myLevel.AddPrecacheMaterial(Material'intro_characters.BRface1');
	myLevel.AddPrecacheMaterial(Material'AW-2004Particles.Fire.BlastMark');
	myLevel.AddPrecacheMaterial(Material'gradient_FADE');
	myLevel.AddPrecacheMaterial(Material'AW-2004Particles.plasmastar');
	myLevel.AddPrecacheMaterial(Material'XEffects.BotSpark');
	myLevel.AddPrecacheMaterial(Material'InterfaceContent.SquareBoxA');
	myLevel.AddPrecacheMaterial(Material'LastManStanding.LMSLogoSmall');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.redbolt');
	myLevel.AddPrecacheMaterial(Material'XEffects.SpeedTrailTex');
	myLevel.AddPrecacheMaterial(Material'XEffects.pcl_ball');
    myLevel.AddPrecacheMaterial(Texture'XGameShaders.MinigunFlash');

    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat1');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat2');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat3');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat1P');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat2P');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat3P');
    myLevel.AddPrecacheMaterial(Texture'XEffects.xBioSplat');
    myLevel.AddPrecacheMaterial(Texture'XEffects.xBioSplat2');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.BloodJetc');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.BloodPuffA');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.AlienBloodJet');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.BloodPuffGreen');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.BloodPuffOil');

    myLevel.AddPrecacheMaterial(Texture'XEffects.GibOrganicGreen');
    myLevel.AddPrecacheMaterial(Texture'XEffects.GibOrganicRed');
    myLevel.AddPrecacheMaterial(Texture'XEffects.GibBot');
    
    myLevel.AddPrecacheMaterial(Texture'EpicParticles.FlickerFlare2');

	if ( myLevel.IsDemoBuild() )
		myLevel.AddPrecacheMaterial(Material'DemoPlayerSkins.DemoSkeleton');
	else
		myLevel.AddPrecacheMaterial(Texture(DynamicLoadObject("PlayerSkins.Human_Skeleton", class'Material')));

	if ( !Static.NeverAllowTransloc() )
	{
		myLevel.AddPrecacheMaterial(Material'XEffects.TransTrailT');
 		myLevel.AddPrecacheMaterial(Material'XGameShaders.TransPlayerCell');
 		myLevel.AddPrecacheMaterial(Material'XGameShaders.TransPlayerCellRed');
		myLevel.AddPrecacheMaterial(Material'WeaponSkins.NEWTranslocatorTEX');
		myLevel.AddPrecacheMaterial(Material'WeaponSkins.NEWTranslocatorBlue');
		myLevel.AddPrecacheMaterial(Material'WeaponSkins.NEWTranslocatorPUCK');
		myLevel.AddPrecacheMaterial(Material'WeaponSkins.NEWtranslocatorGlass');
	}

	if ( Default.bAllowVehicles )
	{
		myLevel.AddPrecacheMaterial(Material'HUDContent.NoEntry');
	}	
	myLevel.AddPrecacheMaterial(Material'EpicParticles.BurnFlare1');
	myLevel.AddPrecacheMaterial(Material'DeRez.DeRezSkin');
	myLevel.AddPrecacheMaterial(Material'DeRez.RezTest4');

	// water effects
	myLevel.AddPrecacheMaterial(Material'xGame.xCausticRing2');
	myLevel.AddPrecacheMaterial(Material'AW-2004Particles.Energy.SparkHead');
	myLevel.AddPrecacheMaterial(Material'xGame.xSplashBase');
	myLevel.AddPrecacheMaterial(Material'xGame.xWaterdrops2');

	if ( ((myLevel.NetMode == NM_ListenServer) || (myLevel.NetMode == NM_Client))
		&& !myLevel.bSkinsPreloaded && 
		((myLevel.bShouldPreload && myLevel.bDesireSkinPreload && !Default.bForceDefaultCharacter) || myLevel.IsDemoBuild()) )
	{
		class'xUtil'.static.GetPlayerList(AllPlayerList);
		if ( !myLevel.IsDemoBuild() )
		{
			myLevel.ForceLoadTexture(Texture(DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", class'Material')));
			myLevel.ForceLoadTexture(Texture(DynamicLoadObject("UT2004PlayerSkins.Skaarj_Skeleton_Body", class'Material')));
		}
		// Filter out 'duplicate' characters - only used in single player
		// also filter out characters that aren't useable by bots (probably not meant for DM)
		for(i=0; i<AllPlayerList.Length; i++)
		{
			if ( (AllPlayerList[i].Menu != "DUP") && (AllPlayerList[i].BotUse > 0) )
			{
				// if no custom preloading, only preload Epic characters - PlayerSkins, UT2004PlayerSkins, MechaSkaarjSkins, NecrisSkins, MetalSkins
				if ( Default.bCustomPreload
					|| (Left(AllPlayerList[i].BodySkinName,12) ~= "PlayerSkins.")
					|| (Left(AllPlayerList[i].BodySkinName,18) ~= "UT2004PlayerSkins.")
					|| (Left(AllPlayerList[i].BodySkinName,21) ~= "UT2004ECEPlayerSkins.")
					|| (Left(AllPlayerList[i].BodySkinName,16) ~= "DemoPlayerSkins.") )
				{
					PlayerList[PlayerList.Length] = AllPlayerList[i];
				}
			}
		}
		GameClass = myLevel.GetGameClass();
		bIsTeamGame = (GameClass != None) && GameClass.Default.bTeamGame;
		for (i=0; i<PlayerList.Length; i++ )
		{
			DynamicLoadObject(PlayerList[i].MeshName,Class'Mesh');
			if ( !bIsTeamGame )
			{
				if ( (MyLevel.GRI != None) && MyLevel.GRI.bForceTeamSkins  )
				{
					if ( class'DMMutator'.Default.bBrightSkins && (Left(PlayerList[i].BodySkinName,12) ~= "PlayerSkins.") )
						LoadedSkin = Texture(DynamicLoadObject("Bright"$PlayerList[i].BodySkinName$"_0B", class'Material',true));
					else
						LoadedSkin = Texture(DynamicLoadObject(PlayerList[i].BodySkinName$"_0", class'Material'));
				}
				else
					LoadedSkin = Texture(DynamicLoadObject(PlayerList[i].BodySkinName,Class'Material'));
				myLevel.ForceLoadTexture(LoadedSkin);
			}
			else
			{
				// preload team skins
				if ( class'DMMutator'.Default.bBrightSkins && (Left(PlayerList[i].BodySkinName,12) ~= "PlayerSkins.") )
				{
					LoadedSkin = Texture(DynamicLoadObject("Bright"$PlayerList[i].BodySkinName$"_0B",Class'Material',true));
					LoadedSkinBlue = Texture(DynamicLoadObject("Bright"$PlayerList[i].BodySkinName$"_1B",Class'Material',true));
				}
				else
				{
					LoadedSkin = Texture(DynamicLoadObject(PlayerList[i].BodySkinName$"_0",Class'Material'));
					LoadedSkinBlue = Texture(DynamicLoadObject(PlayerList[i].BodySkinName$"_1",Class'Material'));
					if ( PlayerList[i].TeamFace )
					{
						LoadedFace = Texture(DynamicLoadObject(PlayerList[i].FaceSkinName$"_0", class'Material'));
						LoadedFaceBlue = Texture(DynamicLoadObject(PlayerList[i].FaceSkinName$"_1", class'Material'));
						myLevel.ForceLoadTexture(LoadedFace);
						myLevel.ForceLoadTexture(LoadedFaceBlue);
					}
				}
				myLevel.ForceLoadTexture(LoadedSkin);
				myLevel.ForceLoadTexture(LoadedSkinBlue);
			}
			if ( !PlayerList[i].TeamFace )
			{
				LoadedFace = Texture(DynamicLoadObject(PlayerList[i].FaceSkinName,Class'Material'));
				myLevel.ForceLoadTexture(LoadedFace);
			}
			if ( PlayerList[i].VoiceClassName != "" )
				DynamicLoadObject(PlayerList[i].VoiceClassName,Class'Class');
		}
	}
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotCalf');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotForearm');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotHand');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotHead');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotTorso');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotUpperarm');

	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicCalf');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicForearm');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicHand');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicHead');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicTorso');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicUpperarm');

	myLevel.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.shield');
	myLevel.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.grenademesh');
	myLevel.AddPrecacheStaticMesh(StaticMesh'NewWeaponPickups.AssaultPickupSM');
	if ( !Static.NeverAllowTransloc() )
		myLevel.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.NEWTranslocatorPUCK');
}

defaultproperties
{
    MapListType="XInterface.MapListDeathMatch"
    HUDType="XInterface.HudCDeathMatch"
	DeathMessageClass=class'XGame.xDeathMessage'

    ScreenShotName="UT2004Thumbnails.DMShots"
    DecoTextName="XGame.Deathmatch"

    Acronym="DM"
    MapPrefix="DM"
    GameName="Cache game"
    DefaultEnemyRosterClass="XGame.xDMRoster"
    Description="Free-for-all kill or be killed.  The player with the most frags wins."
}
