//=============================================================================
// NRP57 Pickup class
//=============================================================================
class NRP57Pickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.NRP57.Grenade');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupLo');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.Pineapple');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.GrenadeClip');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.NRP57.Grenade');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.Pineapple');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.GrenadeClip');
}

defaultproperties
{
     bOnSide=False
     LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupLo'
     PickupDrawScale=0.200000
     bWeaponStay=False
     InventoryType=Class'BallisticProV55.NRP57Grenade'
     RespawnTime=20.000000
     PickupMessage="You picked up the NRP-57 grenade."
     PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupHi'
     bOrientOnSlope=True
     Physics=PHYS_None
     DrawScale=0.400000
     CollisionHeight=5.600000
}