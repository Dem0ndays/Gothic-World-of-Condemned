
const int ARMOR_VALUE_MULTIPLIER = 30;
const int value_tpl_armor_l = 1350;
const int value_tpl_armor_m = 1650;
const int value_tpl_armor_h = 2100;
const int value_stt_armor_m = 750;
const int value_stt_armor_h = 1200;
const int value_grd_armor_l = 1350;
const int value_grd_armor_m = 1650;
const int value_grd_armor_h = 2100;
const int value_kdf_armor_l = 1200;
const int value_kdf_armor_h = 1500;
const int value_kdw_armor_l = 1950;
const int value_kdw_armor_h = 2100;
const int value_org_armor_l = 750;
const int value_org_armor_m = 1050;
const int value_org_armor_h = 1200;
const int value_sld_armor_l = 1350;
const int value_sld_armor_m = 1650;
const int value_sld_armor_h = 2100;
const int value_nov_armor_l = 750;
const int value_nov_armor_m = 1050;
const int value_nov_armor_h = 1200;
const int value_vlk_armor_l = 250;
const int value_vlk_armor_m = 500;
const int value_sfb_armor_l = 250;
const int VALUE_GUR_ARMOR_M = 1950;
const int VALUE_GUR_ARMOR_H = 2100;
const int VALUE_NON_ARMOR_L = 1700;
const int VALUE_NON_ARMOR_K = 600;
const int value_non_armor_n = 1250;
const int VALUE_NON_ARMOR_W = 2050;
const int value_non_armor_u = 800;
const int VALUE_DMB_ARMOR_M = 2600;
const int VALUE_DMB_ARMOR_UPGRADE = 2800;
const int VALUE_GUR_ARMOR_UPGRADE = 2600;

instance vlk_armor_l(C_Item)
{
	name = "Light Digger's Trousers";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_l;
	wear = WEAR_TORSO;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance vlk_armor_m(C_Item)
{
	name = "Digger's Trousers";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_m;
	wear = WEAR_TORSO;
	visual = "vlkm.3ds";
	visual_change = "Hum_VLKM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance stt_armor_m(C_Item)
{
	name = "Shadow's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_m;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance stt_armor_h(C_Item)
{
	name = "Shadow's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_h;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_STTS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance grd_armor_l(C_Item)
{
	name = "Light Guard's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_l;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance grd_armor_m(C_Item)
{
	name = "Guard's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_m;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance grd_armor_h(C_Item)
{
	name = "Heavy Guard's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_h;
	wear = WEAR_TORSO;
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ebr_armor_m(C_Item)
{
	name = "Robe of State";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	visual = "ebrm.3ds";
	visual_change = "Hum_EBRM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ebr_armor_h(C_Item)
{
	name = "Gomez' Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 85;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 42;
	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	owner = EBR_100_Gomez;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ebr_armor_h2(C_Item)
{
	name = "Heavy Ore Baron's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	visual = "ebrh2.3ds";
	visual_change = "Hum_EBRS_ARMOR2.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance sfb_armor_l(C_Item)
{
	name = "Digger's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_sfb_armor_l;
	wear = WEAR_TORSO;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance org_armor_l(C_Item)
{
	name = "Light Rogue's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	value = value_org_armor_l;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance org_armor_m(C_Item)
{
	name = "Rogue's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_m;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance org_armor_h(C_Item)
{
	name = "Heavy Rogue's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = value_org_armor_h;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance sld_armor_l(C_Item)
{
	name = "Light Mercenary's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = value_sld_armor_l;
	wear = WEAR_TORSO;
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance sld_armor_m(C_Item)
{
	name = "Mercenary's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 5;
	value = value_sld_armor_m;
	wear = WEAR_TORSO;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance sld_armor_h(C_Item)
{
	name = "Heavy Mercenary's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 10;
	value = value_sld_armor_h;
	wear = WEAR_TORSO;
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance nov_armor_l(C_Item)
{
	name = "Novice's Loincloth";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	value = value_nov_armor_l;
	wear = WEAR_TORSO;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance nov_armor_m(C_Item)
{
	name = "Light Novice's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 10;
	wear = WEAR_TORSO;
	value = value_nov_armor_m;
	visual = "novm.3ds";
	visual_change = "Hum_NOVM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance nov_armor_h(C_Item)
{
	name = "Novice's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = value_nov_armor_h;
	wear = WEAR_TORSO;
	visual = "novh.3ds";
	visual_change = "Hum_NOVS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance tpl_armor_l(C_Item)
{
	name = "Light Templar's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = value_tpl_armor_l;
	wear = WEAR_TORSO;
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance tpl_armor_m(C_Item)
{
	name = "Templar's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_m;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance tpl_armor_h(C_Item)
{
	name = "Heavy Templar's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_h;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance gur_armor_m(C_Item)
{
	name = "Guru's Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 20;
	value = value_gur_armor_m;
	wear = WEAR_TORSO;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance gur_armor_h(C_Item)
{
	name = "High Robe of the Gurus";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 25;
	wear = WEAR_TORSO;
	value = value_gur_armor_h;
	visual = "gurh.3ds";
	visual_change = "Hum_GURS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance kdf_armor_l(C_Item)
{
	name = "Fire Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 5;
	wear = WEAR_TORSO;
	value = value_kdf_armor_l;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance kdf_armor_h(C_Item)
{
	name = "High Robe of Fire";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance kdw_armor_l(C_Item)
{
	name = "Water Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 15;
	value = value_kdw_armor_l;
	wear = WEAR_TORSO;
	visual = "kdwl.3ds";
	visual_change = "Hum_KDWL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance kdw_armor_h(C_Item)
{
	name = "High Robe of Water";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h;
	visual = "kdwh.3ds";
	visual_change = "Hum_KDWS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance dmb_armor_m(C_Item)
{
	name = "Robe of the Dark Arts";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 30;
	wear = WEAR_TORSO;
	value = value_dmb_armor_m;
	ownerGuild = GIL_DMB;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance crw_armor_h(C_Item)
{
	name = "Crawler Plate Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "crws.3ds";
	visual_change = "Hum_CRAWLER_ARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ore_armor_m(C_Item)
{
	name = "Ancient Ore Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[0] = "This ancient armor was made of magic ore.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ore_armor_h(C_Item)
{
	name = "Improved Ore Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 105;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 105;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[0] = "Stone, the smith, even managed to improve it!";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance law_armor(C_Item)
{
	name = "Judge's Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 2;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_DMB;
	visual = "dmbm.3ds";
	visual_change = "Hum_LAW_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance grd_armor_i(C_Item)
{
	name = "Royal Guard Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 1;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_GRD;
	visual = "grdi.3ds";
	visual_change = "Hum_GRDI_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance bab_armor_nude(C_Item)
{
	name = "Nude Babe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
};

instance bab_armor_bikini(C_Item)
{
	name = "Bikini Babe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
};

instance non_armor_h(C_Item)
{
	name = "Ancient Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 30;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "ITAR_RAVEN_ADDON.3ds";
	visual_change = "Armor_MayaZombie_Addon.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance non_armor_i(C_Item)
{
	name = "Armor of the Guardian";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "ebrh2.3ds";
	visual_change = "Hum_Old_Ebr_Armor.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance non_armor_k(C_Item)
{
	name = "Swampshark Skin Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = VALUE_NON_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_Swampshark_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Made of swampsharks skins.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance non_armor_l(C_Item)
{
	name = "Wolfskin Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = VALUE_NON_ARMOR_K;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_WOLF_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Made of wolfskins.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance non_armor_n(C_Item)
{
	name = "Orc Dog Skin Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_non_armor_n;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_ORCDOG_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Made of orc dog skins.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance non_armor_u(C_Item)
{
	name = "Lurker Skin Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_non_armor_u;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_LURKER_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance non_armor_p(C_Item)
{
	name = "Troll Skin Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 5;
	value = VALUE_NON_ARMOR_W;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_TROLL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Novice's Loincloth";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = value_nov_armor_l;
	wear = WEAR_TORSO;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Light Novice's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	wear = WEAR_TORSO;
	value = value_nov_armor_m;
	visual = "novm.3ds";
	visual_change = "Hum_NOVM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved Novice's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	value = value_nov_armor_h;
	wear = WEAR_TORSO;
	visual = "novh.3ds";
	visual_change = "Hum_NOVS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Light Templar's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_l;
	wear = WEAR_TORSO;
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Templar's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 20;
	value = value_tpl_armor_m;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved Heavy Templar's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 20;
	value = value_tpl_armor_h;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Shadow's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_m;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved Shadow's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_h;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_STTS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Light Guard's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_l;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Guard's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_m;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved Heavy Guard's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_h;
	wear = WEAR_TORSO;
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SFB_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Digger's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_sfb_armor_l;
	wear = WEAR_TORSO;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Light Rogue's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = value_org_armor_l;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_ORGL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Rogue's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_m;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved Heavy Rogue's Dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	value = value_org_armor_h;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Light Mercenary's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	value = value_sld_armor_l;
	wear = WEAR_TORSO;
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Mercenary's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 10;
	value = value_sld_armor_m;
	wear = WEAR_TORSO;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved Heavy Mercenary's Armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 15;
	value = value_sld_armor_h;
	wear = WEAR_TORSO;
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Fire Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	wear = WEAR_TORSO;
	value = value_kdw_armor_l;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved High Robe of Fire";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Water Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	value = value_kdw_armor_l;
	wear = WEAR_TORSO;
	visual = "kdwl.3ds";
	visual_change = "Hum_KDWL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_H_UPGRADE(C_Item)
{
	name = "Improved High Robe of Water";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h;
	visual = "kdwh.3ds";
	visual_change = "Hum_KDWS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance DMB_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Robe of the Dark Arts";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 35;
	wear = WEAR_TORSO;
	value = VALUE_DMB_ARMOR_M;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance VLK_ARMOR_L_UPGRADE(C_Item)
{
	name = "Improved Light Digger's Trousers";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_l;
	wear = WEAR_TORSO;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GUR_ARMOR_M_UPGRADE(C_Item)
{
	name = "Improved Guru's Robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 55;
	protection[PROT_MAGIC] = 35;
	wear = WEAR_TORSO;
	value = VALUE_GUR_ARMOR_UPGRADE;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance tpl_armor_m_whitebody(C_Item)
{
	name = "Templar's Armor (only for white skin npc's!)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_m;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TplM_WhiteBody_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance tpl_armor_m_latinobody(C_Item)
{
	name = "Templar's Armor (only for latino skin npc's!)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_m;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TplM_LatinoBody_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M_BLACKBODY(C_Item)
{
	name = "Templar's Armor (only for black skin npc's!)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_m;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TplM_BlackBody_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

