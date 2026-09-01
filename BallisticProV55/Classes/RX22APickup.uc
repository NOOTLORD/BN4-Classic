//=============================================================================
// RX22A Pickup class
//=============================================================================
class RX22APickup extends BallisticWeaponPickup
	placeable;

function SetWeaponStay()
{
	bWeaponStay = false;
}

function float GetRespawnTime()
{
	return RespawnTime;
}

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22AShield');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ATank');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASign');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickup');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickupLD');	
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerCanHeater');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerTank');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22AShield');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ATank');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.RX22A.RX22ASign');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickup');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickupLD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerCanHeater');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerTank');
}

defaultproperties
{
    bOnSide=False
    LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickupLD'
    PickupDrawScale=0.350000
    InventoryType=Class'BallisticProV55.RX22AFlamer'
    RespawnTime=60.000000
    PickupMessage="You picked up the RX-22A flamethrower."
 	PickupSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Putaway'
    StaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerPickup'
    Physics=PHYS_None
    DrawScale=0.350000
    CollisionHeight=5.000000
}