
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
	description = "Niewykoñczony miecz (wymagana si³a 25, obra¿enia 25)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Lekki miecz Stra¿nika (wymagana si³a 30, obra¿enia 30)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Miecz Stra¿nika (wymagana si³a 40, obra¿enia 40)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Rêka Stra¿nika (wymagana si³a 75, obra¿enia 80)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Maczuga (wymagana si³a 25, obra¿enia 30)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Stalowy jêzyk (wymagana si³a 32, obra¿enia 38)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Miecz wojenny (wymagana si³a 42, obra¿enia 42)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Lekki miecz dwurêczny (wymagana si³a 65, obra¿enia 65)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Miecz nadzorcy (wymagana si³a 70, obra¿enia 70)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Miecz królewski (wymagana si³a 75, obra¿enia 75)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Czerwony Wiatr (wymagana si³a 100, obra¿enia 105)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Morgensztern (wymagana si³a 35, obra¿enia 40)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "¯elazna maczuga (wymagana si³a 36, obra¿enia 41)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "£omotacz (wymagana si³a 37, obra¿enia 42)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Lekki topór bojowy (wymagana si³a 70, obra¿enia 80)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Topór wojenny (wymagana si³a 80, obra¿enia 90)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
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
	description = "Krzyk wojownika (wymagana si³a 90, obra¿enia 100)";
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
	PrintScreen("Wykuto broñ!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	player_mobsi_production = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

