//=============================================================================
// D49Pickup.
//=============================================================================
class D49Pickup extends BallisticHandgunPickup
	placeable;

//===========================================================================
// StaticPrecache
//
// Explicitly called by some gametypes upon the pickup class to preload it.
// Gametypes needing to do this don't use pickups. Don't preload them here.
//===========================================================================
static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49RevolverSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49_SpecMask');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49ShellsSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49Shells_SpecMask');
 	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49AmmoBox');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49PickupLo');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49PickupHi');    
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49RevolverSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49_SpecMask');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49ShellsSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49Shells_SpecMask');
}
simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49AmmoBox');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49PickupHi');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.D49.D49PickupLo'
     PickupDrawScale=0.300000
     InventoryType=Class'BallisticProV55.D49Revolver'
     RespawnTime=10.000000
     PickupMessage="You picked up the D49 revolver."
     PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.D49.D49PickupHi'
     Physics=PHYS_None
     DrawScale=0.400000
     CollisionHeight=4.000000
}
