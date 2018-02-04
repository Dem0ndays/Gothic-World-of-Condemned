
instance TPL_5066_GORNABAR_EXIT(C_Info)
{
	npc = tpl_5066_gornabar;
	nr = 999;
	condition = tpl_5066_gornabar_exit_condition;
	information = tpl_5066_gornabar_exit_info;
	important = 0;
	permanent = 1;
	description = "KONIEC";
};


func int tpl_5066_gornabar_exit_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_5066_GORNABAR_GETLOST(C_Info)
{
	npc = tpl_5066_gornabar;
	nr = 1;
	condition = tpl_5066_gornabar_getlost_condition;
	information = tpl_5066_gornabar_getlost_info;
	permanent = 1;
	important = 0;
	description = "Wr�ci�e� do obozu?";
};


func int tpl_5066_gornabar_getlost_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5066_GorNaBar_15_00");	//Wr�ci�e� do obozu?
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_01");	//Ach, cz�owiek z kopalni. Tak, postanowili�my uda� si� z powrotem do naszego obozu.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_02");	//Wr�ci�em razem z Gor Na Koshem i Gor Na Videm, jak tylko przynios�e� jaja.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_03");	//Teraz znowu przej��em swoj� star� posad�, kt�r� mia�em jeszcze zanim skierowano mnie do Starej Kopalni.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_04");	//Co by si� nie dzia�o, Bractwo i tak trzyma si� razem.
	AI_StopProcessInfos(self);
};

