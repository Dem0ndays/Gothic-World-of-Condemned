
instance ORG_861_Killian_Exit(C_Info)
{
	npc = Org_861_Killian;
	nr = 999;
	condition = ORG_861_Killian_Exit_Condition;
	information = ORG_861_Killian_Exit_Info;
	important = 0;
	permanent = 1;
	description = "KONIEC";
};


func int ORG_861_Killian_Exit_Condition()
{
	return TRUE;
};

func void ORG_861_Killian_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_861_Killian_GetLost(C_Info)
{
	npc = Org_861_Killian;
	nr = 1;
	condition = ORG_861_Killian_GetLost_Condition;
	information = ORG_861_Killian_GetLost_Info;
	permanent = 1;
	important = 1;
};


func int ORG_861_Killian_GetLost_Condition()
{
};

func void ORG_861_Killian_GetLost_Info()
{
	AI_Output(self,other,"Org_861_Killian_GetLost_Info_13_00");	//Spadaj!
	AI_StopProcessInfos(self);
};


instance ORG_861_KILLIAN_WORK(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_work_condition;
	information = org_861_killian_work_info;
	important = 0;
	permanent = 0;
	description = "Co tam u ciebie?";
};


func int org_861_killian_work_condition()
{
	return TRUE;
};

func void org_861_killian_work_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"Org_861_Killian_WORK_Info_13_02");	//Zostaw mnie w spokoju! Zajêty jestem!
};


instance ORG_861_KILLIAN_DEAL(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_deal_condition;
	information = org_861_killian_deal_info;
	important = 0;
	permanent = 0;
	description = "Jak leci, kumplu?";
};


func int org_861_killian_deal_condition()
{
	if(idiots_deal == TRUE)
	{
		return TRUE;
	};
};

func void org_861_killian_deal_info()
{
	AI_Output(other,self,"Org_861_Killian_DEAL_Info_15_01");	//Jak leci, kumplu?
	AI_Output(self,other,"Org_861_Killian_DEAL_Info_13_02");	//Mo¿e i mamy umowê, ale to nie znaczy, ¿e jestem twoim kumplem, z³amasie!
};


instance ORG_861_KILLIAN_LOST(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_lost_condition;
	information = org_861_killian_lost_info;
	important = 0;
	permanent = 0;
	description = "I co frajerze? Spuœcisz z tonu?";
};


func int org_861_killian_lost_condition()
{
	var C_Npc Killian;
	Killian = Hlp_GetNpc(Org_861_Killian);
	if((Killian.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Kalom_DrugMonopol == LOG_RUNNING) && Npc_KnowsInfo(hero,org_860_renyu_deal))
	{
		return TRUE;
	};
};

func void org_861_killian_lost_info()
{
	AI_Output(other,self,"Org_861_Killian_LOST_Info_15_01");	//I co frajerze? Spuœcisz z tonu?
	AI_Output(self,other,"Org_861_Killian_LOST_Info_13_02");	//Hej, KUMPLU, no przecie¿ nie wiedzia³em, ¿e Bractwo przyk³ada do tego tak du¿¹ wagê!
	AI_Output(other,self,"Org_861_Killian_LOST_Info_15_03");	//Nie jestem twoim kumplem, z³amasie!
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
};

