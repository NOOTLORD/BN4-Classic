// ======================================================================================================
// Written by (NL)NOOTLORD 
// New deathmatch gamemode to strip out most of epic's asset caching and add BW assets in there place
// Also fully exposed the FillPlayInfo function so we can remove or only show options that we want
// ======================================================================================================
class Cachemode extends DeathMatch;


#exec OBJ LOAD FILE=XEffectMat.utx
#exec OBJ LOAD FILE="..\Textures\AW-2004Particles.utx"
#exec OBJ LOAD FILE=intro_characters.utx
#exec OBJ LOAD FILE=DemoPlayerSkins.utx
#exec OBJ LOAD FILE=PlayerSkins.utx
#exec OBJ LOAD FILE=InterfaceContent.utx
#exec OBJ LOAD FILE=LastManStanding.utx
#exec OBJ LOAD FILE=HUDContent.utx

var const localized string	BallisticGroup;
var	  globalconfig string	BWConfigVar;		// Just some var for the ballistic config setting
var   localized string	BWConfigDisplayText,BWConfigDescText;

var globalconfig bool		bCustomPreload;		// if true, precache non-Epic characters as well

function PostBeginPlay()
{
  local GameRules G;
    
  G = spawn(class'BN4hitsoundRules');

  if ( Level.Game.GameRulesModifiers == None )
    Level.Game.GameRulesModifiers = G;
  else    
    Level.Game.GameRulesModifiers.AddGameRules(G);

  Super.PostBeginPlay();   

}

event InitGame( string Options, out string Error )
{
	super.InitGame(Options, Error);

	AddMutator("BallisticProV55.Mut_BallisticPro");
	AddMutator("BallisticProV55.Mut_Regeneration");	
	AddMutator("XGame.MutNoAdrenaline");
	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	//local int i;

	Super(Info).FillPlayInfo(PlayInfo);  // Always begin with calling parent

	PlayInfo.AddSetting(default.BotsGroup,   "GameDifficulty",			GetDisplayText("GameDifficulty"), 		0, 2, 	"Select", default.GIPropsExtras[0]	, "Xb");

	PlayInfo.AddSetting(default.GameGroup,   "GoalScore",				GetDisplayText("GoalScore"), 			0, 0, 	"Text",    "3;0:999");
	PlayInfo.AddSetting(default.GameGroup,   "TimeLimit",				GetDisplayText("TimeLimit"), 			0, 0, 	"Text",    "3;0:999");
	//PlayInfo.AddSetting(default.GameGroup,   "MaxLives",				GetDisplayText("MaxLives"), 			0, 0, 	"Text",    "3;0:999");
	//PlayInfo.AddSetting(default.GameGroup,   "bWeaponStay",				GetDisplayText("bWeaponStay"), 			1, 0, 	"Check",             ,            	,    ,True);

	//PlayInfo.AddSetting(default.RulesGroup,  "bAllowWeaponThrowing",	GetDisplayText("bAllowWeaponThrowing"), 1, 0, 	"Check",             ,            	,    ,True);
	//PlayInfo.AddSetting(default.RulesGroup,  "bAllowBehindView",		GetDisplayText("bAllowBehindview"), 	1, 0, 	"Check",             ,            	,True,True);
	//PlayInfo.AddSetting(default.RulesGroup,  "bWeaponShouldViewShake",	GetDisplayText("bWeaponShouldViewShake"),1, 0,	"Check",             ,             	,    ,True);

	//PlayInfo.AddSetting(default.ServerGroup, "bEnableStatLogging",		GetDisplayText("bEnableStatLogging"), 	0, 1, 	"Check",             ,            		 ,True);
	//PlayInfo.AddSetting(default.ServerGroup, "bAdminCanPause",			GetDisplayText("bAdminCanPause"), 		1, 1, 	"Check",             ,            	,True,True);
	//PlayInfo.AddSetting(default.ServerGroup, "MaxSpectators",			GetDisplayText("MaxSpectators"), 		1, 1, 	"Text",      "3;0:32",            	,True,True);
	PlayInfo.AddSetting(default.ServerGroup, "MaxPlayers",				GetDisplayText("MaxPlayers"), 			0, 1, 	"Text",      "3;0:32",            		 ,True);
	//PlayInfo.AddSetting(default.ServerGroup, "MaxIdleTime",				GetDisplayText("MaxIdleTime"), 			0, 1, 	"Text",     "3;0:300",           	,True,True);

	PlayInfo.AddSetting(default.BotsGroup,   "MinPlayers",        		default.MPGIPropsDisplayText[0], 		0,   0, "Text",   	"3;0:32");
	//PlayInfo.AddSetting(default.GameGroup,   "EndTimeDelay",       		default.MPGIPropsDisplayText[i++], 		1,   1, "Text",              ,            ,     , True);
	PlayInfo.AddSetting(default.BotsGroup,   "BotMode",			   		default.MPGIPropsDisplayText[2], 		30,  1, "Select", default.BotModeText);
	//PlayInfo.AddSetting(default.RulesGroup,  "bAllowPrivateChat",  		default.MPGIPropsDisplayText[i++], 		254, 1, "Check",             , "Xv" 		,True, True);

	//if ( !Default.bTeamGame )
	//PlayInfo.AddSetting(default.BotsGroup, 	 "bAdjustSkill",        	GetDisplayText("bAdjustSkill"),        	0,    2, "Check",             ,				,    ,True);

	//PlayInfo.AddSetting(default.GameGroup,   "SpawnProtectionTime", 	GetDisplayText("SpawnProtectionTime"), 	2,    1, "Text", "8;0.0:30.0",				,    ,True);
	//PlayInfo.AddSetting(default.GameGroup,   "LateEntryLives",      	GetDisplayText("LateEntryLives"),     	50,   1, "Text",          "3",				,True,True);
	//PlayInfo.AddSetting(default.GameGroup,   "bColoredDMSkins",     	GetDisplayText("bColoredDMSkins"),     	1,    1, "Check",            ,				,    ,True);
	PlayInfo.AddSetting(default.GameGroup,   "bAllowPlayerLights",  	GetDisplayText("bAllowPlayerLights"),  	1,    1, "Check",            ,				,    ,True);

	//PlayInfo.AddSetting(default.RulesGroup,  "bAllowTrans",         	GetDisplayText("bAllowTrans"),         	0,    1, "Check",            ,				,    ,True);
	//PlayInfo.AddSetting(default.RulesGroup,  "bAllowTaunts",        	GetDisplayText("bAllowTaunts"),        	1,    1, "Check",            ,				,    ,True);
	//PlayInfo.AddSetting(default.RulesGroup,  "bForceRespawn",       	GetDisplayText("bForceRespawn"),       	0,    1, "Check",            ,				,True,True);
	//PlayInfo.AddSetting(default.RulesGroup,  "bPlayersMustBeReady", 	GetDisplayText("bPlayersMustBeReady"), 	1,    1, "Check",            ,				,True,True);

	//PlayInfo.AddSetting(default.ServerGroup, "MinNetPlayers",       	GetDisplayText("MinNetPlayers"),       	100,  1, "Text",     "3;0:32",				,True,True);
	//PlayInfo.AddSetting(default.ServerGroup, "NetWait",             	GetDisplayText("NetWait"),             	200,  1, "Text",     "3;0:60",				,True,True);
	//PlayInfo.AddSetting(default.ServerGroup, "RestartWait",         	GetDisplayText("RestartWait"),         	200,  1, "Text",     "3;0:60",				,True,True);

	PlayInfo.AddSetting(default.GameGroup, "BWConfigVar", 				default.BWConfigDisplayText, 			60, 2, "Custom", ";;BallisticProV55.MutConfigMenu_Pro");

	class'MasterServerUplink'.static.FillPlayInfo(PlayInfo);

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

		case "NetWait":            		return default.DMPropsDisplayText[0];
		case "MinNetPlayers":      		return default.DMPropsDisplayText[1];
		case "RestartWait":        		return default.DMPropsDisplayText[2];
		case "bTournament":        		return default.DMPropsDisplayText[3];
		case "bPlayersMustBeReady":		return default.DMPropsDisplayText[4];
		case "bForceRespawn":      		return default.DMPropsDisplayText[5];
		case "bAdjustSkill":       		return default.DMPropsDisplayText[6];
		case "bAllowTaunts":       		return default.DMPropsDisplayText[7];
		case "SpawnProtectionTime":		return default.DMPropsDisplayText[8];
		case "bAllowTrans":        		return default.DMPropsDisplayText[9];
		case "bColoredDMSkins":    		return default.DMPropsDisplayText[10];
		case "LateEntryLives":     		return default.DMPropsDisplayText[12];
		case "bAllowPlayerLights": 		return default.DMPropsDisplayText[13];
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

		case "MinPlayers":				return default.MPGIPropDescText[0];
		//case "EndTimeDelay":			return default.MPGIPropDescText[1];
		case "BotMode":					return default.MPGIPropDescText[2];
		case "bAllowPrivateChat": 		return default.MPGIPropDescText[3];

		case "NetWait":            		return default.DMPropDescText[0];
		case "MinNetPlayers":      		return default.DMPropDescText[1];
		case "RestartWait":        		return default.DMPropDescText[2];
		case "bTournament":        		return default.DMPropDescText[3];
		case "bPlayersMustBeReady":		return default.DMPropDescText[4];
		case "bForceRespawn":      		return default.DMPropDescText[5];
		case "bAdjustSkill":       		return default.DMPropDescText[6];
		case "bAllowTaunts":       		return default.DMPropDescText[7];
		case "SpawnProtectionTime":		return default.DMPropDescText[8];
		case "bAllowTrans":        		return default.DMPropDescText[9];
		case "bColoredDMSkins":    		return default.DMPropDescText[10];
		case "bAutoNumBots":       		return default.DMPropDescText[11];
		case "LateEntryLives":     		return default.DMPropDescText[12];
		case "bAllowPlayerLights": 		return default.DMPropDescText[13];
		case "BWConfigVar":				return default.BWConfigDescText;

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
	
	myLevel.AddPrecacheMaterial(Material'XEffects.bulletpock');
	myLevel.AddPrecacheMaterial(Material'XEffects.pcl_Spark');
	myLevel.AddPrecacheMaterial(Material'XEffects.EmitSmoke_t');
	myLevel.AddPrecacheMaterial(Material'XEffects.SmokeTex');
	myLevel.AddPrecacheMaterial(Material'XEffects.rocketblastmark');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.we1_frames');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.exp2_frames');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.SmokeReOrdered');
	myLevel.AddPrecacheMaterial(Texture'ExplosionTex.exp1_frames');
	myLevel.AddPrecacheMaterial(Material'XEffects.Rexpt');
	myLevel.AddPrecacheMaterial(Material'XEffects.SmokeAlphab_t');
	myLevel.AddPrecacheMaterial(Material'Engine.BlobTexture');
	myLevel.AddPrecacheMaterial(Material'intro_characters.BRface1');
	myLevel.AddPrecacheMaterial(Material'AW-2004Particles.Fire.BlastMark');
	myLevel.AddPrecacheMaterial(Material'gradient_FADE');
	myLevel.AddPrecacheMaterial(Material'AW-2004Particles.plasmastar');
	myLevel.AddPrecacheMaterial(Material'InterfaceContent.SquareBoxA');
	myLevel.AddPrecacheMaterial(Material'LastManStanding.LMSLogoSmall');
	myLevel.AddPrecacheMaterial(Material'XEffectMat.redbolt');

	//UT2004 blood effects
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat1');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat2');
    myLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat3');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.BloodJetc');
    myLevel.AddPrecacheMaterial(Texture'XGameShadersB.BloodPuffA');
    myLevel.AddPrecacheMaterial(Texture'XEffects.GibOrganicRed');
    
    myLevel.AddPrecacheMaterial(Texture'EpicParticles.FlickerFlare2');

	myLevel.AddPrecacheMaterial(Texture'PlayerSkins.Human_Skeleton');

	//UT2004 no entry hud icon for vehicles
	if ( Default.bAllowVehicles )
	{
		myLevel.AddPrecacheMaterial(Material'HUDContent.NoEntry');
	}	
	
	// water effects
	myLevel.AddPrecacheMaterial(Material'xGame.xCausticRing2');
	myLevel.AddPrecacheMaterial(Material'AW-2004Particles.Energy.SparkHead');
	myLevel.AddPrecacheMaterial(Material'xGame.xSplashBase');
	myLevel.AddPrecacheMaterial(Material'xGame.xWaterdrops2');

	//BW
	myLevel.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.Hands.Hands-Shiny');
	myLevel.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny');
	myLevel.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny');	
	myLevel.AddPrecacheMaterial(TexEnvMap'BW_Core_WeaponTex.Effects.ShotSpecEnv');
	myLevel.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Hands.BallisticHand-SpecMask');

	class'BallisticProV55.X4Pickup'.static.StaticPrecache(myLevel);
	class'BallisticProV55.EKS43Pickup'.static.StaticPrecache(myLevel);
	class'BWBP_SKC_Pro.X8Pickup'.static.StaticPrecache(myLevel);

	class'BallisticProV55.M46Pickup'.static.StaticPrecache(myLevel);


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
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicCalf');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicForearm');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicHand');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicHead');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicTorso');
	myLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicUpperarm');
}

defaultproperties
{
    BallisticGroup="Ballistic"	
    BWConfigDisplayText="Ballistic Settings"
    BWConfigDescText="Options for Ballistic Weapons."	
	bColoredDMSkins=False
	bAllowTrans=False
	bAllowWeaponThrowing=False
	DefaultPlayerClassName="BallisticProV55.BallisticPawn"
    PlayerControllerClassName="BallisticProV55.BallisticPlayer"
    MapListType="XInterface.MapListDeathMatch"
    HUDType="XInterface.HudCDeathMatch"
	DeathMessageClass=class'Ballistic_DeathMessage'
    ScreenShotName="UT2004Thumbnails.DMShots"
    DecoTextName="XGame.Deathmatch"
    Acronym="DM"
    MapPrefix="DM"
    GameName="DeathMatch"
    DefaultEnemyRosterClass="XGame.xDMRoster"
    Description="Free-for-all kill or be killed.  The player with the most frags wins."
}