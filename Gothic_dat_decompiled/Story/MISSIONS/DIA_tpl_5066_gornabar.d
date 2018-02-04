
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
	description = "Wróci³eœ do obozu?";
};


func int tpl_5066_gornabar_getlost_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5066_GorNaBar_15_00");	//Wróci³eœ do obozu?
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_01");	//Ach, cz³owiek z kopalni. Tak, postanowiliœmy udaæ siê z powrotem do naszego obozu.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_02");	//Wróci³em razem z Gor Na Koshem i Gor Na Videm, jak tylko przynios³eœ jaja.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_03");	//Teraz znowu przej¹³em swoj¹ star¹ posadê, któr¹ mia³em jeszcze zanim skierowano mnie do Starej Kopalni.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_04");	//Co by siê nie dzia³o, Bractwo i tak trzyma siê razem.
	AI_StopProcessInfos(self);
};

