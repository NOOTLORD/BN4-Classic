//=============================================================================
// MRDR Pickup class
//=============================================================================
class MRDRPickup extends BallisticHandgunPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDR-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDRMuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRMuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupHi');
     L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupLo');    
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDR-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDRMuzzleFlash');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupHi');
     Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupLo'
     PickupDrawScale=0.250000
     InventoryType=Class'BWBP_SKC_Pro.MRDRMachinePistol'
     RespawnTime=20.000000
     PickupMessage="You picked up the MR-DR88 machine pistol."
     PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
     StaticMesh=StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupHi'
     Physics=PHYS_None
     DrawScale=0.420000
     PrePivot=(Y=-16.000000)
     CollisionHeight=4.000000
}