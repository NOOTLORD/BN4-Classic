//////////////////////////////////////////////////////////////////////////
// BN4hitsoundRules
//
// Created by (NL)NOOTLORD 
// Removed the armor check as BN4 has no armor 
//
// QFeedbackDamageRules by
//   by CoolDude (09-2004)
//
// GameRules for QFeedback.uc
//
//////////////////////////////////////////////////////////////////////////
class BN4hitsoundRules extends GameRules;

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
	    if ( InstigatedBy.IsPlayerPawn() && (Victim != InstigatedBy) )
	    {
	        // Check if you hit a teammate (or a teamvehicle) in a team game
	        if ( (Level.Game.bTeamGame) && (Victim.GetTeamNum() == InstigatedBy.GetTeamNum()) )	// GetTeamNum takes care of vehicles too
	        {
		        PlayerController(InstigatedBy.Controller).ClientPlaySound(Sound'QFeedbackTeamWav');
		        //Log("Hit teammate");
	        }
	        // Otherwise, you hit the enemy, so play the normal feedback sound
	        else
	        {
			            // Victim has no armour
		            PlayerController(InstigatedBy.Controller).ClientPlaySound(Sound'QFeedbackWav');
		            //Log("Hit enemy no armor");
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
