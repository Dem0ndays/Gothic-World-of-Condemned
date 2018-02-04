
instance INFO_VLK_560_SCHUTZGELD(C_Info)
{
	npc = VLK_560_Buddler;
	nr = 5;
	condition = info_vlk_560_schutzgeld_condition;
	information = info_vlk_560_schutzgeld_info;
	permanent = 1;
	description = "Jak tam u ciebie z pieniêdzmi za ochronê?";
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
	AI_Output(other,self,"Info_Vlk_2_Schutzgeld_15_00");	//P³aci³eœ ju¿ mo¿e za ochronê?
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_01");	//Tak, tak, ju¿, oto moje 10 bry³ek.
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_02");	//Tylko zadbaj o to, ¿ebym mia³ tu spokój.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

