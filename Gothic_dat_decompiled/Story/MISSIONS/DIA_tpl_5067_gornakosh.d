
instance TPL_5067_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_5067_gornakosh;
	nr = 999;
	condition = tpl_5067_gornakosh_exit_condition;
	information = tpl_5067_gornakosh_exit_info;
	important = 0;
	permanent = 1;
	description = "KONIEC";
};


func int tpl_5067_gornakosh_exit_condition()
{
	return TRUE;
};

func void tpl_5067_gornakosh_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_5067_GORNAKOSH_GETLOST(C_Info)
{
	npc = tpl_5067_gornakosh;
	nr = 1;
	condition = tpl_5067_gornakosh_getlost_condition;
	information = tpl_5067_gornakosh_getlost_info;
	permanent = 1;
	important = 0;
	description = "Co tu robisz?";
};


func int tpl_5067_gornakosh_getlost_condition()
{
	return TRUE;
};

func void tpl_5067_gornakosh_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5067_GorNaKosh_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_01");	//My si� ju� czasem nie poznali�my? W Starej Kopalni?
	AI_Output(other,self,"DIA_TPL_5067_GorNaKosh_13_02");	//Na to wygl�da.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_03");	//Wr�ci�em do obozu razem z Gor Na Barem i Gor Na Videm, jak tylko sko�czyli�my tam nasz� robot�.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_04");	//Teraz jeste�my tutaj i czuwamy nad obozem, tak jak wtedy, zanim zostali�my wys�ani do Starej Kopalni.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_05");	//Reszta pewnie te� gdzie� tu jest. Rozgl�dnij si�.
	AI_StopProcessInfos(self);
};

