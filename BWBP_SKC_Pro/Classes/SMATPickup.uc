//=============================================================================
// SMAT Pickup class
//=============================================================================
class SMATPickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SMAT.SMAT-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SMAT.SMAT-Misc');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupLo');	
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SMAT.SMATCasing');   
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SMAT.SMAT-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SMAT.SMAT-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MGL.MGL-ScreenBase');	
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MGL.MGL-HolosightBasic');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MGL.MGL-Holosight');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SMAT.SMATCasing');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupLo'
     PickupDrawScale=0.500000
     InventoryType=Class'BWBP_SKC_Pro.SMATLauncher'
     RespawnTime=20.000000
     PickupMessage="You picked up the SM-AT/AA Recoilless Rifle"
     PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
     StaticMesh=StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupHi'
     Physics=PHYS_None
     DrawScale=0.440000
     CollisionHeight=6.000000
}