//=============================================================================
// RS04 Pickup class
//=============================================================================
class RS04Pickup extends BallisticHandGunPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.RS04.RS04-Main');
 	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.RS04.RS04-SpecMask'); 
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.RS04.RS04PickupHi');
     L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.RS04.RS04PickupLo');  
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.RS04.RS04-Main');
 	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.RS04.RS04-SpecMask'); 
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.RS04.RS04PickupHi');
     Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.RS04.RS04PickupLo');
}

defaultproperties
{
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.RS04.RS04PickupLo'
     PickupDrawScale=0.600000
     InventoryType=Class'BWBP_SKC_Pro.RS04Pistol'
     RespawnTime=20.000000
     PickupMessage="You picked up the RS04 .45 Compact"
     PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
     StaticMesh=StaticMesh'BWBP_SKC_Static.RS04.RS04PickupHi'
     Physics=PHYS_None
     DrawScale=1.000000
     CollisionHeight=4.000000
}