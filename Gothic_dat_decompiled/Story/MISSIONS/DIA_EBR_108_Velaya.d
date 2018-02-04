
instance DIA_VELAYA_EXIT(C_Info)
{
	npc = EBR_108_Velaya;
	nr = 999;
	condition = dia_velaya_exit_condition;
	information = dia_velaya_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_velaya_exit_condition()
{
	return 1;
};

func void dia_velaya_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VELAYA_GOMEZFINISHED(C_Info)
{
	npc = EBR_108_Velaya;
	nr = 1;
	condition = dia_velaya_gomezfinished_condition;
	information = dia_velaya_gomezfinished_info;
	permanent = 0;
	important = 1;
};


func int dia_velaya_gomezfinished_condition()
{
	var C_Npc Gomez;
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	if(Npc_IsDead(Gomez))
	{
		return TRUE;
	};
};

func void dia_velaya_gomezfinished_info()
{
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_00");	//Co? Jak siê tu dosta³eœ? Gdzie jest Gomez?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_01");	//W innym, lepszym œwiecie.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_02");	//TY go za³atwi³eœ?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_03");	//Zgadza siê.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_04");	//Wreszcie! Jestem ci naprawdê bardzo wdziêczna. Nie wytrzyma³abym ju¿ d³u¿ej z tym œwintuchem.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_05");	//Traktowa³ mnie jak niewolnicê i zamyka³ w swoim pokoju. Dobrze, ¿e ju¿ po wszystkim. Dziêki tobie.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_06");	//Wprawdzie nie mogê ci zbyt wiele zaoferowaæ, ale proszê, weŸ to.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_07");	//To magiczny amulet, który podwêdzi³am Gomezowi. Dziêki niemu bêdziesz silniejszy i bardziej wytrzyma³y.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_08");	//Mam nadziejê, ¿e bêdzie dobrze ciê chroni³ w czasie twojej podró¿y.
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_09");	//Dziêkujê.
	B_GiveXP(XP_VELAYAHELP);
	B_GiveInvItems(self,other,Lebensamulett,1);
};

