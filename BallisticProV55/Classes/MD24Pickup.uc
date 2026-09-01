//=============================================================================
// MD24 Pickup class
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class MD24Pickup extends BallisticHandgunPickup
	placeable;
     
static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MD24.MD24_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MD24.MD24_Clip');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MD24.MD24_PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MD24.MD24_PickupLo');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MD24.MD24_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MD24.MD24_Clip');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MD24.MD24_PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MD24.MD24_PickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.MD24.MD24_PickupLo'
     PickupDrawScale=0.600000
     InventoryType=Class'BallisticProV55.MD24Pistol'
     RespawnTime=10.000000
     PickupMessage="You picked up the MD24 pistol."
     PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.MD24.MD24_PickupHi'
     Physics=PHYS_None
     DrawScale=1.000000
     CollisionHeight=4.000000
}