///////////////////////////////////////////////////////////////////////////
// BN4hitsound
//
// Created by (NL)NOOTLORD 
// Removed the armor hit sound because BN4 has no armor so we don't need it
//
// QFeedback for UT2004
//   by CoolDude (09-2004)
//
// Special thanks to:
//   Scott "Frood" Shingler (author of QFeedback for UT99)
//   {ACU}                  (author of ILTKHitSounds1B for UT200x)
//
// Description:
//   This mutator simulates the feedback you get in Quake III Arena when
//   you inflict damage on someone.  You will hear a certain sound when
//   you hit an enemy, and a different sound when you hit a teammate.
//
// Remarks:
//   - As suspected by now, this was mostly a copy, paste and modify job.
//   - Also works for Vehicles
///////////////////////////////////////////////////////////////////////////
class BN4hitsound extends Mutator;

#exec AUDIO IMPORT FILE="Sounds\QFeedback.wav" NAME="QFeedbackWav"
#exec AUDIO IMPORT FILE="Sounds\QFeedbackTeam.wav" NAME="QFeedbackTeamWav" 

// ============================================================================
// PostBeginPlay
// ============================================================================

function PostBeginPlay()
{
   
   local GameRules G;
    
   G = spawn(class'BN4hitsoundRules');

   if ( Level.Game.GameRulesModifiers == None )
      Level.Game.GameRulesModifiers = G;
   else    
      Level.Game.GameRulesModifiers.AddGameRules(G);
    
   Super.PostBeginPlay();   

}

// ============================================================================
// Default properties
// ============================================================================
defaultproperties
{
    FriendlyName="BN4 Hitsounds"
    Description="Quake style Hitsounds when you hit an enemy or a teammate."
}