//=============================================================================
// RS8 Pickup class
//=============================================================================
class RS8Pickup extends BallisticHandgunPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RS8.RS8Skin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RS8.RS8_SpecMask');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupLo');    
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RS8.RS8Skin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RS8.RS8_SpecMask');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupLo'
     PickupDrawScale=0.210000
     InventoryType=Class'BallisticProV55.RS8Pistol'
     RespawnTime=20.000000
     PickupMessage="You picked up the RS8 pistol."
     PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupHi'
     Physics=PHYS_None
     DrawScale=0.550000
     PrePivot=(Y=-18.000000)
     CollisionHeight=4.000000
}