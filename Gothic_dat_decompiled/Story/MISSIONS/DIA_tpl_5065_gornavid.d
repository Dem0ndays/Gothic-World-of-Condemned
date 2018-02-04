
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
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_01");	//Nie przeszkadzaj mi, muszê wype³niæ swoje zadania.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_02");	//Ach, to ty! Cz³owiek, który za³atwi³ nam jaja królowej pe³zaczy.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_03");	//My w miêdzyczasie postanowiliœmy z powrotem wróciæ do naszego obozu.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_04");	//Byliœmy tam po prostu w celu zebrania wydzieliny, a ¿e ju¿ upora³eœ siê z tym zadaniem, to nie jesteœmy tam d³u¿ej potrzebni.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_05");	//Dlatego wróciliœmy i wype³niamy powierzone nam zadania, które otrzymaliœmy jeszcze zanim zostaliœmy pos³ani do kopalni.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_06");	//Rozejrzyj siê. Gor Na Bar i Gor Na Kosh pewnie te¿ s¹ ju¿ gdzieœ w obozie.
	AI_StopProcessInfos(self);
};

