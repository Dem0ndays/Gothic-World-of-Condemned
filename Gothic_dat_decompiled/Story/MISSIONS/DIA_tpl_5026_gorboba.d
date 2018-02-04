
instance DIA_GORBOBA_EXIT(C_Info)
{
	npc = tpl_5026_gorboba;
	nr = 999;
	condition = dia_gorboba_exit_condition;
	information = dia_gorboba_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gorboba_exit_condition()
{
	return 1;
};

func void dia_gorboba_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORBOBA_HELLO(C_Info)
{
	npc = tpl_5026_gorboba;
	nr = 1;
	condition = dia_gorboba_hello_condition;
	information = dia_gorboba_hello_info;
	permanent = 1;
	description = "Co tu robisz?";
};


func int dia_gorboba_hello_condition()
{
	return 1;
};

func void dia_gorboba_hello_info()
{
	AI_Output(other,self,"DIA_GorBoba_Hello_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_GorBoba_Hello_05_01");	//Zosta³em wybrany do tego, by strzec tej bramy. To wa¿ne zadanie.
	AI_Output(self,other,"DIA_GorBoba_Hello_05_02");	//Pilnujê, ¿eby ¿adne potwory z lasu ani z bagien nie zbli¿y³y siê zanadto do obozu.
	AI_Output(self,other,"DIA_GorBoba_Hello_05_03");	//Œni¹cy osobiœcie wyznaczy³ mnie do tego zaszczytnego zadania. To dziêki niemu mam si³ê, by staæ tutaj dniem i noc¹.
	if(Npc_GetTrueGuild(hero) != GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorBoba_Hello_05_04");	//Wiêc proszê, nie przeszkadzaj mi. Muszê mieæ oczy szeroko otwarte.
	};
	AI_StopProcessInfos(self);
};

