class MeleeEffectParams extends InstantEffectParams;

var() float         ChargeDamageBonusFactor;
var() float         FlankDamageMult;
var() float         BackDamageMult;
var() float         Fatigue;

//Accessor for stats
// sigh
function FireModeStats GetStats() 
{
	local FireModeStats FS;

    FS = Super(FireEffectParams).GetStats();
	
	FS.DamageInt = default.Damage;

	if (ChargeDamageBonusFactor > 1f)
		FS.Damage = String(FS.DamageInt)@"-"@String(int(FS.DamageInt * ChargeDamageBonusFactor));
	else
        FS.Damage = String(FS.DamageInt);

	FS.RangeOpt = "Max range: "@(default.TraceRange.Max / 52.5)@"metres";
	
	return FS;
}

defaultproperties
{
    ChargeDamageBonusFactor=1.000000
    FlankDamageMult=1.000000
    BackDamageMult=1.000000
	Fatigue=0.000000
    ShotTypeString="attacks"
}