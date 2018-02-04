
func void potionalchemy_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_POTIONALCHEMY;
		AI_ProcessInfos(her);
	};
};


instance PC_NOALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noalchemy_condition;
	information = pc_noalchemy_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_noalchemy_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == FALSE) && (healthstart == FALSE) && (boozestart == FALSE) && (specialstart == FALSE))
	{
		return TRUE;
	};
};

func void pc_noalchemy_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	CreateInvItems(hero,ItMiFlask,1);
	healthstart = FALSE;
	manastart = FALSE;
	specialstart = FALSE;
	boozestart = FALSE;
};


instance PC_HEALTH_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_health_start_condition;
	information = pc_health_start_info;
	permanent = TRUE;
	description = "Uwarz mikstury lecznicze.";
};


func int pc_health_start_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == FALSE) && (healthstart == FALSE) && (boozestart == FALSE) && (specialstart == FALSE))
	{
		return TRUE;
	};
};

func void pc_health_start_info()
{
	healthstart = TRUE;
};


instance PC_HEALTH_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_health_stop_condition;
	information = pc_health_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_health_stop_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (healthstart == TRUE))
	{
		return TRUE;
	};
};

func void pc_health_stop_info()
{
	healthstart = FALSE;
};


instance PC_HEAL1(C_Info)
{
	npc = PC_Hero;
	condition = pc_heal1_condition;
	information = pc_heal1_info;
	permanent = 1;
	description = "Esencja uzdrawiaj¹ca";
};


func int pc_heal1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (healthstart == TRUE) && (knows_heilessenz == TRUE))
	{
		return TRUE;
	};
};

func void pc_heal1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_01,1);
		CreateInvItems(hero,ItFo_Potion_Health_01,1);
		PrintScreen("Przygotowano esencjê uzdrawiaj¹c¹!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEAL2(C_Info)
{
	npc = PC_Hero;
	condition = pc_heal2_condition;
	information = pc_heal2_info;
	permanent = 1;
	description = "Wyci¹g uzdrawiaj¹cy";
};


func int pc_heal2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (healthstart == TRUE) && (knows_heilextrakt == TRUE))
	{
		return TRUE;
	};
};

func void pc_heal2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Herb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_02,1);
		CreateInvItems(hero,ItFo_Potion_Health_02,1);
		PrintScreen("Przygotowano wyci¹g uzdrawiaj¹cy!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEAL3(C_Info)
{
	npc = PC_Hero;
	condition = pc_heal3_condition;
	information = pc_heal3_info;
	permanent = 1;
	description = "Eliksir uzdrawiaj¹cy";
};


func int pc_heal3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (healthstart == TRUE) && (knows_heilelixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_heal3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_02) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_02,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,1);
		CreateInvItems(hero,ItFo_Potion_Health_02,1);
		PrintScreen("Przygotowano eliksir uzdrawiaj¹cy!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANA_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_mana_start_condition;
	information = pc_mana_start_info;
	permanent = TRUE;
	description = "Uwarz mikstury many.";
};


func int pc_mana_start_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == FALSE) && (healthstart == FALSE) && (boozestart == FALSE) && (specialstart == FALSE))
	{
		return TRUE;
	};
};

func void pc_mana_start_info()
{
	manastart = TRUE;
};


instance PC_MANA_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_mana_stop_condition;
	information = pc_mana_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_mana_stop_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana_stop_info()
{
	manastart = FALSE;
};


instance PC_MANA1(C_Info)
{
	npc = PC_Hero;
	condition = pc_mana1_condition;
	information = pc_mana1_info;
	permanent = 1;
	description = "Esencja magicznej energii";
};


func int pc_mana1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == TRUE) && (knows_manaessenz == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_01,1);
		CreateInvItems(hero,ItFo_Potion_Mana_01,1);
		PrintScreen("Przygotowano esencjê magicznej energii!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANA2(C_Info)
{
	npc = PC_Hero;
	condition = pc_mana2_condition;
	information = pc_mana2_info;
	permanent = 1;
	description = "Wyci¹g magicznej energii";
};


func int pc_mana2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == TRUE) && (knows_manaextrakt == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,1);
		CreateInvItems(hero,ItFo_Potion_Mana_02,1);
		PrintScreen("Przygotowano wyci¹g magicznej energii!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANA3(C_Info)
{
	npc = PC_Hero;
	condition = pc_mana3_condition;
	information = pc_mana3_info;
	permanent = 1;
	description = "Eliksir magicznej energii";
};


func int pc_mana3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == TRUE) && (knows_manaelixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana3_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 2))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,2);
		CreateInvItems(hero,ItFo_Potion_Mana_02,1);
		PrintScreen("Przygotowano eliksir magicznej energii!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_SPECIAL_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_special_start_condition;
	information = pc_special_start_info;
	permanent = TRUE;
	description = "Uwarz mikstury specjalne.";
};


func int pc_special_start_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == FALSE) && (healthstart == FALSE) && (boozestart == FALSE) && (specialstart == FALSE))
	{
		return TRUE;
	};
};

func void pc_special_start_info()
{
	specialstart = TRUE;
};


instance PC_SPECIAL_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_special_stop_condition;
	information = pc_special_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_special_stop_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE))
	{
		return TRUE;
	};
};

func void pc_special_stop_info()
{
	specialstart = FALSE;
};


instance PC_CRAWLER(C_Info)
{
	npc = PC_Hero;
	condition = pc_crawler_condition;
	information = pc_crawler_info;
	permanent = 1;
	description = "Napój z pe³zaczy";
};


func int pc_crawler_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_psicrawler == TRUE))
	{
		return TRUE;
	};
};

func void pc_crawler_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItAt_Crawler_01) >= 4) && (Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 4))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItAt_Crawler_01,4);
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,4);
		CreateInvItems(hero,ItFo_Potion_Elixier_Egg,1);
		PrintScreen("Przygotowano napój z pe³zaczy!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_ELIXIER(C_Info)
{
	npc = PC_Hero;
	condition = pc_elixier_condition;
	information = pc_elixier_info;
	permanent = 1;
	description = "Eliksir";
};


func int pc_elixier_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_psielixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_elixier_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItAt_Bloodfly_02) >= 1) && (Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItAt_Bloodfly_02,1);
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,2);
		CreateInvItems(hero,ItFo_Potion_Elixier,1);
		PrintScreen("Przygotowano eliksir!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HASTE1(C_Info)
{
	npc = PC_Hero;
	condition = pc_haste1_condition;
	information = pc_haste1_info;
	permanent = 1;
	description = "Napój lekkoœci";
};


func int pc_haste1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_hastegeschwindigkeit == TRUE))
	{
		return TRUE;
	};
};

func void pc_haste1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(hero,ItFo_Potion_Haste_01,1);
		PrintScreen("Przygotowano napój lekkoœci!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HASTE2(C_Info)
{
	npc = PC_Hero;
	condition = pc_haste2_condition;
	information = pc_haste2_info;
	permanent = 1;
	description = "Napój szybkoœci";
};


func int pc_haste2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_hasteschnelligkeit == TRUE))
	{
		return TRUE;
	};
};

func void pc_haste2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,1);
		CreateInvItems(hero,ItFo_Potion_Haste_02,1);
		PrintScreen("Przygotowano napój szybkoœci!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HASTE3(C_Info)
{
	npc = PC_Hero;
	condition = pc_haste3_condition;
	information = pc_haste3_info;
	permanent = 1;
	description = "Napój przyspieszenia";
};


func int pc_haste3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_hasteeile == TRUE))
	{
		return TRUE;
	};
};

func void pc_haste3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,2);
		CreateInvItems(hero,ItFo_Potion_Haste_03,1);
		PrintScreen("Przygotowano napój przyspieszenia!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_STR1(C_Info)
{
	npc = PC_Hero;
	condition = pc_str1_condition;
	information = pc_str1_info;
	permanent = 1;
	description = "Esencja si³y";
};


func int pc_str1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_strengthessenz == TRUE))
	{
		return TRUE;
	};
};

func void pc_str1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Strength_01,1);
		PrintScreen("Przygotowano esencjê si³y!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_STR2(C_Info)
{
	npc = PC_Hero;
	condition = pc_str2_condition;
	information = pc_str2_info;
	permanent = 1;
	description = "Wyci¹g si³y";
};


func int pc_str2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_strengthextrakt == TRUE))
	{
		return TRUE;
	};
};

func void pc_str2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Strength_02,1);
		PrintScreen("Przygotowano wyci¹g si³y!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_STR3(C_Info)
{
	npc = PC_Hero;
	condition = pc_str3_condition;
	information = pc_str3_info;
	permanent = 1;
	description = "Eliksir si³y";
};


func int pc_str3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_strengthelixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_str3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 4) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Stoneroot_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,4);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Stoneroot_02,1);
		CreateInvItems(hero,ItFo_Potion_Strength_03,1);
		PrintScreen("Przygotowano eliksir si³y!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEALPERMA1(C_Info)
{
	npc = PC_Hero;
	condition = pc_healperma1_condition;
	information = pc_healperma1_info;
	permanent = 1;
	description = "Esencja ¿ycia";
};


func int pc_healperma1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_heilpermaessenz == TRUE))
	{
		return TRUE;
	};
};

func void pc_healperma1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,2);
		CreateInvItems(hero,ItFo_Potion_Health_Perma_01,1);
		PrintScreen("Przygotowano esencjê ¿ycia!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEALPERMA2(C_Info)
{
	npc = PC_Hero;
	condition = pc_healperma2_condition;
	information = pc_healperma2_info;
	permanent = 1;
	description = "Wyci¹g ¿ycia";
};


func int pc_healperma2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_heilpermaextrakt == TRUE))
	{
		return TRUE;
	};
};

func void pc_healperma2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 2) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
		PrintScreen("Przygotowano wyci¹g ¿ycia!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEALPERMA3(C_Info)
{
	npc = PC_Hero;
	condition = pc_healperma3_condition;
	information = pc_healperma3_info;
	permanent = 1;
	description = "Eliksir ¿ycia";
};


func int pc_healperma3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_heilpermaelixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_healperma3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 3) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(hero,ItFo_Potion_Health_Perma_03,1);
		PrintScreen("Przygotowano eliksir ¿ycia!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANAPERMA1(C_Info)
{
	npc = PC_Hero;
	condition = pc_manaperma1_condition;
	information = pc_manaperma1_info;
	permanent = 1;
	description = "Esencja ducha";
};


func int pc_manaperma1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_manapermaessenz == TRUE))
	{
		return TRUE;
	};
};

func void pc_manaperma1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 2))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,2);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_01,1);
		PrintScreen("Przygotowano esencjê ducha!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANAPERMA2(C_Info)
{
	npc = PC_Hero;
	condition = pc_manaperma2_condition;
	information = pc_manaperma2_info;
	permanent = 1;
	description = "Wyci¹g ducha";
};


func int pc_manaperma2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_manapermaextrakt == TRUE))
	{
		return TRUE;
	};
};

func void pc_manaperma2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 2))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,2);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
		PrintScreen("Przygotowano wyci¹g ducha!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANAPERMA3(C_Info)
{
	npc = PC_Hero;
	condition = pc_manaperma3_condition;
	information = pc_manaperma3_info;
	permanent = 1;
	description = "Eliksir ducha";
};


func int pc_manaperma3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_manapermaelixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_manaperma3_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_02) >= 2) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 3))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_02,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,3);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_03,1);
		PrintScreen("Przygotowano eliksir ducha!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_DEX1(C_Info)
{
	npc = PC_Hero;
	condition = pc_dex1_condition;
	information = pc_dex1_info;
	permanent = 1;
	description = "Esencja zwinnoœci";
};


func int pc_dex1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_dexessenz == TRUE))
	{
		return TRUE;
	};
};

func void pc_dex1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_01,1);
		PrintScreen("Przygotowano esencjê zwinnoœci!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_DEX2(C_Info)
{
	npc = PC_Hero;
	condition = pc_dex2_condition;
	information = pc_dex2_info;
	permanent = 1;
	description = "Wyci¹g zwinnoœci";
};


func int pc_dex2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_dexextrakt == TRUE))
	{
		return TRUE;
	};
};

func void pc_dex2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_02,1);
		PrintScreen("Przygotowano wyci¹g zwinnoœci!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_DEX3(C_Info)
{
	npc = PC_Hero;
	condition = pc_dex3_condition;
	information = pc_dex3_info;
	permanent = 1;
	description = "Eliksir zwinnoœci";
};


func int pc_dex3_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_dexelixier == TRUE))
	{
		return TRUE;
	};
};

func void pc_dex3_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 4) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,4);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_03,1);
		PrintScreen("Przygotowano eliksir zwinnoœci!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_FORCE1(C_Info)
{
	npc = PC_Hero;
	condition = pc_force1_condition;
	information = pc_force1_info;
	permanent = 1;
	description = "Napój potêgi";
};


func int pc_force1_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_mastermacht == TRUE))
	{
		return TRUE;
	};
};

func void pc_force1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Syrianoil_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Syrianoil_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Master_01,1);
		PrintScreen("Przygotowano napój potêgi!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_FORCE2(C_Info)
{
	npc = PC_Hero;
	condition = pc_force2_condition;
	information = pc_force2_info;
	permanent = 1;
	description = "Napój w³adzy";
};


func int pc_force2_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (specialstart == TRUE) && (knows_masterherrschaft == TRUE))
	{
		return TRUE;
	};
};

func void pc_force2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Syrianoil_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_02) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Syrianoil_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_02,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Master_02,1);
		PrintScreen("Przygotowano napój w³adzy!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_BOOZE_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_booze_start_condition;
	information = pc_booze_start_info;
	permanent = TRUE;
	description = "Uwarz gorza³kê.";
};


func int pc_booze_start_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (manastart == FALSE) && (healthstart == FALSE) && (specialstart == FALSE) && (boozestart == FALSE))
	{
		return TRUE;
	};
};

func void pc_booze_start_info()
{
	boozestart = TRUE;
};


instance PC_BOOZE_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_booze_stop_condition;
	information = pc_booze_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_booze_stop_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (boozestart == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_stop_info()
{
	boozestart = FALSE;
};


instance PC_BOOZE(C_Info)
{
	npc = PC_Hero;
	condition = pc_booze_condition;
	information = pc_booze_info;
	permanent = 1;
	description = "Ry¿ówka";
};


func int pc_booze_condition()
{
	if((player_mobsi_production == MOBSI_POTIONALCHEMY) && (boozestart == TRUE) && (knows_booze == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,itmi_plants_rice_01) >= 1) && (Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,itmi_plants_rice_01,1);
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		CreateInvItems(hero,ItFoBooze,1);
		PrintScreen("Przygotowano ry¿ówkê!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Niewystarczaj¹ca iloœæ sk³adników!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
		CreateInvItems(hero,ItMiFlask,1);
	};
};

