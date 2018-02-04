
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
	AI_Output(self,other,"Info_Shaman_17_01");	//Ja byæ Kar-Nakh.
	AI_Output(self,other,"Info_Shaman_17_02");	//Co ty tu robiæ w œwiêtym miejscu? Ty sprofanowaæ nasze sanktuarium!
	AI_Output(self,other,"Info_Shaman_17_03");	//KRUSHAK ciê za to ukaraæ!
	AI_Output(self,other,"Info_Shaman_17_04");	//Przygotuj siê na œmieræ, œmiertelniku!
	B_LogEntry(ARTEFACTS,"Kar-Nakh - szaman orków - stan¹³ mi na drodze i próbowa³ mnie powstrzymaæ. Twierdzi³, ¿e zbezczeœci³em jego miejsce kultu.");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

