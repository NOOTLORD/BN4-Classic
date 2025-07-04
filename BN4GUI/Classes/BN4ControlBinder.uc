//==============================================================================
//  Created on: 11/23/2003
//  Description
//
//  Written by Ron Prestenback
//  � 2003, Epic Games, Inc. All Rights Reserved
//==============================================================================

class BN4ControlBinder extends KeyBindMenu;

var localized string BindingLabel[50];

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
    Bindings(7)=(KeyLabel="Sprint",Alias="Mutate BStartSprint|OnRelease Mutate BStopSprint")
    BindingLabel(7)="Sprint"
    Bindings(8)=(KeyLabel="Crouch",Alias="Duck")
    BindingLabel(8)="Crouch"

    Bindings(9)=(bIsSectionLabel=true,KeyLabel="Weapons")
    BindingLabel(9)="Weapons"
    Bindings(10)=(KeyLabel="Fire",Alias="Fire")
    BindingLabel(10)="Fire"
    Bindings(11)=(KeyLabel="Alt-Fire/Aim Down Sights",Alias="AltFire")
    BindingLabel(11)="Alt-Fire/Aim Down Sights"
    Bindings(12)=(KeyLabel="Reload",Alias="Reload")
    BindingLabel(12)="Reload"
    Bindings(13)=(KeyLabel="Switch Fire Mode",Alias="SwitchWeaponMode")
    BindingLabel(13)="Switch Fire Mode"
    Bindings(14)=(KeyLabel="Next Weapon",Alias="NextWeapon")
    BindingLabel(14)="Next Weapon"
    Bindings(15)=(KeyLabel="Prev Weapon",Alias="PrevWeapon")
    BindingLabel(15)="Prev Weapon"
    Bindings(16)=(KeyLabel="Primary",Alias="SwitchWeapon 1")
    BindingLabel(16)="Primary"
    Bindings(17)=(KeyLabel="Secondary",Alias="SwitchWeapon 2")
    BindingLabel(17)="Secondary"
	Bindings(18)=(KeyLabel="Melee",Alias="SwitchWeapon 3")
    BindingLabel(18)="Melee"
    Bindings(19)=(KeyLabel="Explosives",Alias="SwitchWeapon 4")
    BindingLabel(19)="Explosives"

    Bindings(20)=(bIsSectionLabel=true,KeyLabel="Game")
    BindingLabel(20)="Game"
    Bindings(21)=(KeyLabel="Loadout Menu",Alias="Mutate Loadout")
    BindingLabel(21)="Loadout Menu"
    Bindings(22)=(KeyLabel="Suicide",Alias="Suicide")
    BindingLabel(22)="Suicide"
    Bindings(23)=(KeyLabel="Say",Alias="Talk")
    BindingLabel(23)="Say"
    Bindings(24)=(KeyLabel="Team Say",Alias="TeamTalk")
    BindingLabel(24)="Team Say"
    Bindings(25)=(KeyLabel="Speech Menu",Alias="SpeechMenuToggle")
    BindingLabel(25)="Speech Menu"
    Bindings(26)=(KeyLabel="Use",Alias="use")
    BindingLabel(26)="Use"
    Bindings(27)=(KeyLabel="ScoreBoard",Alias="ShowScores")
    BindingLabel(27)="ScoreBoard Toggle"
    Bindings(28)=(KeyLabel="ScoreBoard (QuickView)",Alias="ScoreToggle")
    BindingLabel(28)="ScoreBoard"
    Bindings(29)=(KeyLabel="Menu",Alias="ShowMenu")
    BindingLabel(29)="Menu"
    Bindings(30)=(KeyLabel="Toggle Console",Alias="ConsoleToggle")
    BindingLabel(30)="Toggle Console"
    Bindings(31)=(KeyLabel="Cancel Pending Connection",Alias="Cancel")
    BindingLabel(31)="Cancel Pending Connection"
    Bindings(32)=(KeyLabel="Toggle Connection Status",Alias="Stat Net")
    BindingLabel(32)="Toggle Connection Status"
    Bindings(33)=(KeyLabel="Toggle FPS Counter",Alias="Stat Fps")
    BindingLabel(33)="Toggle FPS Counter"
}
