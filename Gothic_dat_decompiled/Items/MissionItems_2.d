
instance ItWrFocusmapPsi(C_Item)
{
	name = "Y'Berion's Focus Map";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocusmapPsi;
	description = name;
	text[1] = "This map shows the way to the focus";
	text[2] = "stone which Y'Berion needs to";
	text[3] = "invoke the Sleeper.";
};


func void UseFocusmapPsi()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_FocusPSI.tga",1);
	Doc_Show(nDocID);
};


instance Focus_1(C_Item)
{
	name = "Focus from the Ocean Cliff";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "One of the five focus stones";
	text[2] = "used to create the Magic Barrier.";
};

instance ItMi_Stuff_Gearwheel_01(C_Item)
{
	name = "Gearwheel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "It is from a broken ore masher which";
	text[1] = "was left in an abandoned side tunnel";
	text[2] = "of the Old Mine.";
};

instance ItAt_Crawlerqueen(C_Item)
{
	name = "Jajo pe³zacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Te jaja zosta³y z³o¿one przez";
	text[1] = "królow¹ pe³zaczy.";
	text[2] = "Zawieraj¹ o wiele silniejsz¹ wydzielinê,";
	text[3] = "ni¿ wnêtrznoœci doros³ych osobników.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFokusbuch(C_Item)
{
	name = "Almanac";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseItWrFokusbuch;
	description = name;
	text[0] = "This ancient magic book contains some";
	text[1] = "magic formulas which all refer to the use";
	text[2] = "of so-called focus stones.";
};


func void UseItWrFokusbuch()
{
	var int nDocID;
	if((book_almanach == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		book_almanach = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Chapter 23");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"The Focusing of Powers");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"The power inherent in the stone increases continuously and is unleashed by the words of the magician. Be it lasting or a single blow, this is within his judgment alone.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"But once unleashed, the focus becomes devoid of power, remaining but an empty shell.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"The words that must be spoken to unleash the power of a focus are accessible to many artists of arcane power. Even the knowledge of endowing a new artifact with magic powers has become more of a magical custom than a secret of the knowing.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"But only a chosen few have the knowledge needed to recharge a used focus stone. This formula of days long past serves as a sign of the high gift.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Now, oh knowing one, open your mind to the words of the ancient power.");
	Doc_Show(nDocID);
};

