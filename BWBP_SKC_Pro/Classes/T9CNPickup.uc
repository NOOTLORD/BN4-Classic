//=============================================================================
// T9CNPickup.
//=============================================================================
class T9CNPickup extends BallisticHandgunPickup
	placeable;

//===========================================================================
// StaticPrecache
//
// Explicitly called by some gametypes upon the pickup class to preload it.
// Gametypes needing to do this don't use pickups. Don't preload them here.
//===========================================================================
static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.Ber-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.Ber-Mag');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.Ber-Slide');     
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.T9CN-Stock');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.T9CN-MiscSilver');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverSpec');
 	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M9.M9PickupHi');
 	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M9.M9PickupLo');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.Ber-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.Ber-Mag');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.Ber-Slide');     
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.T9CN-Stock');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.T9CN-MiscSilver');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverSpec');
}

simulated function UpdatePrecacheStaticMeshes()
{
 	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M9.M9PickupHi');
 	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M9.M9PickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.M9.M9PickupLo'
     PickupDrawScale=0.900000
     InventoryType=Class'BWBP_SKC_Pro.T9CNMachinePistol'
     RespawnTime=20.000000
     PickupMessage="You picked up the T9CN Automatic Pistol"
     PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
     StaticMesh=StaticMesh'BWBP_SKC_Static.M9.M9PickupHi'
     Physics=PHYS_None
     DrawScale=1.400000
     CollisionHeight=4.000000
}
