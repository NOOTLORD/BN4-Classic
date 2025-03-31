//==================================================================================
//  Written by (NL)NOOTLORD 
//  New main menu to remove some buttons i don't need and change some stuff around
//==================================================================================
class BN4MainMenu extends UT2K4GUIPage;

#exec OBJ LOAD FILE=InterfaceContent.utx
#exec OBJ LOAD FIlE=2K4Menus.utx
#exec OBJ LOAD FIlE=2K4MenuSounds.uax
/*
	Variable Name Legend

	l_ 	GUILabel			lb_	GUIListBox
	i_ 	GUIImage			li_	GUIList
	b_	GUIButton			tp_	GUITabPanel
	t_	GUITitleBar			sp_	GUISplitter
	c_	GUITabControl
	p_	GUIPanel

	ch_	moCheckBox
	co_	moComboBox
	nu_	moNumericEdit
	ed_	moEditBox
	fl_	moFloatEdit
	sl_ moSlider
*/

var automated   BackgroundImage i_Background;
var automated	GUIImage 	    i_TV; //Only really here to stop the timer function from breaking :)

var automated 	GUIButton	b_MultiPlayer, b_Host,
							b_InstantAction, b_Settings, b_Quit;

var automated	GUILabel	BN4VersionInfo;

var bool	bAllowClose;

var GUIButton Selected;
var() bool bNoInitDelay;

var() config string MenuSong;

var bool bNewNews;
var float FadeTime;
var bool  FadeOut;

var localized string FireWallTitle, FireWallMsg;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.InitComponent(MyController, MyOwner);

	Background=MyController.DefaultPens[0];
	if (PlayerOwner().Level.IsDemoBuild())
	{
		b_MultiPlayer.SetFocus(none);
	}
}

event Timer()
{
	bNoInitDelay = true;
    if (!Controller.bQuietMenu)
	    PlayerOwner().PlaySound(SlideInSound,SLOT_None);
    i_TV.Animate(-0.000977, 0.332292, 0.35);
    i_TV.OnEndAnimation = MenuIn_OnArrival;
}

function MenuIn_OnArrival(GUIComponent Sender, EAnimationType Type)
{
	Sender.OnArrival = none;
	if ( bAnimating )
		return;

    if (!Controller.bQuietMenu)
	    PlayerOwner().PlaySound(FadeInSound);

	b_Multiplayer.Animate(0.012284,0.289235,0.45);
    b_Multiplayer.OnArrival = PlayPopSound;
	b_Host.Animate(0.012284,0.334808,0.5);
    b_Host.OnArrival = PlayPopSound;
	b_InstantAction.Animate(0.012284,0.380381,0.55);
    b_InstantAction.OnArrival = PlayPopSound;
	b_Settings.Animate(0.795805,0.940278,0.6);
    b_Settings.OnArrival = PlayPopSound;
	b_Quit.Animate(0.932524,0.940278,0.65);
    b_Quit.OnArrival = MenuIn_Done;
}

event Opened(GUIComponent Sender)
{
	if ( bDebugging )
		log(Name$".Opened()   Sender:"$Sender,'Debug');

    if ( Sender != None && PlayerOwner().Level.IsPendingConnection() )
    	PlayerOwner().ConsoleCommand("CANCEL");

    Super.Opened(Sender);

	bNewNews = class'GUI2K4.UT2K4Community'.default.ModRevLevel != class'GUI2K4.UT2K4Community'.default.LastModRevLevel;
	FadeTime=0;
	FadeOut=true;

    Selected = none;

    // Reset the animations of all components
    i_TV.Animate(-0.000977, 1.668619, 0);
	b_Multiplayer.Animate(1.3,0.002777,0);
	b_Host.Animate(1.45,0.002734,0);
	b_InstantAction.Animate(1.6,0.705859,0);
	b_Settings.Animate(1.75,0.800327,0);
	b_Quit.Animate(1.9,0.887567,0);
}

function MenuIn_Done(GUIComponent Sender, EAnimationType Type)
{
	Sender.OnArrival = none;
    PlayPopSound(Sender,Type);
}

function PlayPopSound(GUIComponent Sender, EAnimationType Type)
{
    if (!Controller.bQuietMenu)
		PlayerOwner().PlaySound(PopInSound);
}

function MainReopened()
{
	if ( !PlayerOwner().Level.IsPendingConnection() )
	{
		Opened(none);
		Timer();
	}
}

function InternalOnOpen()
{
    if (bNoInitDelay)
    	Timer();
    else
	    SetTimer(0.5,false);

	Controller.PerformRestore();
    PlayerOwner().ClientSetInitialMusic(MenuSong,MTRAN_Segue);
}

function OnClose(optional Bool bCancelled)
{
}

function bool MyKeyEvent(out byte Key,out byte State,float delta)
{
	if(Key == 0x1B && state == 1)	// Escape pressed
		bAllowClose = true;

	return false;
}

function bool CanClose(optional bool bCancelled)
{
	if(bAllowClose)
		ButtonClick(b_Quit);

	bAllowClose = False;
	return PlayerOwner().Level.IsPendingConnection();
}

function MoveOn()
{
	switch (Selected)
	{
		case b_MultiPlayer:
			if ( !Controller.AuthroizeFirewall() )
			{
				Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox",FireWallTitle,FireWallMsg);
				return;
			}
			Profile("ServerBrowser");
			Controller.OpenMenu(Controller.GetServerBrowserPage());
			Profile("ServerBrowser");
			return;

		case b_Host:
			if ( !Controller.AuthroizeFirewall() )
			{
				Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox",FireWallTitle,FireWallMsg);
				return;
			}
			Profile("MPHost");
			Controller.OpenMenu(Controller.GetMultiplayerPage());
			Profile("MPHost");
			return;

		case b_InstantAction:
			Profile("InstantAction");
			Controller.OpenMenu(Controller.GetInstantActionPage());
			Profile("InstantAction");
			return;

		case b_Settings:
			Profile("Settings");
        	Controller.OpenMenu(Controller.GetSettingsPage());
			Profile("Settings");
			return;

		case b_Quit:
			Profile("Quit");
        	Controller.OpenMenu(Controller.GetQuitPage());
			Profile("Quit");
			return;

		default:
			StopWatch(True);
	}
}

function bool ButtonClick(GUIComponent Sender)
{
	if (GUIButton(Sender) != None)
		Selected = GUIButton(Sender);

	if (Selected==None)
    	return false;

	InitAnimOut( i_TV, -0.000977, 1.668619, 0.35);
	InitAnimOut(b_Multiplayer,1.15,0.449282,0.35);
	InitAnimOut(b_Host,1.3,0.534027,0.35);
	InitAnimOut(b_InstantAction,1.45,0.618619,0.35);
	InitAnimOut(b_Settings,1.75,0.800327,0.35);
	InitAnimOut(b_Quit,1.9,0.887567,0.35);

    return true;
}

function InitAnimOut( GUIComponent C, float X, float Y, float Z )
{
	if ( C == None )
	{
		Warn("BN4MainMenu.InitAnimOut called with null component!");
		return;
	}

	C.Animate(X,Y,Z);
	C.OnEndAnimation = MenuOut_Done;
}

function MenuOut_Done(GUIComponent Sender, EAnimationType Type)
{
	Sender.OnArrival = none;
	if ( bAnimating )
		return;

    MoveOn();
}

function bool MyOnDraw(Canvas Canvas)
{
	local GUIButton FButton;
    local int i,x2;
    local float XL,YL;
	local float DeltaTime;

    if (bAnimating || !Controller.bCurMenuInitialized )
    	return false;

    DeltaTime=Controller.RenderDelta;

    for (i=0;i<Controls.Length;i++)
    {
    	if ( (GUIButton(Controls[i])!=None) )
        {

 			FButton = GUIButton(Controls[i]);
            if (FButton.Tag>0 && FButton.MenuState!=MSAT_Focused)
            {
            	FButton.Tag -= 784*DeltaTime;
                if (FButton.Tag<0)
                	FButton.Tag=0;
            }
			else if (FButton.MenuState==MSAT_Focused)
            	FButton.Tag=200;

            if (FButton.Tag>0)
            {
	            fButton.Style.TextSize(Canvas,MSAT_Focused, FButton.Caption,XL,YL,FButton.FontScale);
	            x2 = FButton.ActualLeft() + XL + 16;
	            Canvas.Style=5;
	            Canvas.SetDrawColor(255,255,255,FButton.Tag);
	            Canvas.SetPos(0,fButton.ActualTop());
				Canvas.DrawTilePartialStretched(material'Highlight',x2,FButton.ActualHeight());
            }
        }
    }

    return false;
}

event bool NotifyLevelChange()
{
	if ( bDebugging )
		log(Name@"NotifyLevelChange  PendingConnection:"$PlayerOwner().Level.IsPendingConnection());

	return PlayerOwner().Level.IsPendingConnection();
}


function bool CommunityDraw(canvas c)
{
	return false;
}

defaultproperties
{
	bDebugging=True
	OnOpen=InternalOnOpen
	OnCanClose=CanClose
	OnKeyEvent=MyKeyEvent
    OnReopen=MainReopened

	Begin Object Class=BackgroundImage Name=PageBackground
		Image=material'2K4Menus.Controls.mmbgnd'
		ImageStyle=ISTY_Scaled
		ImageRenderStyle=MSTY_Alpha
        X1=0
        Y1=0
        X2=1024
        Y2=768
	End Object

	Begin Object Class=GUIImage Name=ImgTV
//		Image=material'2K4Menus.MainMenu.ActionFB'
//		Image=material'ULogo.MainMenu.CornerMenuFinal'
		ImageStyle=ISTY_Scaled
		WinWidth=0.000000
		WinHeight=0.000000
		WinLeft=0.000000
		WinTop=0.000000
        RenderWeight=0.000000
        X1=0
        Y1=0
        X2=0
        Y2=0
	End Object

	Begin Object Class=GUIButton Name=MultiplayerButton
	    FontScale=FNS_Large
		StyleName="TextButton"
		Caption="Join Game"
        CaptionEffectStylename="TextButtonEffect"
        CaptionAlign=TXTA_Left
		Hint=""
		OnClick=ButtonClick
		WinWidth=0.147204
		WinHeight=0.037760
		WinLeft=0.012284
		WinTop=0.289235
		bFocusOnWatch=true
        TabOrder=1
		bUseCaptionHeight=true
	End Object

	Begin Object Class=GUIButton Name=HostButton
	    FontScale=FNS_Large
		StyleName="TextButton"
		Caption="Host Game"
        CaptionEffectStylename="TextButtonEffect"
        CaptionAlign=TXTA_Left
		Hint=""
		OnClick=ButtonClick
		WinWidth=0.153498
		WinHeight=0.037760
		WinLeft=0.012507
		WinTop=0.334808
		bFocusOnWatch=true
        TabOrder=2
		bUseCaptionHeight=true
	End Object

	Begin Object Class=GUIButton Name=InstantActionButton
	    FontScale=FNS_Large
		StyleName="TextButton"
		Caption="Instant Action"
        CaptionEffectStylename="TextButtonEffect"
        CaptionAlign=TXTA_Left
		Hint=""
		OnClick=ButtonClick
		WinWidth=0.203041
		WinHeight=0.037760
		WinLeft=0.013484
		WinTop=0.380381
		bFocusOnWatch=true
        TabOrder=3
		bUseCaptionHeight=true
	End Object

	Begin Object Class=GUIButton Name=SettingsButton
	    FontScale=FNS_Large
		StyleName="TextButton"
		Caption="Settings"
        CaptionEffectStylename="TextButtonEffect"
        CaptionAlign=TXTA_Left
		Hint=""
		OnClick=ButtonClick
		WinWidth=0.116611
		WinHeight=0.037760
		WinLeft=0.795805
		WinTop=0.940278
		bFocusOnWatch=true
        TabOrder=5
		bUseCaptionHeight=true
	End Object

	Begin Object Class=GUIButton Name=QuitButton
	    FontScale=FNS_Large
		StyleName="TextButton"
		Caption="Exit"
        CaptionEffectStylename="TextButtonEffect"
        CaptionAlign=TXTA_Left
		Hint=""
		OnClick=ButtonClick
		WinWidth=0.058017
		WinHeight=0.037760
		WinLeft=0.932524
		WinTop=0.940278
		bFocusOnWatch=true
        TabOrder=6
		bUseCaptionHeight=true
	End Object

     Begin Object Class=GUILabel Name=BN4Versionlabel
	    Caption="Version: 0.0.1 ALPHA "
        TextColor=(R=255,G=255,B=255,A=140)
        TextFont="UT2SmallFont"
        WinTop=0.950000
        WinWidth=0.560000
        WinHeight=0.050000
     End Object	
	
	i_Background=PageBackground
    i_TV=ImgTV
	b_MultiPlayer=MultiplayerButton
	b_Host=HostButton
	b_InstantAction=InstantActionButton
	b_Settings=SettingsButton
	b_Quit=QuitButton
	BN4VersionInfo=BN4Versionlabel
	WinWidth=1.0
	WinHeight=1.0
	WinTop=0.0
	WinLeft=0.0
	bRenderWorld=False
	bAllowClose=False
	bAllowedAsLast=true
	bDisconnectOnOpen=true
    MenuSong="KR-UT2004-Menu"
    FireWallTitle="Important"
    FireWallMsg="It has been determined that the Window's Firewall is enabled and that UT2004 is not yet authorized to connect to the internet.  Authorization is required in order to use the online components of the game.  Please refer to the README.TXT for more information."
}
