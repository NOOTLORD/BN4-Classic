//=============================================================================
// AH250 Pickup class
//=============================================================================
class AH250Pickup extends BallisticHandgunPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.NoScope.Rifle-Spec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed');     
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-Front');   
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.DesertEagle.DeaglePickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.DesertEagle.DeaglePickupLo');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.NoScope.Rifle-Spec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed');     
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-Front');   
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.DesertEagle.DeaglePickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.DesertEagle.DeaglePickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.DesertEagle.DeaglePickupLo'
     PickupDrawScale=1.000000
     InventoryType=Class'BWBP_SKC_Pro.AH250Pistol'
     RespawnTime=20.000000
     PickupMessage="You picked up the AH250 'Hawk' scoped pistol."
     PickupSound=Sound'BW_Core_WeaponSound.MRT6.MRT6Pullout'
     StaticMesh=StaticMesh'BWBP_SKC_Static.DesertEagle.DeaglePickupHi'
     Physics=PHYS_None
     DrawScale=1.400000
     CollisionHeight=4.000000
}