
instance INFO_VLK_532_SCHUTZGELD(C_Info)
{
	npc = VLK_532_Buddler;
	nr = 5;
	condition = info_vlk_532_schutzgeld_condition;
	information = info_vlk_532_schutzgeld_info;
	permanent = 1;
	description = "Jak tam u ciebie z pieni�dzmi za ochron�?";
};


func int info_vlk_532_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_532_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_4_Schutzgeld_15_00");	//Co ty na to, aby odda� mi w�a�nie pieni�dze za ochron�?
	AI_Output(self,other,"Info_Vlk_4_Schutzgeld_07_01");	//Nie ma problemu - oto 10 bry�ek.
	AI_Output(self,other,"Info_Vlk_4_Schutzgeld_07_02");	//B�dzie to musia�o znowu wystarczy�.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

