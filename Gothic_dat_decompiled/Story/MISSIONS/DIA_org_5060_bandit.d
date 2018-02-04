
instance ORG_5060_BANDIT_EXIT(C_Info)
{
	npc = org_5060_bandit;
	nr = 999;
	condition = org_5060_bandit_exit_condition;
	information = org_5060_bandit_exit_info;
	important = 0;
	permanent = 1;
	description = "KONIEC";
};


func int org_5060_bandit_exit_condition()
{
	return TRUE;
};

func void org_5060_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance org_5060_bandit_fakehelp(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_fakehelp_condition;
	information = org_5060_bandit_fakehelp_info;
	permanent = 0;
	important = 1;
	description = "Mo¿esz mi pomóc?";
};


func int org_5060_bandit_fakehelp_condition()
{
	return TRUE;
};

func void org_5060_bandit_fakehelp_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Help_15_00");	//Hej, ty! Czekaj no!
	AI_Output(other,self,"DIA_ORG_5060_Help_15_01");	//Czego ode mnie chcesz?
	AI_Output(self,other,"DIA_ORG_5060_Help_15_02");	//Przyda³aby siê ma³a pomoc mojemu kumplowi i mnie. Polujemy na œcierwojady w okolicy i potrzebujemy kogoœ, kto by nam pomóg³ za³atwiæ te bestie.
	AI_Output(self,other,"DIA_ORG_5060_Help_15_03");	//A ty wydajesz siê byæ odpowiednim cz³owiekiem. Jeœli pomo¿esz mi i mojemu przyjacielowi, dostaniesz oczywiœcie swój udzia³.
	AI_Output(self,other,"DIA_ORG_5060_Help_15_04");	//Co o tym s¹dzisz? Mogê na ciebie liczyæ?
	Info_ClearChoices(org_5060_bandit_fakehelp);
	Info_AddChoice(org_5060_bandit_fakehelp,"Nie interesuje mnie to - poszukaj sobie kogoœ innego.",org_5060_bandit_fakehelp_deny);
	Info_AddChoice(org_5060_bandit_fakehelp,"Wchodzê w to!",org_5060_bandit_fakehelp_accepr);
};

func void org_5060_bandit_fakehelp_deny()
{
	AI_Output(other,self,"DIA_ORG_5060_Help_Deny_15_00");	//Nie interesuje mnie to - poszukaj sobie kogoœ innego.
	AI_Output(self,other,"DIA_ORG_5060_Help_Deny_06_01");	//Nie chcesz mi pomóc? A to spieprzaj st¹d. Nie mam ci ju¿ nic wiêcej do powiedzenia, przyb³êdo.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(org_5060_bandit_fakehelp);
};

func void org_5060_bandit_fakehelp_accepr()
{
	AI_Output(other,self,"DIA_ORG_5060_Help_Accepr_15_00");	//Wchodzê w to!
	AI_Output(self,other,"DIA_ORG_5060_Help_Accepr_06_01");	//Œwietnie, w takim razie chodŸmy, mój kompan ju¿ na nas czeka na dole w tej dolince.
	AI_Output(self,other,"DIA_ORG_5060_Help_Accepr_06_02");	//Pójdê przodem, za mn¹.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
	Info_ClearChoices(org_5060_bandit_fakehelp);
};


instance org_5060_bandit_trapped(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_trapped_condition;
	information = org_5060_bandit_trapped_info;
	permanent = 0;
	important = 1;
};


func int org_5060_bandit_trapped_condition()
{
	if(Npc_KnowsInfo(hero,org_5060_bandit_fakehelp) && (Npc_GetDistToWP(self,"HELPPOINT10") < 500))
	{
		return TRUE;
	};
};

func void org_5060_bandit_trapped_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_00");	//No, to jesteœmy. Tam siedzi mój kumpel.
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_01");	//Mo¿emy siê teraz zaj¹æ robot¹.
	AI_Output(other,self,"DIA_ORG_5060_Trapped_15_02");	//Gdzie s¹ te œcierwojady?
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_03");	//Ju¿ o tej sprawie rozmyœlaliœmy. Nie bêdziemy musieli ju¿ wiêcej polowaæ na ¿adne œcierwojady.
	AI_Output(other,self,"DIA_ORG_5060_Trapped_15_04");	//¯e co?
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_05");	//No có¿, skoro ju¿ tu jesteœ, znaleŸliœmy ca³kiem inn¹ drogê na ob³owienie siê.
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_06");	//SprawdŸmy, co tam takiego wartoœciowego przy sobie trzymasz.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,0,"");
	Npc_SetTarget(org_5061_bandit,hero);
	AI_StartState(org_5061_bandit,ZS_Attack,0,"");
};


instance ORG_5060_BANDIT_BEATED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_beated_condition;
	information = org_5060_bandit_beated_info;
	permanent = 0;
	important = 1;
};


func int org_5060_bandit_beated_condition()
{
	if((Npc_KnowsInfo(hero,org_5060_bandit_trapped) && Npc_HasItems(hero,ItWr_Fire_Letter_01)) || (Npc_HasItems(hero,ItWr_Fire_Letter_02) && (self.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return TRUE;
	};
};

func void org_5060_bandit_beated_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_00");	//A co to mia³eœ przy sobie za list?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_01");	//Interesuj¹ce, wygl¹da na doœæ cenny. Na pewno dostanê za niego przyzwoit¹ nagrodê. Hehe.
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_02");	//A teraz zje¿d¿aj mi st¹d.
	CreateInvItem(self,ItWr_Fire_Letter_02);
	Npc_RemoveInvItem(hero,ItWr_Fire_Letter_01);
	Npc_RemoveInvItem(hero,ItWr_Fire_Letter_02);
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance ORG_5060_BANDIT_DEFEATED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_defeated_condition;
	information = org_5060_bandit_defeated_info;
	permanent = 0;
	important = 1;
};


func int org_5060_bandit_defeated_condition()
{
	if(Npc_KnowsInfo(hero,org_5060_bandit_trapped) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	{
		return TRUE;
	};
};

func void org_5060_bandit_defeated_info()
{
	AI_OutputSVM(self,other,"$LETSFORGETOURLITTLEFIGHT");
	Npc_ExchangeRoutine(self,"START");
};

