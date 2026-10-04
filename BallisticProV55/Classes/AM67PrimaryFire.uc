//=============================================================================
// AM67PrimaryFire.
//
// Powerful, close range bullet attack.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class AM67PrimaryFire extends BallisticProInstantFire;

defaultproperties
{
	WaterRangeAtten=0.300000
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.700000)
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassBone="tip"
	BrassOffset=(X=-30.000000,Y=1.000000)
	AmmoClass=Class'BallisticProV55.Ammo_50HV'
	BotRefireRate=0.700000
}