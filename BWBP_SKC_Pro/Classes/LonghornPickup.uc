//=============================================================================
// Longhorn Pickup class
//=============================================================================
class LonghornPickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Longhorn.Longhorn-Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.GrenadeProj');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornBrass');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupLo');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Longhorn.Longhorn-Main');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.GrenadeProj');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornBrass');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupLo'
     PickupDrawScale=0.090000
     InventoryType=Class'BWBP_SKC_Pro.LonghornLauncher'
     RespawnTime=10.000000
     PickupMessage="You picked up the Longhorn repeater."
     PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
     StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupHi'
     Physics=PHYS_None
     DrawScale=0.110000
     CollisionHeight=4.000000
}