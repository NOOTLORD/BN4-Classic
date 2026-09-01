//=============================================================================
// XM84 Pickup class
//=============================================================================
class XM84Pickup extends BallisticWeaponPickup
	placeable;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM84.XM84-MainDark');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A73.A73Energy');
	L.AddPrecacheMaterial(Texture'UT2004Weapons.Shaders.ShockRipple');
	L.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.AdrenalinInner');
	L.AddPrecacheMaterial(Texture'XGameShaders.ZoomFX.ScreenNoise');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM84.XM84-TechMask');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Clip');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Projectile');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupLo');
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM84.XM84-MainDark');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A73.A73Energy');
	Level.AddPrecacheMaterial(Texture'UT2004Weapons.Shaders.ShockRipple');
	Level.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.AdrenalinInner');
	Level.AddPrecacheMaterial(Texture'XGameShaders.ZoomFX.ScreenNoise');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM84.XM84-TechMask');
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Projectile');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupLo');
}

defaultproperties
{
     bOnSide=False
     LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.XM84.XM84PickupLo'
     PickupDrawScale=1.000000
     bWeaponStay=False
     InventoryType=Class'BWBP_SKC_Pro.XM84Flashbang'
     RespawnTime=20.000000
     PickupMessage="You picked up the XM84 heavy tech grenade."
     PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
     StaticMesh=StaticMesh'BWBP_SKC_Static.XM84.XM84PickupHi'
     bOrientOnSlope=True
     Physics=PHYS_None
     DrawScale=1.600000
     CollisionHeight=5.600000
}