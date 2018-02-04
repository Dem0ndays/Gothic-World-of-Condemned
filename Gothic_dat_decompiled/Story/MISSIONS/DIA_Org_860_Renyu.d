
instance Info_Renyu_EXIT(C_Info)
{
	npc = Org_860_Renyu;
	nr = 999;
	condition = Info_Renyu_EXIT_Condition;
	information = Info_Renyu_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Renyu_EXIT_Condition()
{
	return 1;
};

func void Info_Renyu_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_860_Renyu_GetLost(C_Info)
{
	npc = Org_860_Renyu;
	nr = 1;
	condition = ORG_860_Renyu_GetLost_Condition;
	information = ORG_860_Renyu_GetLost_Info;
	permanent = 1;
	important = 1;
};


func int ORG_860_Renyu_GetLost_Condition()
{
};

func void ORG_860_Renyu_GetLost_Info()
{
	AI_Output(self,other,"Org_860_Renyu_GetLost_Info_06_00");	//Spadaj!
	AI_StopProcessInfos(self);
};


instance org_860_renyu_deal(C_Info)
{
	npc = Org_860_Renyu;
	condition = org_860_renyu_deal_condition;
	information = org_860_renyu_deal_info;
	important = 0;
	permanent = 0;
	description = "Jestem tutaj, aby z³o¿yæ wam pewn¹ propozycjê.";
};


func int org_860_renyu_deal_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_angebot) && (Kalom_DrugMonopol == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void org_860_renyu_deal_info()
{
	AI_Output(other,self,"ORG_860_Renyu_DEAL_Info_15_01");	//Jestem tutaj, aby z³o¿yæ wam pewn¹ propozycjê.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_Info_06_02");	//Hm... ciekawe, o co chodzi?
	AI_Output(other,self,"ORG_860_Renyu_DEAL_Info_15_03");	//Bractwo wie, co sobie tutaj wyprawiliœcie i przys³ali mnie, bym po³o¿y³ temu kres!
	AI_Output(self,other,"ORG_860_Renyu_DEAL_Info_06_04");	//PrzejdŸ do rzeczy!
	Info_ClearChoices(org_860_renyu_deal);
	Info_AddChoice(org_860_renyu_deal,"¯¹dam 500 bry³ek.",org_860_renyu_deal_500);
	Info_AddChoice(org_860_renyu_deal,"¯¹dam 250 bry³ek.",org_860_renyu_deal_250);
};

func void org_860_renyu_deal_500()
{
	var C_Npc Killian;
	var C_Npc Jacko;
	AI_Output(other,self,"ORG_860_Renyu_DEAL_500_Info_15_01");	//Dacie 500 bry³ek, a zadbam o to, by Bractwo da³o wam spokój.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_500_Info_06_02");	//A jeœli nie zap³acimy? Co wtedy zrobisz?
	AI_Output(other,self,"ORG_860_Renyu_DEAL_500_Info_15_03");	//Wtedy przyœlê wam kilku Stra¿ników Œwi¹tynnych, którzy dostan¹ ode mnie gruby worek ziela, ¿eby wypruli wam flaki!
	AI_Output(self,other,"ORG_860_Renyu_DEAL_500_Info_06_04");	//Wiesz co - myœlê, ¿e powinniœmy pokazaæ Bractwu, ¿e z nami nie ma ¿artów. Poœlemy im twoje szcz¹tki jako ostrze¿enie!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,1,"");
	Jacko = Hlp_GetNpc(Org_862_Jacko);
	Npc_SetTarget(Jacko,hero);
	AI_StartState(Jacko,ZS_Attack,1,"");
};

func void org_860_renyu_deal_250()
{
	AI_Output(other,self,"ORG_860_Renyu_DEAL_250_Info_15_01");	//Dacie 250 bry³ek, a zadbam o to, by Bractwo zostawi³o was w spokoju.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_250_Info_06_02");	//Hmmm... no dobra. Zgoda. Ale jeœli spróbujesz mnie okiwaæ, to lepiej módl siê, byœ mnie ju¿ nigdy nie spotka³ na swojej drodze. To jak, umowa stoi?
	AI_Output(other,self,"ORG_860_Renyu_DEAL_250_Info_15_03");	//Pewnie, dawaj tê rudê!
	Info_ClearChoices(org_860_renyu_deal);
	CreateInvItems(self,ItMiNugget,250);
	B_GiveInvItems(self,other,ItMiNugget,250);
	idiots_deal = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Dosta³em od Renyu 250 bry³ek rudy. W zamian za to bêdzie móg³ kontynuowaæ swe prace.");
	Kalom_DrugMonopol = LOG_FAILED;
	Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	Info_Kalom_Success.permanent = 0;
};


instance ORG_860_RENYU_LOST(C_Info)
{
	npc = Org_860_Renyu;
	condition = org_860_renyu_lost_condition;
	information = org_860_renyu_lost_info;
	important = 0;
	permanent = 0;
	description = "I co powiesz teraz, sparszywia³a kaleko?!";
};


func int org_860_renyu_lost_condition()
{
	var C_Npc Renyu;
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	if((Renyu.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,org_860_renyu_deal) && (Kalom_DrugMonopol == LOG_RUNNING) && (idiots_deal == FALSE))
	{
		return TRUE;
	};
};

func void org_860_renyu_lost_info()
{
	AI_Output(other,self,"Org_861_Killian_WORK_Info_15_01");	//I co powiesz teraz, sparszywia³a kaleko?!
	AI_Output(self,other,"ORG_860_Renyu_LOST_Info_06_02");	//Ju¿ dobrze, cz³owieku, wygra³eœ! Przestaniemy! Zio³o jest twoje!
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_862_Jacko,"ARBEITSLOS");
	B_LogEntry(CH1_DrugMonopol,"Uda³o mi siê przekonaæ Renyu, aby zaprzesta³ swojego ma³ego procederu.");
	B_GiveXP(XP_JackoRetired);
};

