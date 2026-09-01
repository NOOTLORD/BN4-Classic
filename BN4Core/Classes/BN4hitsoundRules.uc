// ===============================================================================================================================
// Written by (NL)NOOTLORD 
// Removed the armor check as BN4 has no armor, kept almost all of the code the same
//
// Q3ADamageRules by
//   by CoolDude (2004-12)
//
// GameRules for Q3AFeedback.uc
// ===============================================================================================================================
class BN4hitsoundRules extends GameRules;

#exec AUDIO IMPORT FILE="Sounds\QFeedback.wav"     NAME="Hit"        
#exec AUDIO IMPORT FILE="Sounds\QFeedbackTeam.wav" NAME="HitTeam"

var() bool bHitSound;          		  // TRUE  : Play a hitsound when you hit an enemy (default)
                                      // FALSE : Don't play a hitsound when you hit an enemy
var() bool bTeamHit;           		  // TRUE  : Play a sound when you hit a teammate (default)
                                      // FALSE : Don't play a sound when you hit a teammate
var() bool bCombineHits;              // TRUE  : Multiple damage hits play one sound (e.g. Flakcannon) (default)
                                      // FALSE : Multiple damage hits play multiple sounds
var bool  bSoundAgain;
var Sound SoundHitNormal;
var Sound SoundHitTeam;
var float HitVolume;

// ============================================================================
// PostBeginPlay
// ============================================================================
function PostBeginPlay()
{
  bSoundAgain=True;

  SoundHitNormal   = Sound'Hit';
  SoundHitTeam     = Sound'HitTeam'; 

  if (default.bCombineHits)
    HitVolume=1.0;
  else
    HitVolume=1.0;

  Super.PostBeginPlay();
}

//=============================================================================
// NetDamage
//=============================================================================
function int NetDamage( int OriginalDamage, int Damage, Pawn Victim, Pawn InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType )
{
  // Check to get rid of the "Accessed Nones" in the server-log
  if( ( InstigatedBy != None )  &&
	    ( PlayerController(InstigatedBy.Controller) != None )  &&
	    ( class<WeaponDamageType>(DamageType) != None || class<VehicleDamageType>(DamageType) != None )
	  )
  {
    // Tell the client to indicate to the instigator that he inflicted damage, unless it was self-damage
	  if( 
        bSoundAgain &&
        InstigatedBy.IsPlayerPawn() &&
        Victim != InstigatedBy
      )
	  {
	    // Check if you hit a teammate (or a teamvehicle) in a team game
	    if ( (Level.Game.bTeamGame) && (Victim.GetTeamNum() == InstigatedBy.GetTeamNum()) )	// GetTeamNum takes care of vehicles too
	    {
        if (bTeamHit)
		      PlayerController(InstigatedBy.Controller).ClientPlaySound(SoundHitTeam,true,HitVolume);
		    //Log("Hit teammate");
	    }
	    // Otherwise, you hit the enemy, so play the normal feedback sound
	    else
	    {
        if (bHitSound)
        {
		        // Victim has no armour
		        PlayerController(InstigatedBy.Controller).ClientPlaySound(SoundHitNormal,true,HitVolume);
		        //Log("Hit enemy no armor");
        }
	    }

      if (bCombineHits)
      {
        bSoundAgain=False;
        SetTimer(0.1, False);
      }
	  }
  }

  if ( NextGameRules != None )
  {
    return NextGameRules.NetDamage( OriginalDamage,Damage,Victim,InstigatedBy,HitLocation,Momentum,DamageType );
  }
  else
  {
    return Damage;
  }
}

//=============================================================================
// Timer
//=============================================================================
simulated function Timer()
{
  bSoundAgain=True;
}

defaultproperties
{
    bHitSound=True
    bTeamHit=True
    bCombineHits=True  
}