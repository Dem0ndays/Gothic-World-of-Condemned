
func void schuerfen_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		player_mobsi_production = MOBSI_SCHUERFEN;
		AI_ProcessInfos(her);
	};
};


instance PC_NOSCHUERFEN(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noschuerfen_condition;
	information = pc_noschuerfen_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_noschuerfen_condition()
{
	if(player_mobsi_production == MOBSI_SCHUERFEN)
	{
		return TRUE;
	};
};

func void pc_noschuerfen_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SCHUERFEN_N(C_Info)
{
	npc = PC_Hero;
	condition = pc_schuerfen_n_condition;
	information = pc_schuerfen_n_info;
	important = 0;
	permanent = 1;
	description = "Just chop a little.";
};


func int pc_schuerfen_n_condition()
{
	if(player_mobsi_production == MOBSI_SCHUERFEN)
	{
		return TRUE;
	};
};

func void pc_schuerfen_n_info()
{
	var int zufallsmenge;
	var int anzahl;
	var C_Npc he;
	zufallsmenge = Hlp_Random(180);
	if(zufallsmenge <= 145)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 170)
	{
		anzahl = 0;
	};
	if(zufallsmenge >= 155)
	{
		anzahl = 1;
	};
	if(zufallsmenge >= 160)
	{
		anzahl = 3;
	};
	if(zufallsmenge >= 165)
	{
		anzahl = 2;
	};
	he = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(he))
	{
		CreateInvItems(self,ItMiNugget,anzahl);
		if(anzahl == 0)
		{
			PrintScreen("Ore splinters fly everywhere...",-1,10,"font_old_20_white.tga",1);
		};
		if(anzahl == 1)
		{
			PrintScreen("1 ore nugget mined!",-1,30,"font_old_20_white.tga",1);
		};
		if(anzahl == 2)
		{
			PrintScreen("2 ore nuggets mined!",-1,30,"font_old_20_white.tga",1);
		};
		if(anzahl == 3)
		{
			PrintScreen("3 ore nuggets mined!",-1,30,"font_old_20_white.tga",1);
		};
	};
};

