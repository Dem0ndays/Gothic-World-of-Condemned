
const int Value_Zähne = 10;
const int Value_Krallen = 15;
const int Value_Wolfsfell = 10;
const int Value_Orkhundfell = 15;
const int Value_Panzerplatte = 50;
const int Value_Crawlerzangen = 10;
const int Value_Shadowbeastfell = 100;
const int Value_Lurkerklaue = 15;
const int Value_Lurkerhaut = 25;
const int Value_Sumpfhaihaut = 100;
const int Value_Trollfell = 200;
const int Value_Flügel = 15;
const int Value_Stachel = 25;
const int Value_Feuerzunge = 500;
const int Value_Sumpfhaizähne = 500;
const int Value_Shadowbeasthorn = 500;
const int Value_Trollhauer = 500;
const int Value_Steinherz = 1000;
const int Value_Feuerherz = 1000;
const int Value_Eisherz = 1000;
const int Value_Eistueck = 100;

instance ItAt_Teeth_01(C_Item)
{
	name = "Teeth";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zähne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Zähne;
};

instance ItAt_Wolf_01(C_Item)
{
	name = "Wolfskin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Wolfsfell;
};

instance itat_blackwolf_01(C_Item)
{
	name = "Skin of a Black Wolf";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeastfell;
};

instance ItAt_Wolf_02(C_Item)
{
	name = "Skin of an Orc Dog";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Orkhundfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Orkhundfell;
};

instance ItAt_Waran_01(C_Item)
{
	name = "Tongue of Fire";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Feuerzunge;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Feuerzunge;
};

instance ItAt_Claws_01(C_Item)
{
	name = "Claws";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Krallen;
};

instance ItAt_Crawler_02(C_Item)
{
	name = "Armor Plate";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Panzerplatte;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = "The armor plate of a minecrawler";
	text[4] = NAME_Value;
	count[4] = Value_Panzerplatte;
};

instance ItAt_Crawler_01(C_Item)
{
	name = "Mandibles of a Crawler";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Crawlerzangen;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Crawlerzangen;
};

instance ItAt_Shadow_01(C_Item)
{
	name = "Skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeastfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = "Skin of a Shadowbeast";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeastfell;
};

instance ItAt_Shadow_02(C_Item)
{
	name = "Horn";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = "Horn of a Shadowbeast";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeasthorn;
};

instance ItAt_Lurker_01(C_Item)
{
	name = "Lurker's Claws";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerklaue;
};

instance ItAt_Lurker_02(C_Item)
{
	name = "Lurker's Skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerhaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerhaut;
};

instance ItAt_Troll_02(C_Item)
{
	name = "Troll Tusk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Trollhauer;
};

instance ItAt_Troll_01(C_Item)
{
	name = "Troll Skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Trollfell;
};

instance ItAt_Swampshark_01(C_Item)
{
	name = "Skin of a Swampshark";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaihaut;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Sumpfhaihaut;
};

instance ItAt_Swampshark_02(C_Item)
{
	name = "Teeth of a Swampshark";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaizähne;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Sumpfhaizähne;
};

instance ItAt_Bloodfly_01(C_Item)
{
	name = "Wings";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flügel;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Flügel;
};

instance ItAt_Bloodfly_02(C_Item)
{
	name = "Bloodfly Sting";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stachel;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Stachel;
};

instance ItAt_StoneGolem_01(C_Item)
{
	name = "Heart of a Stone Golem";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = Value_Steinherz;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "This heart stems from the remains";
	text[1] = "of a defeated stone golem.";
	text[2] = "It has the power to hurl a foe";
	text[3] = "through the air.";
	text[5] = NAME_Value;
	count[5] = Value_Steinherz;
};

instance ItAt_FireGolem_01(C_Item)
{
	name = "Heart of a Fire Golem";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = Value_Feuerherz;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "This heart stems from the remains";
	text[1] = "of a defeated fire golem.";
	text[2] = "It has the power to set a foe";
	text[3] = "on fire.";
	text[5] = NAME_Value;
	count[5] = Value_Feuerherz;
};

instance ItAt_IceGolem_01(C_Item)
{
	name = "Heart of an Ice Golem";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = Value_Eisherz;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "This heart stems from the remains";
	text[1] = "of a defeated ice golem.";
	text[2] = "It has the power to freeze a foe.";
	text[5] = NAME_Value;
	count[5] = Value_Eisherz;
};

instance ItAt_IceGolem_02(C_Item)
{
	name = "Piece of an Ice Golem";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = Value_Eistueck;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "This is a fragment of";
	text[1] = "a defeated ice golem.";
	text[4] = NAME_Value;
	count[4] = Value_Eistueck;
};

