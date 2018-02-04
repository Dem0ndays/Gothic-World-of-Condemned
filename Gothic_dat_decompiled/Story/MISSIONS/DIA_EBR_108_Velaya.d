
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
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_00");	//Co? Jak si� tu dosta�e�? Gdzie jest Gomez?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_01");	//W innym, lepszym �wiecie.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_02");	//TY go za�atwi�e�?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_03");	//Zgadza si�.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_04");	//Wreszcie! Jestem ci naprawd� bardzo wdzi�czna. Nie wytrzyma�abym ju� d�u�ej z tym �wintuchem.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_05");	//Traktowa� mnie jak niewolnic� i zamyka� w swoim pokoju. Dobrze, �e ju� po wszystkim. Dzi�ki tobie.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_06");	//Wprawdzie nie mog� ci zbyt wiele zaoferowa�, ale prosz�, we� to.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_07");	//To magiczny amulet, kt�ry podw�dzi�am Gomezowi. Dzi�ki niemu b�dziesz silniejszy i bardziej wytrzyma�y.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_08");	//Mam nadziej�, �e b�dzie dobrze ci� chroni� w czasie twojej podr�y.
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_09");	//Dzi�kuj�.
	B_GiveXP(XP_VELAYAHELP);
	B_GiveInvItems(self,other,Lebensamulett,1);
};

