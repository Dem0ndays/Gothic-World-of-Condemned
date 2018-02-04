
instance INFO_VLK_513_SCHUTZGELD(C_Info)
{
	npc = VLK_513_Buddler;
	nr = 5;
	condition = info_vlk_513_schutzgeld_condition;
	information = info_vlk_513_schutzgeld_info;
	permanent = 1;
	description = "Jak tam u ciebie z pieniêdzmi za ochronê?";
};


func int info_vlk_513_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_513_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_3_Schutzgeld_15_00");	//Jestem tutaj w sprawie nale¿noœci za ochronê.
	AI_Output(self,other,"Info_Vlk_3_Schutzgeld_07_01");	//W porz¹dku, oto 10 bry³ek.
	AI_Output(self,other,"Info_Vlk_3_Schutzgeld_07_02");	//Mam nadziejê, ¿e to wystarczy znowu przynajmniej na te kilka dni.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

