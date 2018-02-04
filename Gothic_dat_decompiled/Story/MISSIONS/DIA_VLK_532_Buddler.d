
instance INFO_VLK_532_SCHUTZGELD(C_Info)
{
	npc = VLK_532_Buddler;
	nr = 5;
	condition = info_vlk_532_schutzgeld_condition;
	information = info_vlk_532_schutzgeld_info;
	permanent = 1;
	description = "Jak tam u ciebie z pieniêdzmi za ochronê?";
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
	AI_Output(other,self,"Info_Vlk_4_Schutzgeld_15_00");	//Co ty na to, aby oddaæ mi w³aœnie pieni¹dze za ochronê?
	AI_Output(self,other,"Info_Vlk_4_Schutzgeld_07_01");	//Nie ma problemu - oto 10 bry³ek.
	AI_Output(self,other,"Info_Vlk_4_Schutzgeld_07_02");	//Bêdzie to musia³o znowu wystarczyæ.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

