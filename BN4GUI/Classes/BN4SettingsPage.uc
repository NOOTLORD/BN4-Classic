//==============================================================================
//  Written by (NL)NOOTLORD 
//  New settings page to map the new custom tabs
//==============================================================================
class BN4SettingsPage extends UT2K4SettingsPage;

defaultproperties
{
    OnClose=InternalOnClose
    OnCanClose=InternalOnCanClose
    OnPreDraw=InternalOnPreDraw

	Begin Object Class=GUIImage Name=BkCharnew
		//Image=material'2K4Menus.BKRenders.Char01'
		ImageStyle=ISTY_Scaled
		ImageColor=(R=255,G=255,B=255,A=255)
		X1=0
		Y1=0
		X2=1024
		Y2=768
		WinWidth=1
		WinHeight=1
		WinTop=0
		WinLeft=0
		RenderWeight=0.02
	End Object

    Begin Object class=GUIHeader name=SettingHeader
        Caption="Settings"
		WinHeight=25
		RenderWeight=0.3
    End Object

    Begin Object Class=UT2K4Settings_Footer Name=SettingFooter
        RenderWeight=0.3
        TabOrder=4
    End Object

    Begin Object Class=GUIButton Name=aApply
        Caption="APPLY"
        WinWidth=0.097460
        WinLeft=0.902148
        WinHeight=0.033203
        WinTop=0.966146
        TabOrder=1
        bVisible=True
        OnClick=ButtonClicked
        StyleName="SquareButton"
        MenuState=MSAT_Disabled
        RenderWeight=1.0
    End Object

    t_Header=SettingHeader
    t_Footer=SettingFooter

	i_BkChar=BkCharnew

    WinWidth=1.0
    WinHeight=1.0
    WinTop=0.0
    WinLeft=0.0

    PanelCaption(0)="Display"
    PanelCaption(1)="Audio"
    PanelCaption(2)="Player"
    PanelCaption(3)="Game"
    PanelCaption(4)="Input"
    PanelCaption(5)="Weapons"
    PanelCaption(6)="HUD"

    PanelClass(0)="BN4GUI.BN4Tab_DetailSettings"
    PanelClass(1)="BN4GUI.BN4Tab_AudioSettings"
    PanelClass(2)="BN4GUI.BN4Tab_PlayerSettings"
    PanelClass(3)="BN4GUI.BN4Tab_GameSettings"
    PanelClass(4)="BN4GUI.BN4Tab_InputSettings"
    PanelClass(5)="BN4GUI.BN4Tab_WeaponSettings"
    PanelClass(6)="BN4GUI.BN4Tab_HudSettings"

    PanelHint(0)="Select your resolution or change your display and detail settings..."
    PanelHint(1)="Adjust your audio experience..."
    PanelHint(2)="Configure your UT2004 Avatar..."
    PanelHint(3)="Configure game and network related settings..."
    PanelHint(4)="Configure misc. input options..."
    PanelHint(5)="Adjust your weapon priorities and settings..."
    PanelHint(6)="Customize your HUD..."
 	InvalidStats="Invalid Stats Info"
    bApplyImmediately=True
}
