
func void cook_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_COOK;
		AI_ProcessInfos(her);
	};
};


instance PC_NOCOOK(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nocook_condition;
	information = pc_nocook_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_nocook_condition()
{
	if(player_mobsi_production == MOBSI_COOK)
	{
		return TRUE;
	};
};

func void pc_nocook_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_MEATBUGRAGOUT(C_Info)
{
	npc = PC_Hero;
	condition = pc_meatbugragout_condition;
	information = pc_meatbugragout_info;
	permanent = 1;
	description = "Potrawka z chrz�szcza (2x owadzie mi�so, 1x piekielnik)";
};


func int pc_meatbugragout_condition()
{
	if((player_mobsi_production == MOBSI_COOK) && (knows_meatbugragout == TRUE))
	{
		return TRUE;
	};
};

func void pc_meatbugragout_info()
{
	if((Npc_HasItems(hero,ItAt_Meatbug_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_mushroom_01) >= 4))
	{
		Npc_RemoveInvItems(hero,ItAt_Meatbug_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_mushroom_01,4);
		CreateInvItems(hero,ItFoMeatbugragout,1);
		PrintScreen("Przyrz�dzono potrawk� z chrz�szcza!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Brak wystarczaj�cej ilo�ci sk�adnik�w!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_SOUP(C_Info)
{
	npc = PC_Hero;
	condition = pc_soup_condition;
	information = pc_soup_info;
	permanent = 1;
	description = "Zupa korzenna (2x twardzie�, 1x orkowe ziele)";
};


func int pc_soup_condition()
{
	if((player_mobsi_production == MOBSI_COOK) && (knows_soup == TRUE))
	{
		return TRUE;
	};
};

func void pc_soup_info()
{
	if((Npc_HasItems(hero,ItFo_Plants_Stoneroot_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Plants_Stoneroot_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(hero,ItFoSoup,1);
		PrintScreen("Przygotowano zup� korzenn�!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Brak wystarczaj�cej ilo�ci sk�adnik�w!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_CRAWLERSOUP(C_Info)
{
	npc = PC_Hero;
	condition = pc_crawlersoup_condition;
	information = pc_crawlersoup_info;
	permanent = 1;
	description = "Zupa z pe�zacza (1x wn�trzno�ci pe�zacza, 2x orkowe ziele)";
};


func int pc_crawlersoup_condition()
{
	if((player_mobsi_production == MOBSI_COOK) && (knows_crawlersoup == TRUE))
	{
		return TRUE;
	};
};

func void pc_crawlersoup_info()
{
	if((Npc_HasItems(hero,ItAt_Crawler_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 2))
	{
		Npc_RemoveInvItems(hero,ItAt_Crawler_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,2);
		CreateInvItems(hero,ItFoCrawlersoup,1);
		PrintScreen("Przygotowano zup� z pe�zacza!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Brak wystarczaj�cej ilo�ci sk�adnik�w!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_RICE(C_Info)
{
	npc = PC_Hero;
	condition = pc_rice_condition;
	information = pc_rice_info;
	permanent = 1;
	description = "Ry� (1x woda, 2x ry� siewny)";
};


func int pc_rice_condition()
{
	if((player_mobsi_production == MOBSI_COOK) && (knows_rice == TRUE))
	{
		return TRUE;
	};
};

func void pc_rice_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,itmi_plants_rice_01) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,itmi_plants_rice_01,2);
		CreateInvItems(hero,ItFoRice,1);
		PrintScreen("Przygotowano ry�!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Brak wystarczaj�cej ilo�ci sk�adnik�w!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		player_mobsi_production = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

