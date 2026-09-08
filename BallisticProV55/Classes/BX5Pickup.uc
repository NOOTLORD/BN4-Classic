//=============================================================================
// BX5 Pickup class
//=============================================================================
class BX5Pickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.BX5.BX5Skin');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupLo');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSBase2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSProj2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineV2');	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.BX5.BX5Skin');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSBase2');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSProj2');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineV2');
}

defaultproperties
{
     bOnSide=False
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupLo'
     PickupDrawScale=0.310000
     bWeaponStay=False
     InventoryType=Class'BallisticProV55.BX5Mine'
     RespawnTime=20.000000
     PickupMessage="You picked up the BX5-SM land mine."
     PickupSound=Sound'BW_Core_WeaponSound.BX5.BX5-Putaway'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupHi'
     bOrientOnSlope=True
     Physics=PHYS_None
     DrawScale=0.550000
     CollisionHeight=5.600000
}
