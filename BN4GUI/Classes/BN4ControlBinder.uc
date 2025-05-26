//==============================================================================
//  Created on: 11/23/2003
//  Description
//
//  Written by Ron Prestenback
//  � 2003, Epic Games, Inc. All Rights Reserved
//==============================================================================

class BN4ControlBinder extends KeyBindMenu;

var localized string BindingLabel[150];

function LoadCommands()
{
	local int i;

	Super.LoadCommands();

	// Update the MultiColumnList's sortdata array to reflect the indexes of our Bindings array
    for (i = 0; i < Bindings.Length; i++)
    	li_Binds.AddedItem();
}

function MapBindings()
{
	LoadCustomBindings();
	Super.MapBindings();
}

protected function LoadCustomBindings()
{
	local int i;
	local array<string> KeyBindClasses;
    local class<GUIUserKeyBinding> CustomKeyBindClass;

    // Load custom keybinds from .int files
    PlayerOwner().GetAllInt("XInterface.GUIUserKeyBinding",KeyBindClasses);
	for (i = 0; i < KeyBindClasses.Length; i++)
	{
		CustomKeyBindClass = class<GUIUserKeyBinding>(DynamicLoadObject(KeyBindClasses[i],class'Class'));
		if (CustomKeyBindClass != None)
			AddCustomBindings( CustomKeyBindClass.default.KeyData );
    }
}

function AddCustomBindings( array<GUIUserKeyBinding.KeyInfo> KeyData )
{
	local int i;

	for ( i = 0; i < KeyData.Length; i++ )
		CreateAliasMapping( KeyData[i].Alias, KeyData[i].KeyLabel, KeyData[i].bIsSection );
}

function ClearBindings()
{
	local int i, max;

	Super.ClearBindings();
	Bindings = default.Bindings;
	max = Min(Bindings.Length, ArrayCount(BindingLabel));
	for ( i = 0; i < max; i++ )
	{
		if ( BindingLabel[i] != "" )
			Bindings[i].KeyLabel = BindingLabel[i];
	}
}

DefaultProperties
{
	PageCaption="Configure Keys TEST"
	Headings(0)="Action"
    Bindings(0)=(bIsSectionLabel=true,KeyLabel="Movement")
    BindingLabel(0)="Movement"
    Bindings(1)=(KeyLabel="Forward",Alias="MoveForward")
    BindingLabel(1)="Forward"
    Bindings(2)=(KeyLabel="Backward",Alias="MoveBackward")
    BindingLabel(2)="Backward"
    Bindings(3)=(KeyLabel="Strafe Left",Alias="StrafeLeft")
    BindingLabel(3)="Strafe Left"
    Bindings(4)=(KeyLabel="Strafe Right",Alias="StrafeRight")
    BindingLabel(4)="Strafe Right"
    Bindings(5)=(KeyLabel="Jump",Alias="Jump")
    BindingLabel(5)="Jump"
    Bindings(6)=(KeyLabel="Walk",Alias="Walking")
    BindingLabel(6)="Walk"
    Bindings(7)=(KeyLabel="Crouch",Alias="Duck")
    BindingLabel(7)="Crouch"

    Bindings(8)=(bIsSectionLabel=true,KeyLabel="Weapons")
    BindingLabel(8)="Weapons"
    Bindings(9)=(KeyLabel="Fire",Alias="Fire")
    BindingLabel(9)="Fire"
    Bindings(10)=(KeyLabel="Next Weapon",Alias="NextWeapon")
    BindingLabel(10)="Next Weapon"
    Bindings(11)=(KeyLabel="Prev Weapon",Alias="PrevWeapon")
    BindingLabel(11)="Prev Weapon"
    Bindings(12)=(KeyLabel="Primary",Alias="SwitchWeapon 1")
    BindingLabel(12)="Primary"
    Bindings(13)=(KeyLabel="Secondary",Alias="SwitchWeapon 2")
    BindingLabel(13)="Secondary"
	Bindings(14)=(KeyLabel="Melee",Alias="SwitchWeapon 3")
    BindingLabel(14)="Melee"
    Bindings(15)=(KeyLabel="Explosives",Alias="SwitchWeapon 4")
    BindingLabel(15)="Explosives"

    Bindings(16)=(bIsSectionLabel=true,KeyLabel="Game")
    BindingLabel(16)="Game"
    Bindings(17)=(KeyLabel="Say",Alias="Talk")
    BindingLabel(17)="Say"
    Bindings(18)=(KeyLabel="Team Say",Alias="TeamTalk")
    BindingLabel(18)="Team Say"
    Bindings(19)=(KeyLabel="Speech Menu",Alias="SpeechMenuToggle")
    BindingLabel(19)="Speech Menu"
    Bindings(20)=(KeyLabel="Use",Alias="use")
    BindingLabel(20)="Use"
    Bindings(21)=(KeyLabel="ScoreBoard",Alias="ShowScores")
    BindingLabel(21)="ScoreBoard Toggle"
    Bindings(22)=(KeyLabel="ScoreBoard (QuickView)",Alias="ScoreToggle")
    BindingLabel(22)="ScoreBoard"
    Bindings(23)=(KeyLabel="Menu",Alias="ShowMenu")
    BindingLabel(23)="Menu"
    Bindings(24)=(KeyLabel="Toggle Console",Alias="ConsoleToggle")
    BindingLabel(24)="Toggle Console"
    Bindings(25)=(KeyLabel="Cancel Pending Connection",Alias="Cancel")
    BindingLabel(25)="Cancel Pending Connection"
    Bindings(26)=(KeyLabel="Toggle Connection Status",Alias="Stat Net")
    BindingLabel(26)="Toggle Connection Status"
    Bindings(27)=(KeyLabel="Toggle FPS Counter",Alias="Stat Fps")
    BindingLabel(27)="Toggle FPS Counter"
}
