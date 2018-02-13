
func void smithweapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_SMITHWEAPON;
		AI_ProcessInfos(her);
	};
};


instance PC_NOSMITH(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nosmith_condition;
	information = pc_nosmith_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_nosmith_condition()
{
	if(player_mobsi_production == MOBSI_SMITHWEAPON)
	{
		return TRUE;
	};
};

func void pc_nosmith_info()
{
	CreateInvItems(self,ItMiSwordblade,1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_01_condition;
	information = pc_smith_itmw_1h_sword_01_info;
	important = 0;
	permanent = 1;
	description = "Crude Sword (required strength 25, damage 25)";
};


func int pc_smith_itmw_1h_sword_01_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_grobesschwert == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_01_info()
{
	CreateInvItem(hero,itmw_1h_sword_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_LIGHTGUARDSSWORD_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_lightguardssword_03_condition;
	information = pc_smith_itmw_1h_lightguardssword_03_info;
	important = 0;
	permanent = 1;
	description = "Light Guard's Sword (required strength 30, damage 30)";
};


func int pc_smith_itmw_1h_lightguardssword_03_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_leichtesgardeschwert == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_lightguardssword_03_info()
{
	CreateInvItem(hero,itmw_1h_lightguardssword_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_03_condition;
	information = pc_smith_itmw_1h_sword_03_info;
	important = 0;
	permanent = 1;
	description = "Guard's Sword (required strength 40, damage 40)";
};


func int pc_smith_itmw_1h_sword_03_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_gardeschwert == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_03_info()
{
	CreateInvItem(hero,itmw_1h_sword_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_BROAD_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_broad_04_condition;
	information = pc_smith_itmw_1h_sword_broad_04_info;
	important = 0;
	permanent = 1;
	description = "Guard's Hand (required strength 75, damage 80)";
};


func int pc_smith_itmw_1h_sword_broad_04_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_gardistenhand == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_broad_04_info()
{
	CreateInvItem(hero,itmw_1h_sword_broad_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_MACE_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_01_condition;
	information = pc_smith_itmw_1h_mace_01_info;
	important = 0;
	permanent = 1;
	description = "Mace (required strength 25, damage 30)";
};


func int pc_smith_itmw_1h_mace_01_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_streitkolben == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_01_info()
{
	CreateInvItem(hero,itmw_1h_mace_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_MACE_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_04_condition;
	information = pc_smith_itmw_1h_mace_04_info;
	important = 0;
	permanent = 1;
	description = "Steel Tongue (required strength 32, damage 38)";
};


func int pc_smith_itmw_1h_mace_04_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_stahlzunge == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_04_info()
{
	CreateInvItem(hero,itmw_1h_mace_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_05(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_05_condition;
	information = pc_smith_itmw_1h_sword_05_info;
	important = 0;
	permanent = 1;
	description = "War Sword (required strength 42, damage 42)";
};


func int pc_smith_itmw_1h_sword_05_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_kriegsschwert == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_05_info()
{
	CreateInvItem(hero,itmw_1h_sword_05_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_01_condition;
	information = pc_smith_itmw_2h_sword_light_01_info;
	important = 0;
	permanent = 1;
	description = "Light Two-hander (required strength 65, damage 65)";
};


func int pc_smith_itmw_2h_sword_light_01_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_leichter2h == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_01_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_02_condition;
	information = pc_smith_itmw_2h_sword_light_02_info;
	important = 0;
	permanent = 1;
	description = "Custodian's Blade (required strength 70, damage 70)";
};


func int pc_smith_itmw_2h_sword_light_02_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_hüterklinge == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_02_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_04_condition;
	information = pc_smith_itmw_2h_sword_light_04_info;
	important = 0;
	permanent = 1;
	description = "King's Blade (required strength 75, damage 75)";
};


func int pc_smith_itmw_2h_sword_light_04_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_königsklinge == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_04_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ROTER_WIND(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_roter_wind_condition;
	information = pc_smith_roter_wind_info;
	important = 0;
	permanent = 1;
	description = "Red Wind (required strength 100, damage 105)";
};


func int pc_smith_roter_wind_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_roter_wind == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_roter_wind_info()
{
	CreateInvItem(hero,roter_wind_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_MACE_WAR_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_war_01_condition;
	information = pc_smith_itmw_1h_mace_war_01_info;
	important = 0;
	permanent = 1;
	description = "Morning Star (required strength 35, damage 40)";
};


func int pc_smith_itmw_1h_mace_war_01_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_axt == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_war_01_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_WAR_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_war_02_condition;
	information = pc_smith_itmw_1h_war_02_info;
	important = 0;
	permanent = 1;
	description = "Steel Mace (required strength 36, damage 41)";
};


func int pc_smith_itmw_1h_war_02_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_stahlgeflecht == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_war_02_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_WAR_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_war_03_condition;
	information = pc_smith_itmw_1h_war_03_info;
	important = 0;
	permanent = 1;
	description = "Stone Crusher (required strength 37, damage 42)";
};


func int pc_smith_itmw_1h_war_03_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_steinbrecher == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_war_03_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_03_condition;
	information = pc_smith_itmw_2h_sword_light_03_info;
	important = 0;
	permanent = 1;
	description = "Light Battle Axe (required strength 70, damage 80)";
};


func int pc_smith_itmw_2h_sword_light_03_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_söldnerklinge == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_03_info()
{
	CreateInvItem(hero,itmw_2h_axe_light_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_01_condition;
	information = pc_smith_itmw_2h_sword_01_info;
	important = 0;
	permanent = 1;
	description = "War Axe (required strength 80, damage 90)";
};


func int pc_smith_itmw_2h_sword_01_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_zweihånder == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_01_info()
{
	CreateInvItem(hero,itmw_2h_axe_heavy_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_HEAVY_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_heavy_02_condition;
	information = pc_smith_itmw_2h_sword_heavy_02_info;
	important = 0;
	permanent = 1;
	description = "Warrior's Voice (required strength 90, damage 100)";
};


func int pc_smith_itmw_2h_sword_heavy_02_condition()
{
	if((player_mobsi_production == MOBSI_SMITHWEAPON) && (knows_zornstahl == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_heavy_02_info()
{
	CreateInvItem(hero,itmw_2h_axe_heavy_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Weapon made!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

