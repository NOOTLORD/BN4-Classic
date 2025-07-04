//=============================================================================
// GRS9Pickup.
//=============================================================================
class GRS9Pickup extends BallisticHandgunPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_SpecMask');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.LaserBeam');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-Ammo');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-HD');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-LD');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_SpecMask');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.LaserBeam');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-HD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-LD');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Glock.Glock-LD'
     PickupDrawScale=0.160000
     InventoryType=Class'BallisticProV55.GRS9Pistol'
     RespawnTime=10.000000
     PickupMessage="You picked up the GRS-9 pistol."
     PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.Glock.Glock-HD'
     Physics=PHYS_None
     DrawScale=0.340000
     PrePivot=(Y=-40.000000)
     CollisionHeight=4.000000
}