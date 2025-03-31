//==================================================================================
//  Written by (NL)NOOTLORD 
//  New main SP tab to change some stuff around
//==================================================================================
class BN4Tab_MainSP extends UT2K4Tab_MainSP;

defaultproperties
{
    Begin Object class=GUISectionBackground Name=SelectionGroup
		WinWidth=0.482149
		WinHeight=0.603330
		WinLeft=0.016993
		WinTop=0.018125
		Caption="Map Selection"
		bFillClient=true
    End Object
    sb_Selection=SelectionGroup

    Begin Object Class=GUITreeListBox Name=AvailableMaps
		WinWidth=0.422481
		WinHeight=0.449870
		WinLeft=0.045671
		WinTop=0.169272
        bVisibleWhenEmpty=true
        Hint="Click a mapname to see a preview and description.  Double-click to play a match on the map."
        StyleName="NoBackground"
        TabOrder=0
        OnChange=MapListChange
        bBoundToParent=false
        bScaleToParent=false
    End Object
    lb_Maps=AvailableMaps

    Begin Object class=GUISectionBackground Name=PreviewGroup
		WinWidth=0.470899
		WinHeight=0.974305
		WinLeft=0.515743
		WinTop=0.018125
		Caption="Preview"
		bFillClient=true
    End Object
    sb_Preview=PreviewGroup

    Begin Object Class=GUILabel Name=NoPreview
		WinWidth=0.372002
		WinHeight=0.357480
		WinLeft=0.562668
		WinTop=0.107691
        TextFont="UT2HeaderFont"
        TextAlign=TXTA_Center
        VertAlign=TXTA_Center
        bMultiline=True
        bTransparent=False
        TextColor=(R=247,G=255,B=0,A=255)
        Caption="No Preview Available"
    End Object
    l_NoPreview=NoPreview

    Begin Object Class=GUIImage Name=MapPreviewImage
		WinWidth=0.372002
		WinHeight=0.357480
		WinLeft=0.562668
		WinTop=0.107691
        ImageColor=(R=255,G=255,B=255,A=255)
        ImageStyle=ISTY_Scaled
        ImageRenderStyle=MSTY_Normal
        RenderWeight=0.2
    End Object
    i_MapPreview=MapPreviewImage

    Begin Object class=GUILabel Name=MapAuthorLabel
        Caption="Testing"
        TextAlign=TXTA_Center
        StyleName="TextLabel"
		WinWidth=0.453285
		WinHeight=0.032552
		WinLeft=0.522265
		WinTop=0.405278
        RenderWeight=0.3
    End Object
    l_MapAuthor=MapAuthorLabel

    Begin Object class=GUILabel Name=RecommendedPlayers
        Caption="Best for 4 to 8 players"
        TextAlign=TXTA_Center
        StyleName="TextLabel"
		WinWidth=0.445313
		WinHeight=0.032552
		WinLeft=0.521288
		WinTop=0.474166
       RenderWeight=0.3
    End Object
    l_MapPlayers=RecommendedPlayers

	Begin Object class=AltSectionBackground name=ScrollSection
		WinWidth=0.409888
		WinHeight=0.437814
		WinLeft=0.546118
		WinTop=0.525219
		Caption="Map Desc"
		bFillClient=true
	End Object
	asb_Scroll=ScrollSection

    Begin Object Class=GUIScrollTextBox Name=MapDescription
		WinWidth=0.379993
		WinHeight=0.268410
		WinLeft=0.561065
		WinTop=0.628421
        CharDelay=0.0025
        EOLDelay=0.5
        bNeverFocus=true
        StyleName="NoBackground"
        bTabStop=False
    End Object
    lb_MapDesc=MapDescription

	Begin Object Class=GUISectionBackground Name=OptionsGroup
		WinWidth=0.482149
		WinHeight=0.351772
		WinLeft=0.018008
		WinTop=0.642580
		Caption="Options"
		BottomPadding=0.07
	End Object
	sb_Options=OptionsGroup

    Begin Object Class=moCheckbox Name=FilterCheck
    	OnChange=ChangeMapFilter
		WinWidth=0.341797
		WinHeight=0.030035
		WinLeft=0.051758
		WinTop=0.772865
    	Caption="Only Official Maps"
    	Hint="Hides all maps not created by Epic or Digital Extremes."
    	TabOrder=1
    	bAutoSizeCaption=True
    	ComponentWidth=0.9
    	CaptionWidth=0.1
    	bSquare=True
    End Object
	ch_OfficialMapsOnly=FilterCheck

    Begin Object Class=moButton Name=MaplistButton
		WinWidth=0.341797
		WinHeight=0.05
		WinLeft=0.039258
		WinTop=0.888587
    	ButtonCaption="Maplist Configuration"
    	Hint="Modify the maps that should be used in gameplay"
    	OnChange=MaplistConfigClick
    	TabOrder=2
    	ComponentWidth=1.0
    End Object
    b_Maplist=MaplistButton

    Begin Object Class=moButton Name=TutorialButton
    	OnChange=TutorialClicked
		WinWidth=0.348633
		WinHeight=0.05
		WinLeft=0.556953
		WinTop=0.913326
//		OnCreateComponent=InternalOnCreateComponent
    	ButtonCaption="Watch Game Tutorial"
    	ButtonStyleName="SquareButton"
    	Hint="Watch the tutorial for this gametype."
    	ComponentWidth=1.0
    	TabOrder=3
    End Object
    b_Tutorial=TutorialButton

	MapCaption="Maps"
	BonusVehicles=" (Bonus Vehicles)"
	BonusVehiclesMsg="(Includes Bonus Vehicles)|"
}
