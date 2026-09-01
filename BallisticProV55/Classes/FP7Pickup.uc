//=============================================================================
// FP7 Pickup class
//=============================================================================
class FP7Pickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP7.FP7Grenade');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupLo');	
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7Proj');	
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.FP7Clip');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP7.FP7Grenade');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupLo');	
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7Proj');	
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.FP7Clip');
}

defaultproperties
{
     bOnSide=False
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupLo'
     PickupDrawScale=0.500000
     bWeaponStay=False
     InventoryType=Class'BallisticProV55.FP7Grenade'
     RespawnTime=20.000000
     PickupMessage="You picked up the FP7 grenade."
     PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupHi'
     bOrientOnSlope=True
     Physics=PHYS_None
	DrawScale=0.900000
     CollisionHeight=5.600000
}