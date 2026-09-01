//=============================================================================
// G5 Pickup class
//=============================================================================
class G5Pickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Bazooka');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5_Main-SpecMask');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Scope');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Inner');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Rocket');	
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaMuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaBackFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5PickupLo');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5Rocket');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Bazooka');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5_Main-SpecMask');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Scope');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Inner');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Rocket');	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaBackFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5Rocket');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.G5.G5PickupLo'
     PickupDrawScale=0.500000
     InventoryType=Class'BallisticProV55.G5Bazooka'
     RespawnTime=60.000000
     PickupMessage="You picked up the G5 missile launcher."
     PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.G5.G5PickupHi'
     Physics=PHYS_None
     DrawScale=0.400000
     CollisionHeight=6.000000
}