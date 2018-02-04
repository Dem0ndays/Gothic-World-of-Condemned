
instance INFO_VLK_560_SCHUTZGELD(C_Info)
{
	npc = VLK_560_Buddler;
	nr = 5;
	condition = info_vlk_560_schutzgeld_condition;
	information = info_vlk_560_schutzgeld_info;
	permanent = 1;
	description = "Jak tam u ciebie z pieni�dzmi za ochron�?";
};


func int info_vlk_560_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_560_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_2_Schutzgeld_15_00");	//P�aci�e� ju� mo�e za ochron�?
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_01");	//Tak, tak, ju�, oto moje 10 bry�ek.
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_02");	//Tylko zadbaj o to, �ebym mia� tu spok�j.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

