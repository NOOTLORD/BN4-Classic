//=============================================================================
// Mut_TeamOutfitting.
//
// It's Loadout, but per-team.
//=============================================================================
class Mut_TeamOutfitting extends Mut_Ballistic
	transient
	HideDropDown
	CacheExempt
	config(BallisticProV55);

var() globalconfig string 			LoadOut[5];			// Loadout info saved seperately on each client
var() globalconfig int 				Layout[5];			// Layout number saved seperately on each client
var() globalconfig int 				Camo[5];			// Camo number saved seperately on each client

var   Array<ClientTeamOutfittingInterface>	COIPond;			// Jump right in, they won't bite - probably...
var   PlayerController						PCPendingCOI;	// The PlayerController that is about to get its COI

const NUM_GROUPS = 10;

//Would have preferred to use structs for this, but Random Weapon would have been a bitch.
var() globalconfig array<string>	RedLoadoutGroup0;	// Weapons available in Melee Box
var() globalconfig array<string>	RedLoadoutGroup1;	// Weapons available in Sidearm Box
var() globalconfig array<string>	RedLoadoutGroup2;	// Weapons available in Primary Box
var() globalconfig array<string>	RedLoadoutGroup3;	// Weapons available in Secondayr Box
var() globalconfig array<string>	RedLoadoutGroup4;	// Weapons available in Grenade Box
var() globalconfig array<string>	RedLoadoutGroup5;	// Killstreak One
var() globalconfig array<string>	RedLoadoutGroup6;	// Killstreak Two

var() globalconfig array<string>	BlueLoadoutGroup0;	// Weapons available in Melee Box
var() globalconfig array<string>	BlueLoadoutGroup1;	// Weapons available in Sidearm Box
var() globalconfig array<string>	BlueLoadoutGroup2;	// Weapons available in Primary Box
var() globalconfig array<string>	BlueLoadoutGroup3;	// Weapons available in Secondayr Box
var() globalconfig array<string>	BlueLoadoutGroup4;	// Weapons available in Grenade Box
var() globalconfig array<string>	BlueLoadoutGroup5;	// Killstreak One
var() globalconfig array<string>	BlueLoadoutGroup6;	// Killstreak Two


var() globalconfig bool				bAllowAllWeaponry; // Allow weaponry even if it's not present in the loadout groups

struct dummypos
{
	var array<byte> Positions;
};

var()  array<dummypos>	DummyGroups[NUM_GROUPS];

var   class<weapon>				NetLoadout0;
var   class<weapon>				NetLoadout1;
var   class<weapon>				NetLoadout2;
var   class<weapon>				NetLoadout3;
var   class<weapon>				NetLoadout4;
var   class<weapon>				NetLoadout5;

var   class<Weapon>			NetLoadoutWeapons[255];
var   byte							NetRedLoadoutGroups;

//Find and save the position of any dummy weapons (for random weapon)
function BeginPlay()
{
	local byte i, j, k;
	local class<BC_GameStyle> game_style;
	local WeaponList_Killstreak streaks;
	
	Super.BeginPlay();
	
	for (i=0; i < (NUM_GROUPS/2); i++)
		for (j=0; j < 2; j++)
			for (k=0; k < GetGroup(i,j).Length; k++)
				if (Right(GetGroup(i,j)[k], 5) ~= "Dummy")
					DummyGroups[i].Positions[DummyGroups[i].Positions.Length] = k;
				
	//Load in KS lists so that we'll allow their spawns
	game_style = class'BallisticGameStyles'.static.GetReplicatedStyle();

	log("Loading killstreak weapon list from "$game_style.default.StyleName);

	streaks = new(None, game_style.default.StyleName) class'WeaponList_Killstreak';

	RedLoadoutGroup5.Length = streaks.Streak1s.Length;
	RedLoadoutGroup6.Length = streaks.Streak2s.Length;
	BlueLoadoutGroup5.Length = streaks.Streak1s.Length;
	BlueLoadoutGroup6.Length = streaks.Streak2s.Length;

	for (i = 0; i < streaks.Streak1s.Length; ++i)
	{
		RedLoadoutGroup5[i] = streaks.Streak1s[i];
		BlueLoadoutGroup5[i] = streaks.Streak1s[i];
	}

	for (i = 0; i < streaks.Streak2s.Length; ++i)
	{
		RedLoadoutGroup6[i] = streaks.Streak2s[i];	
		BlueLoadoutGroup6[i] = streaks.Streak2s[i];	
	}
}
	
simulated function string GetGroupItem(byte GroupNum, int ItemNum, byte inTeam)
{
	if (inTeam == 1)
	{
		switch (GroupNum)
		{
			case	0:	return BlueLoadoutGroup0[ItemNum];
			case	1:	return BlueLoadoutGroup1[ItemNum];
			case	2:	return BlueLoadoutGroup2[ItemNum];
			case	3:	return BlueLoadoutGroup3[ItemNum];
			case	4:	return BlueLoadoutGroup4[ItemNum];
			case	3:	return BlueLoadoutGroup5[ItemNum];
			case	4:	return BlueLoadoutGroup6[ItemNum];
		}
	}
	else
	{
		switch (GroupNum)
		{
			case	0:	return RedLoadoutGroup0[ItemNum];
			case	1:	return RedLoadoutGroup1[ItemNum];
			case	2:	return RedLoadoutGroup2[ItemNum];
			case	3:	return RedLoadoutGroup3[ItemNum];
			case	4:	return RedLoadoutGroup4[ItemNum];
			case	3:	return RedLoadoutGroup5[ItemNum];
			case	4:	return RedLoadoutGroup6[ItemNum];
		}
	}
}

simulated function array<string> GetGroup(byte GroupNum, byte inTeam)
{
	if (inTeam == 1)
	{
		switch (GroupNum)
		{
			case	0:	return BlueLoadoutGroup0;
			case	1:	return BlueLoadoutGroup1;
			case	2:	return BlueLoadoutGroup2;
			case	3:	return BlueLoadoutGroup3;
			case	4:	return BlueLoadoutGroup4;
			case	5:	return BlueLoadoutGroup5;
			case	6:	return BlueLoadoutGroup6;
		}
	}
	else
	{
		switch (GroupNum)
		{
			case	0:	return RedLoadoutGroup0;
			case	1:	return RedLoadoutGroup1;
			case	2:	return RedLoadoutGroup2;
			case	3:	return RedLoadoutGroup3;
			case	4:	return RedLoadoutGroup4;
			case	5:	return RedLoadoutGroup5;
			case	6:	return RedLoadoutGroup6;
		}
	}
}

static function array<string> SGetGroup (byte GroupNum, byte inTeam)
{
	if (inTeam == 1)
	{
		switch (GroupNum)
		{
		case	0:	return default.BlueLoadoutGroup0;
		case	1:	return default.BlueLoadoutGroup1;
		case	2:	return default.BlueLoadoutGroup2;
		case	3:	return default.BlueLoadoutGroup3;
		case	4:	return default.BlueLoadoutGroup4;
		case	5:	return default.BlueLoadoutGroup5;
		case	6:	return default.BlueLoadoutGroup6;
		}
	}
	else
	{
		switch (GroupNum)
		{
		case	0:	return default.RedLoadoutGroup0;
		case	1:	return default.RedLoadoutGroup1;
		case	2:	return default.RedLoadoutGroup2;
		case	3:	return default.RedLoadoutGroup3;
		case	4:	return default.RedLoadoutGroup4;
		case	5:	return default.RedLoadoutGroup5;
		case	6:	return default.RedLoadoutGroup6;
		}
	}
}

// Give the players their weapons.
// Bots are equipped here.
function ModifyPlayer(Pawn Other)
{
	local int i;
	local class<weapon> W;
	local string Stuff[5];
	
	Super.ModifyPlayer(Other);
	
	if (Other.LastStartTime > Level.TimeSeconds + 2)
		return;
	//Bots get their weapons here.
	if (Other.Controller != None && Bot(Other.Controller) != None)
	{
		for (i=0;i<5;i++)
			Stuff[i] = GetGroup(i,Other.GetTeamNum())[Rand(GetGroup(i,Other.GetTeamNum()).length)];
		ChangeLoadout(Other, Stuff);
		for (i=2;i<5;i+=0)
		{
			if (Stuff[i] == "")
			{
				if (i == 0)
					i = 4;
				else if (i == 3)
					break;
				else
					i--;
				continue;
			}
			if (Right(Stuff[i], 5) ~= "Dummy")
				Stuff[i] = GetGroup(i, Other.GetTeamNum())[0];
			W = class<weapon>(DynamicLoadObject(Stuff[i],class'Class'));
			if (W == None)
			{
				if (i == 0)
					i = 4;
				else if (i == 3)
					break;
				else
					i--;
				continue;
			}
			SpawnWeaponLayout(W, Other, 255, 255); //Bots have random layouts

			if (i == 0)
				i = 4;
			else if (i == 3)
				break;
			else
				i--;
		}
	}
	else if (Other.Controller != None && PlayerController(Other.Controller) != None)
		for (i=0;i<COIPond.length;i++)
			if (COIPond[i].PC == Other.Controller)
			{	COIPond[i].ClientStartLoadout();	return;	}
}
	
// Use the console command "Mutate Loadout" to open the loadout menu
function Mutate(string MutateString, PlayerController Sender)
{
	local int i;

	if (MutateString ~= "Loadout" && Sender != None)
	{
		for (i=0;i<COIPond.length;i++)
		{
			if (COIPond[i].PC == Sender)
			{
				COIPond[i].ClientOpenLoadoutMenu();
				return;
			}
		}
		COIPond[i] = Spawn(class'ClientTeamOutfittinginterface',Sender);
		COIPond[i].Initialize(self, Sender);
	}
	
	super.Mutate(MutateString, Sender);
}

// Goes through inventory and gets rid of stuff that ain't in the loadout
function ChangeLoadout (Pawn P, out string Stuff[5], optional string OldStuff[5])
{

	local Inventory Inv;
	local int Count, i, j;
	local Array<Inventory> BadInv;
	for (Inv=P.Inventory; Inv!=None && Count < 1000; Inv=Inv.Inventory)
	{
		if (Weapon(Inv) != None && Translauncher(Inv)==None)
		{
			for (i=0;i<5;i++)
				if (OldStuff[i] ~= string(Inv.class))
				{
					for (j=0;j<5;j++)
						if (Stuff[j] ~= string(Inv.class))
						{
							Stuff[j] = "";
							break;
						}
					if (j>=5)
						BadInv[BadInv.length] = Inv;
					OldStuff[i] = "";
					break;
				}
		}
		Count++;
	}
	while (BadInv.length > 0)
	{
		if (BadInv[0] != None)
			BadInv[0].Destroy();
		BadInv.Remove(0, 1);
	}
}

// Makes sure client loadout is allowed, then cleans stuff out the inventory and adds the new weapons
function OutfitPlayer(Pawn Other, string Stuff[5], optional string OldStuff[5], optional int Layouts[5], optional int Camos[5])
{
	local byte i, j, k, m;
	local bool bMatch;
	local class<weapon> W;

	if (Vehicle(Other) != None && Vehicle(Other).Driver != None)
		Other = Vehicle(Other).Driver;

	// Make sure everything is legit
	for (i=0;i<5;i++)
	{
		// Random weapon handling
		// Tries ten times to pick a weapon which isn't a dummy
		// (i.e. itself) and doesn't match any previous weapon
		// if it fails to do so, returns the first weapon in the group
		if (GetItemName(Stuff[i]) ~= "RandomWeaponDummy")
		{
			for(j=0; j < 10; j++)
			{
				k = Rand(GetGroup(i, Other.GetTeamNum()).length - DummyGroups[i + (Other.GetTeamNum() * (NUM_GROUPS/2))].Positions.length); //FIXME
				
				for (m = 0; m < DummyGroups[i].Positions.Length; m++)
					if (k == DummyGroups[i].Positions[m])
						k++;
			
				Stuff[i] = GetGroup(i, Other.GetTeamNum())[k];
					
				bMatch = False;
					
				for (m=0; m<i; m++)
				{
					if (Stuff[i] ~= Stuff[m])
					{
						bMatch = True;
						break;
					}
				}

				if (!bMatch)
					break;

				else if (j == 9)
					Stuff[i] = GetGroup(i, Other.GetTeamNum())[0];
			}
		}
				
		for (j=0;j<GetGroup(i, Other.GetTeamNum()).length;j++)
			if (GetGroup(i, Other.GetTeamNum())[j] ~= Stuff[i])
				break;
		if (j >= GetGroup(i, Other.GetTeamNum()).length)
			Stuff[i] = GetGroup(i, Other.GetTeamNum())[Rand(GetGroup(i, Other.GetTeamNum()).length)];
	}
	// Clean out other weapons...
	ChangeLoadout(Other, Stuff, OldStuff);
	// Now spawn it all
	if (xPawn(Other) != None)
	{
		xPawn(Other).RequiredEquipment[0] = Stuff[1];
		xPawn(Other).RequiredEquipment[1] = Stuff[0];
	}
	
	for (i=2;i<5;i+=0)
	{
		if (Stuff[i] != "")
		{
			W = class<weapon>(DynamicLoadObject(Stuff[i],class'Class'));
			if (W == None)
				log("Could not load outfitted weapon "$Stuff[i]);
			else
				SpawnWeaponLayout(W, Other, Layouts[i], Camos[i]);
		}

		if (i == 0)
			i = 4;
		else if (i == 3)
			break;
		else
			i--;
	}
}

static function Weapon SpawnWeapon(class<weapon> newClass, Pawn P)
{
	local Weapon newWeapon;

    if( (newClass!=None) && P != None)
    {
		newWeapon = Weapon(P.FindInventoryType(newClass));
		if (newWeapon == None || BallisticHandgun(newWeapon) != None)
		{
			newWeapon = P.Spawn(newClass,,,P.Location);
			if( newWeapon != None )
				newWeapon.GiveTo(P);
			if (P.Weapon == None && P.PendingWeapon == None)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			
			return newWeapon;
		}
		else newWeapon.MaxOutAmmo(); //double loading
    }
	
	return None;
}

static function Weapon SpawnWeaponLayout(class<weapon> newClass, Pawn P, int LayoutIndex, int CamoIndex)
{
	local Weapon newWeapon;

    if( (newClass!=None) && P != None)
    {
		newWeapon = Weapon(P.FindInventoryType(newClass));
		if (newWeapon == None || BallisticHandgun(newWeapon) != None)
		{
			newWeapon = P.Spawn(newClass,,,P.Location);
			if( newWeapon != None )
			{
				if (BallisticWeapon(newWeapon) != None)
				{
					BallisticWeapon(newWeapon).GenerateLayout(LayoutIndex);
					BallisticWeapon(newWeapon).GenerateCamo(CamoIndex);
				}
				newWeapon.GiveTo(P);
			}
			if (P.Weapon == None && P.PendingWeapon == None)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			
			return newWeapon;
		}
		else newWeapon.MaxOutAmmo(); //double loading
    }
	
	return None;
}

// Do not spawn a default weapon yet...
function class<Weapon> MyDefaultWeapon()
{
	return None;
}

function Class<Inventory> GetInventoryClass(string InventoryClassName)
{
	return None;
}

simulated event Timer()
{
	super.Timer();
	if (PCPendingCOI == None)
		return;
	COIPond[COIPond.length] = Spawn(class'ClientTeamOutfittingInterface',PCPendingCOI);
	COIPond[COIPond.length-1].Initialize(self, PCPendingCOI);
	PCPendingCOI = None;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i, j, k;
	
	bSuperRelevant = 0;
	
	// Give players their COI. Everyone needs a COI, right?
	if (PlayerController(Other) != None)
	{
		if (PCPendingCOI != None)
			Timer();
		SetTimer(0.1, false);
		PCPendingCOI = PlayerController(Other);
	}

	else if (xPawn(Other) != None)
	{
		xPawn(Other).RequiredEquipment[0] = "";
		xPawn(Other).RequiredEquipment[1] = "";
		return true;
	}
	// Only allow weapons that are in the loadout groups
	else if (Weapon(Other) != None && (!Weapon(Other).bNoInstagibReplace) && Translauncher(Other)==None)
	{
		for (i=0;i<8;i++)
			for(j=0;j<2;j++)
				for (k=0;k<GetGroup(i,j).length;k++)
					if (GetGroup(i,j)[k] ~= string(Other.class))
						return true;
		return false;
	}
	
	// No weapon pickups unless they are dropped. Dropped BWs are owned by the weapon that dropped them
	else if (WeaponPickup(Other) != None && Other.Owner == None)
		return false;
	// No ammo pickups
	else if (Ammo(Other) != None && IP_AmmoPack(Other) == None)
	{
		Pickup(Other).myMarker.bBlocked = True;
		return false;
	}
	// Lockers replaced with ammo packs
	else if (WeaponLocker(Other) != None)
	{
		if (!SpawnNewItem(-1, Other, class'IP_AmmoPack'))
		{
			WeaponLocker(Other).myMarker.bBlocked = True;
			Other.GotoState('Disabled');
			return false;
		}
	}

	// No bases. Weapon pickups replaced with ammo packs
	else if (xWeaponBase(Other) != None)
	{
		if (!SpawnNewItem(-1, Other, class'IP_AmmoPack'))
			return false;
	}
	else if (xPickupBase(Other) != None)
	{
		Other.bHidden=true;
		if (xPickupBase(Other).myMarker != None)
			xPickupBase(Other).myMarker.bBlocked = True;
		if (xPickupBase(Other).myEmitter != None)
			xPickupBase(Other).myEmitter.Destroy();
	}
	// Do terrible, evil, horrendous ballistic deeds unto the other stuff
	return super.CheckReplacement(Other, bSuperRelevant);
}

//Don't allow this mutator to be used in one-team GTs
function bool MutatorIsAllowed()
{
    return Level.Game.bTeamGame;
}

defaultproperties
{
	 Layout(0)=0
	 Layout(1)=0
	 Layout(2)=0
	 Layout(3)=0
	 Layout(4)=0
	 Camo(0)=0
	 Camo(1)=0
	 Camo(2)=0
	 Camo(3)=0
	 Camo(4)=0
     LoadOut(0)=""
     LoadOut(1)=""
     LoadOut(2)=""
     LoadOut(3)=""
     LoadOut(4)=""
	 RedLoadoutGroup0(0)=
	 RedLoadoutGroup1(0)=
	 RedLoadoutGroup2(0)=
	 RedLoadoutGroup3(0)=
	 RedLoadoutGroup4(0)=
	 BlueLoadoutGroup0(0)=
	 BlueLoadoutGroup1(0)=
	 BlueLoadoutGroup2(0)=
	 BlueLoadoutGroup3(0)=
	 BlueLoadoutGroup4(0)=
     bHideLockers=True
     FriendlyName="BallisticPro: Team Loadout"
     Description="Team-based Ballistic Loadout."
}
