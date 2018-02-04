
instance TPL_5065_GORNAVID_EXIT(C_Info)
{
	npc = tpl_5065_gornavid;
	nr = 999;
	condition = tpl_5065_gornavid_exit_condition;
	information = tpl_5065_gornavid_exit_info;
	important = 0;
	permanent = 1;
	description = "KONIEC";
};


func int tpl_5065_gornavid_exit_condition()
{
	return TRUE;
};

func void tpl_5065_gornavid_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_5065_GORNAVID_GETLOST(C_Info)
{
	npc = tpl_5065_gornavid;
	nr = 1;
	condition = tpl_5065_gornavid_getlost_condition;
	information = tpl_5065_gornavid_getlost_info;
	permanent = 1;
	important = 0;
	description = "A ty co tutaj robisz?";
};


func int tpl_5065_gornavid_getlost_condition()
{
	return TRUE;
};

func void tpl_5065_gornavid_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5065_GorNaVid_15_00");	//A ty co tutaj robisz?
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_01");	//Nie przeszkadzaj mi, musz� wype�ni� swoje zadania.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_02");	//Ach, to ty! Cz�owiek, kt�ry za�atwi� nam jaja kr�lowej pe�zaczy.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_03");	//My w mi�dzyczasie postanowili�my z powrotem wr�ci� do naszego obozu.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_04");	//Byli�my tam po prostu w celu zebrania wydzieliny, a �e ju� upora�e� si� z tym zadaniem, to nie jeste�my tam d�u�ej potrzebni.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_05");	//Dlatego wr�cili�my i wype�niamy powierzone nam zadania, kt�re otrzymali�my jeszcze zanim zostali�my pos�ani do kopalni.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_06");	//Rozejrzyj si�. Gor Na Bar i Gor Na Kosh pewnie te� s� ju� gdzie� w obozie.
	AI_StopProcessInfos(self);
};

