
instance INFO_SHAMAN(C_Info)
{
	npc = orc_5047_shaman;
	nr = 1;
	condition = info_shaman_condition;
	information = info_shaman_info;
	permanent = 0;
	important = 1;
};


func int info_shaman_condition()
{
	return TRUE;
};

func void info_shaman_info()
{
	B_SelectWeapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Shaman_17_01");	//Ja by� Kar-Nakh.
	AI_Output(self,other,"Info_Shaman_17_02");	//Co ty tu robi� w �wi�tym miejscu? Ty sprofanowa� nasze sanktuarium!
	AI_Output(self,other,"Info_Shaman_17_03");	//KRUSHAK ci� za to ukara�!
	AI_Output(self,other,"Info_Shaman_17_04");	//Przygotuj si� na �mier�, �miertelniku!
	B_LogEntry(ARTEFACTS,"Kar-Nakh - szaman ork�w - stan�� mi na drodze i pr�bowa� mnie powstrzyma�. Twierdzi�, �e zbezcze�ci�em jego miejsce kultu.");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

