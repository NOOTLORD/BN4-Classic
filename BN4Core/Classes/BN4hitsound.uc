// ==========================================================================
// Slightly modified by (NL)NOOTLORD
// Removed the armor hit sound because BN4 has no armor so we don't need it
//
// Q3AFeedback for UT2004
//   by CoolDude (2004-12)
//
// Special thanks to:
//   Scott "Frood" Shingler (author  of QFeedback for UT99)
//   Wormbo                 (author  of Q3AMutator/Q3TMutator for UT99)
//   {ACU}                  (author  of ILTKHitSounds1B for UT200x)
//
// Description:
//   This mutator simulates the feedback you get in Quake III Arena when
//   you inflict damage on someone.  You will hear a certain sound when
//   you hit an enemy, and a different sound when you hit a teammate.
//
//
// Version 2004-09:
//   - Initial version  (QFeedback2k4).
//   - Also works for Vehicles.
// Version 2004-12:
//   - Configurable mutator menu.
//   - Disregard Distance option (All hitsounds are equally loud,
//     disregarding the distance).
//   - Combine Damagehits option (Multiple damage hits play one sound,
//     e.g. Flakcannon).
//   - As a bonus : Humiliation anouncement when killed with a Melee weapon.
// ========================================================================
class BN4hitsound extends Mutator
	transient
	HideDropDown
	CacheExempt;

#exec AUDIO IMPORT FILE="Sounds\QFeedback.wav"     NAME="Hit"        
#exec AUDIO IMPORT FILE="Sounds\QFeedbackTeam.wav" NAME="HitTeam"

var() bool bHitSound;          		  // TRUE  : Play a hitsound when you hit an enemy (default)
                                      // FALSE : Don't play a hitsound when you hit an enemy
var() bool bTeamHit;           		  // TRUE  : Play a sound when you hit a teammate (default)
                                      // FALSE : Don't play a sound when you hit a teammate
var() bool bCombineHits;              // TRUE  : Multiple damage hits play one sound (e.g. Flakcannon) (default)
                                      // FALSE : Multiple damage hits play multiple sounds

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

defaultproperties
{
    bHitSound=True
    bTeamHit=True
    bCombineHits=True  
    FriendlyName="BN4 Hitsounds"
    Description="Quake style Hitsounds when you hit an enemy or a teammate."
}