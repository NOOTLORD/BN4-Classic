//==============================================================================
//  Written by (NL)NOOTLORD 
//  New SP gametype tab to change some parts of the menu around
//==============================================================================
class BN4Tab_GameTypeSP extends UT2K4Tab_GameTypeSP;

DefaultProperties
{
	// Left Component Group
	Begin Object Class=GUISectionBackground Name=GameTypeLeftGroup
		WinWidth=0.482500
        WinHeight=0.941490
		WinLeft=0.023750
        WinTop=0.043125
        TabOrder=0
    	TopPadding=0.025
    	BottomPadding=0.025
        Caption="Available Game Types"
    End Object
    sb_Games=GameTypeLeftGroup

    Begin Object Class=GUIListBox Name=UT2004Games
		WinWidth=0.438457
		WinHeight=0.796982
		WinLeft=0.045599
		WinTop=0.144225
		bSorted=True
        bBoundToParent=True
        bScaleToParent=True
        bVisibleWhenEmpty=True
        OnChange=InternalOnChange
        StyleName="NoBackground"
        SelectedStyleName="ListSelection"
        FontScale=FNS_Large
        TabOrder=0
    End Object
    lb_Games=UT2004Games

	// Right component group
	Begin Object Class=GUISectionBackground Name=GameTypeRightGroup
        WinWidth=0.464649
        WinHeight=0.941490
        WinLeft=0.513243
        WinTop=0.043125
        Caption="Preview"
	End Object
	sb_Preview=GameTypeRightGroup

    Begin Object Class=GUILabel Name=NoPreview
		WinWidth=0.411862
		WinHeight=0.316545
		WinLeft=0.539224
		WinTop=0.142826
        TextFont="UT2HeaderFont"
        TextAlign=TXTA_Center
        VertAlign=TXTA_Center
        bMultiline=True
        bTransparent=False
        TextColor=(R=247,G=255,B=0,A=255)
        Caption="No Preview Available"
    End Object
    l_NoPreview=NoPreview

    Begin Object Class=GUIImage Name=GameTypePreview
		WinWidth=0.411862
		WinHeight=0.316545
		WinLeft=0.539224
		WinTop=0.142826
        ImageColor=(R=255,G=255,B=255,A=255)
        ImageStyle=ISTY_Scaled
        ImageRenderStyle=MSTY_Normal
        RenderWeight=0.2
    End Object
    i_GamePreview=GameTypePreview

    Begin Object Class=GUIScrollTextBox Name=GameTypeDescription
		WinWidth=0.362056
		WinHeight=0.325716
		WinLeft=0.565270
		WinTop=0.556774
        CharDelay=0.0025
        EOLDelay=0.5
        bNeverFocus=true
        StyleName="NoBackground"
        bNoTeletype=True
        bTabStop=False
    End Object
    lb_GameDesc=GameTypeDescription

	Begin Object class=AltSectionBackground name=Bk1
		WinWidth=0.419030
		WinHeight=0.474455
		WinLeft=0.535622
		WinTop=0.478553
		RenderWeight=0.3
	End Object
	i_BK=BK1

    GamePos(0)=(GameClass="UT2K4Assault.ASGameInfo",Weight=0)
    GamePos(1)=(GameClass="xGame.xDeathMatch",Weight=1)
	EpicGameCaption=""
	CustomGameCaption=""
}
