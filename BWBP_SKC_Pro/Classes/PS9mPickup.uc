//=============================================================================
// PS9M Pickup class
//=============================================================================
class PS9mPickup extends BallisticHandgunPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Stealth.Stealth-Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Ps9m.PS9mPickupHi');
     L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Ps9m.PS9mPickupLo');    
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Stealth.Stealth-Main');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Ps9m.PS9mPickupHi');
     Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Ps9m.PS9mPickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.PS9M.PS9mPickupLo'
     PickupDrawScale=0.190000
     InventoryType=Class'BWBP_SKC_Pro.PS9mPistol'
     RespawnTime=20.000000
     PickupMessage="You picked up the PS-9m stealth pistol."
     PickupSound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Pickup'
     StaticMesh=StaticMesh'BWBP_SKC_Static.PS9M.PS9mPickupHi'
     Physics=PHYS_None
     DrawScale=0.220000
     CollisionHeight=4.000000
}