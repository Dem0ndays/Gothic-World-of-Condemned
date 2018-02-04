
const int Value_1H_Sword_01 = 100;

instance ItMw_1H_Club_01(C_Item)
{
	name = "Pa�ka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 2;
	damageTotal = 5;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Club_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Poker_01(C_Item)
{
	name = "Pogrzebacz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 3;
	damageTotal = 6;
	damagetype = DAM_BLUNT;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Poker_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sickle_01(C_Item)
{
	name = "Sierp";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 4;
	damageTotal = 7;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sickle_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMwPickaxe(C_Item)
{
	name = "Kilof";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 4;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sledgehammer_01(C_Item)
{
	name = "M�ot kowalski";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 5;
	damageTotal = 10;
	damagetype = DAM_BLUNT;
	range = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sledgehammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_Light_01(C_Item)
{
	name = "Pa�ka";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 5;
	damageTotal = 8;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Mace_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Hatchet_01(C_Item)
{
	name = "Siekiera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 6;
	damageTotal = 9;
	damagetype = DAM_EDGE;
	range = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Hatchet_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Old_01(C_Item)
{
	name = "Zardzewia�y miecz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 10;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Nailmace_01(C_Item)
{
	name = "Kij z gwo�dziem";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 13;
	damageTotal = 11;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Nailmace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_01(C_Item)
{
	name = "Kr�tki miecz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 15;
	damageTotal = 12;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 12;
	visual = "ItMw_1H_Sword_Short_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_02(C_Item)
{
	name = "Ch�opski miecz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 22;
	damageTotal = 14;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 14;
	visual = "ItMw_1H_Sword_Short_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_03(C_Item)
{
	name = "J�zyk topielca";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 16;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 16;
	visual = "ItMw_1H_Sword_Short_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_04(C_Item)
{
	name = "K�uj�cy cier�";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 35;
	damageTotal = 18;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 18;
	visual = "ItMw_1H_Sword_Short_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_05(C_Item)
{
	name = "Z�b Kopacza";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_Old_01(C_Item)
{
	name = "Wyszczerbiony top�r";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 25;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ItMw_1H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Scythe_01(C_Item)
{
	name = "Siekacz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 25;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_1H_Scythe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_01(C_Item)
{
	name = "Kostur";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 60;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_2H_Staff_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_02(C_Item)
{
	name = "Laska s�dziowska";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_2H_Staff_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_03(C_Item)
{
	name = "Laska kap�a�ska";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 200;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Staff_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_LightGuardsSword_03(C_Item)
{
	name = "Lekki miecz Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 60;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_lightguardssword_03_smith(C_Item)
{
	name = "Lekki miecz Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 70;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_01(C_Item)
{
	name = "Maczuga";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 55;
	damageTotal = 25;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_mace_01_smith(C_Item)
{
	name = "Maczuga";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_02(C_Item)
{
	name = "�wiekowana maczuga";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 27;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 22;
	visual = "ItMw_1H_Mace_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_03(C_Item)
{
	name = "��d�o krwiopijcy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 75;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Mace_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_04(C_Item)
{
	name = "Stalowy j�zyk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 85;
	damageTotal = 33;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 27;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_mace_04_smith(C_Item)
{
	name = "Stalowy j�zyk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 95;
	damageTotal = 38;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_01(C_Item)
{
	name = "Niewyko�czony miecz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = Value_1H_Sword_01;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_sword_01_smith(C_Item)
{
	name = "Niewyko�czony miecz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 110;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_02(C_Item)
{
	name = "Miecz s�dziego";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 95;
	damageTotal = 33;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 33;
	visual = "ItMw_1H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_03(C_Item)
{
	name = "Miecz Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 100;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_sword_03_smith(C_Item)
{
	name = "Miecz Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 120;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_04(C_Item)
{
	name = "Miecz bojowy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 130;
	damageTotal = 36;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
	visual = "ItMw_1H_Sword_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_05(C_Item)
{
	name = "Miecz wojenny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 150;
	damageTotal = 37;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 37;
	visual = "ItMw_1H_Sword_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_sword_05_smith(C_Item)
{
	name = "Miecz wojenny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 160;
	damageTotal = 42;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
	visual = "ItMw_1H_Sword_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_01(C_Item)
{
	name = "Morgensztern";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 125;
	damageTotal = 35;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_mace_war_01_smith(C_Item)
{
	name = "Morgensztern";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 125;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_02(C_Item)
{
	name = "�elazna maczuga";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 130;
	damageTotal = 36;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 31;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_mace_war_02_smith(C_Item)
{
	name = "�elazna maczuga";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 140;
	damageTotal = 41;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_03(C_Item)
{
	name = "�omotacz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 37;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_mace_war_03_smith(C_Item)
{
	name = "�omotacz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 160;
	damageTotal = 42;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 37;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_04(C_Item)
{
	name = "�amacz serc";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 600;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Mace_War_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_01(C_Item)
{
	name = "D�ugi miecz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 640;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Sword_Long_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_02(C_Item)
{
	name = "Miecz Strachu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 680;
	damageTotal = 42;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
	visual = "ItMw_1H_Sword_Long_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_03(C_Item)
{
	name = "Miecz Nienawi�ci";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 800;
	damageTotal = 44;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 44;
	visual = "ItMw_1H_Sword_Long_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_04(C_Item)
{
	name = "Miecz Zwyci�stwa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 860;
	damageTotal = 46;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 46;
	visual = "ItMw_1H_Sword_Long_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_05(C_Item)
{
	name = "Miecz �mierci";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 920;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_1H_Sword_Long_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_01(C_Item)
{
	name = "M�ot Ork�w";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_02(C_Item)
{
	name = "M�ot wojenny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_03(C_Item)
{
	name = "Boski m�ot";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_01(C_Item)
{
	name = "Top�r";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_AXE_01_SMITH(C_Item)
{
	name = "Top�r";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 160;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_02(C_Item)
{
	name = "Gruchotacz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 1200;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	visual = "ItMw_1H_Axe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_03(C_Item)
{
	name = "�amacz ko�ci";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Axe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_01(C_Item)
{
	name = "Miecz szeroki";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_1H_Sword_Broad_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_02(C_Item)
{
	name = "Wyrok wojownika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_1H_Sword_Broad_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_03(C_Item)
{
	name = "Szept burzy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_1H_Sword_Broad_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_04(C_Item)
{
	name = "R�ka Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1600;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_1H_Sword_Broad_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_1h_sword_broad_04_smith(C_Item)
{
	name = "R�ka Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1650;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_1H_Sword_Broad_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Old_01(C_Item)
{
	name = "Zardzewia�y miecz obur�czny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	visual = "ItMw_2H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_01(C_Item)
{
	name = "Zardzewia�y miecz p�torar�czny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1250;
	damageTotal = 48;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 48;
	visual = "ItMw_1H_Sword_Bastard_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_02(C_Item)
{
	name = "Rze�nik";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_1H_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_03(C_Item)
{
	name = "Kat";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_1H_Sword_Bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_04(C_Item)
{
	name = "Wrzask Berserkera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_1H_Sword_Bastard_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_01(C_Item)
{
	name = "Stary top�r bojowy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	visual = "ItMw_2H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_02(C_Item)
{
	name = "Krwawy �niwiarz";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_2H_Axe_Old_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_03(C_Item)
{
	name = "Stary s�dzia";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_Old_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_01(C_Item)
{
	name = "Lekki miecz dwur�czny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_2h_sword_light_01_smith(C_Item)
{
	name = "Lekki miecz dwur�czny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1600;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_02(C_Item)
{
	name = "Miecz nadzorcy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_2h_sword_light_02_smith(C_Item)
{
	name = "Miecz nadzorcy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1750;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_03(C_Item)
{
	name = "Ostrze Najemnika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_03_SMITH(C_Item)
{
	name = "Ostrze Najemnika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1850;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_04(C_Item)
{
	name = "Miecz kr�lewski";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_2h_sword_light_04_smith(C_Item)
{
	name = "Miecz kr�lewski";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1850;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Sword_Light_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_05(C_Item)
{
	name = "Miecz demon�w";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Sword_Light_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_01(C_Item)
{
	name = "Lekki top�r bojowy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_2h_axe_light_01_smith(C_Item)
{
	name = "Lekki top�r bojowy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_02(C_Item)
{
	name = "Grzmot";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_03(C_Item)
{
	name = "Chrz�st";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2520;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Axe_light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_01(C_Item)
{
	name = "Dwur�czniak";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_01_SMITH(C_Item)
{
	name = "Dwur�czniak";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2050;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_02(C_Item)
{
	name = "Ostrze bohatera";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_03(C_Item)
{
	name = "Krwawe ostrze";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_01(C_Item)
{
	name = "Ci�ki dwur�czniak";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_02(C_Item)
{
	name = "Gniewna stal";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_HEAVY_02_SMITH(C_Item)
{
	name = "Gniewna stal";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2250;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_03(C_Item)
{
	name = "W�ciek�a stal";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_04(C_Item)
{
	name = "M�ciwa stal";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_01(C_Item)
{
	name = "Top�r wojenny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Axe_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_2h_axe_heavy_01_smith(C_Item)
{
	name = "Top�r wojenny";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Axe_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_02(C_Item)
{
	name = "Krzyk wojownika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance itmw_2h_axe_heavy_02_smith(C_Item)
{
	name = "Krzyk wojownika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_03(C_Item)
{
	name = "Pi�� barbarzy�cy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_04(C_Item)
{
	name = "Pi�� trolla";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcSword01(C_Item)
{
	name = "Krush Varrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe01(C_Item)
{
	name = "Krush Pach";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 35;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe02(C_Item)
{
	name = "Krush UrRok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 38;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe03(C_Item)
{
	name = "Krush Agash";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe04(C_Item)
{
	name = "Krush BrokDar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 43;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcMace01(C_Item)
{
	name = "Krush Karrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 75;
	damagetype = DAM_BLUNT;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwOrcstaff(C_Item)
{
	name = "Grachtnakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwUdOrcstaff(C_Item)
{
	name = "ShaBaNakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_06(C_Item)
{
	name = "Zardzewia�y szpon z�bacza";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 50;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "DB_ItMw_1H_Sword_Short_Rep_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_04(C_Item)
{
	name = "Cienisty tasak";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "DB_ItMw_2H_Sword_Smith_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_06(C_Item)
{
	name = "Szept Zag�ady";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "DB_Itmw_1H_Sword_Bastard_Smith_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance scorpio_crossbow(C_Item)
{
	name = "Lekka kusza";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 60;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItRwCrossbow1.mms";
	owner = GRD_205_Scorpio;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance fletcher_sword(C_Item)
{
	name = "Lekki miecz Stra�nika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	owner = GRD_255_Fletcher;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance slys_sword(C_Item)
{
	name = "Z�b Kopacza";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	owner = STT_315_Sly;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance RODRIGUEZ_STAFF(C_Item)
{
	name = "Kostur";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_2H_Staff_01.3DS";
	owner = KDF_400_Rodriguez;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

