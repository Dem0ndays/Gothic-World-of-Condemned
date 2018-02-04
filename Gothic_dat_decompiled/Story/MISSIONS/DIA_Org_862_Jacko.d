
instance Info_Jacko_EXIT(C_Info)
{
	npc = Org_862_Jacko;
	nr = 999;
	condition = Info_Jacko_EXIT_Condition;
	information = Info_Jacko_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Jacko_EXIT_Condition()
{
	return 1;
};

func void Info_Jacko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_862_Jacko_GoAway(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GoAway_Condition;
	information = ORG_862_Jacko_GoAway_Info;
	permanent = 1;
	important = 1;
};


func int ORG_862_Jacko_GoAway_Condition()
{
	if((Kalom_DrugMonopol != LOG_RUNNING) && (Kalom_DrugMonopol != LOG_SUCCESS) && (idiots_deal != TRUE))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_GoAway_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GoAway_Info_06_00");	//Czego tu do cholery szukasz?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance ORG_862_Jacko_GUARD(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_GUARD_Condition;
	information = ORG_862_Jacko_GUARD_Info;
	permanent = 0;
	important = 1;
};


func int ORG_862_Jacko_GUARD_Condition()
{
};

func void ORG_862_Jacko_GUARD_Info()
{
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_00");	//Czy¿byœmy pob³¹dzili, hê?
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Info_15_01");	//Cor Kalom wie o waszym ma³ym przedsiêwziêciu.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Info_06_02");	//Co? Dlaczego tu jesteœ?
	B_LogEntry(CH1_DrugMonopol,"Znalaz³em nielegaln¹ wytwórniê bagiennego ziela. Jacko i dwóch innych Szkodników zajmowa³o siê tutaj wyrabianiem skrêtów.");
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Jestem tu, ¿eby was ostrzec.",ORG_862_Jacko_GUARD_Templer);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Chcê wiedzieæ ile ta informacja jest dla ciebie warta.",ORG_862_Jacko_GUARD_InfoWert);
	Info_AddChoice(ORG_862_Jacko_GUARD,"Aby po³o¿yæ kres ca³ej tej sprawie!",ORG_862_Jacko_GUARD_Angriff);
};

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//Jestem tu, ¿eby was ostrzec. Cor Kalom wys³a³ piêciu Stra¿ników Œwi¹tynnych, którzy maj¹ was wykoñczyæ.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//¯e jak? Chyba ¿artujesz!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//Mog¹ tu byæ w ka¿dej chwili!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//Niech to szlag! Musimy st¹d wiaæ!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	B_LogEntry(CH1_DrugMonopol,"Ma³a podpucha ze Stra¿nikami Œwi¹tynnymi zmusi³a tych tchórzy do ucieczki. Zdaje siê, ¿e na razie problem zosta³ rozwi¹zany.");
	B_GiveXP(XP_JackoRetired);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00");	//Chcê wiedzieæ ile ta informacja jest dla ciebie warta.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01");	//Ach, wiêc o to ci chodzi... No dobrze. Ty zrobisz coœ dla mnie - ja zrobiê coœ dla ciebie. Proszê, to ca³a ruda jak¹ mam przy sobie.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02");	//Musimy ju¿ iœæ! Tobie zreszt¹ te¿ to radzê!
	B_GiveInvItems(self,other,ItMiNugget,95);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Rozwi¹za³em ten problem po doœæ umiejêtnej gadce. Jacko nieco ta sprawa przeros³a i postanowi³ siê ulotniæ.");
	B_GiveXP(XP_JackoRetired);
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//Chcê po³o¿yæ kres ca³ej tej sprawie!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//Ch³opaki! ChodŸcie no tu na chwilê!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
};


instance ORG_862_Jacko_Banditencamp(C_Info)
{
	npc = Org_862_Jacko;
	nr = 1;
	condition = ORG_862_Jacko_Banditencamp_Condition;
	information = ORG_862_Jacko_Banditencamp_Info;
	permanent = 1;
	description = "A wiêc to tutaj siê zaszyliœcie.";
};


func int ORG_862_Jacko_Banditencamp_Condition()
{
	if((Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08"))
	{
		return TRUE;
	};
};

func void ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output(other,self,"ORG_862_Jacko_Banditencamp_15_00");	//A wiêc to tutaj siê zaszyliœcie.
	AI_Output(self,other,"ORG_862_Jacko_Banditencamp_06_01");	//By³o blisko. Stra¿nicy z Sekty posiekaliby nas na dzwona.
	AI_StopProcessInfos(self);
};


instance org_862_jacko_drugguard(C_Info)
{
	npc = Org_862_Jacko;
	condition = org_862_jacko_drugguard_condition;
	information = org_862_jacko_drugguard_info;
	important = 0;
	permanent = 0;
	description = "Co tu robisz?";
};


func int org_862_jacko_drugguard_condition()
{
	return TRUE;
};

func void org_862_jacko_drugguard_info()
{
	AI_Output(other,self,"ORG_862_Jacko_DRUGGUARD_Info_15_01");	//Co tu robisz?
	AI_Output(self,other,"ORG_862_Jacko_DRUGGUARD_Info_06_02");	//Nic. Zje¿d¿aj!
	B_LogEntry(CH1_DrugMonopol,"Znalaz³em nielegaln¹ wytwórniê bagiennego ziela. Renyu, Jacko i Killian zajmowali siê tutaj wyrabianiem skrêtów.");
	AI_StopProcessInfos(self);
};


instance org_862_jacko_kalom(C_Info)
{
	npc = Org_862_Jacko;
	condition = org_862_jacko_kalom_condition;
	information = org_862_jacko_kalom_info;
	important = 0;
	permanent = 0;
	description = "Jestem tutaj w imieniu Bractwa.";
};


func int org_862_jacko_kalom_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_drugguard) && (Kalom_DrugMonopol == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void org_862_jacko_kalom_info()
{
	AI_Output(other,self,"ORG_862_Jacko_KALOM_Info_15_01");	//Jestem tutaj w imieniu Bractwa.
	AI_Output(self,other,"ORG_862_Jacko_KALOM_Info_06_02");	//O cholera! I pos³ali tu kogoœ takiego jak ty?
};


instance org_862_jacko_angebot(C_Info)
{
	npc = Org_862_Jacko;
	condition = org_862_jacko_angebot_condition;
	information = org_862_jacko_angebot_info;
	important = 0;
	permanent = 0;
	description = "Chcê wam z³o¿yæ ofertê!";
};


func int org_862_jacko_angebot_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_kalom) && !Npc_KnowsInfo(hero,org_862_jacko_kill) && !Npc_KnowsInfo(hero,org_862_jacko_templar))
	{
		return TRUE;
	};
};

func void org_862_jacko_angebot_info()
{
	AI_Output(other,self,"ORG_862_Jacko_ANGEBOT_Info_15_01");	//Chcê wam z³o¿yæ ofertê!
	AI_Output(self,other,"ORG_862_Jacko_ANGEBOT_Info_06_02");	//Jak¹ ofertê?
	AI_Output(other,self,"ORG_862_Jacko_ANGEBOT_Info_15_03");	//Omówiê to jedynie z tym, kto tu rz¹dzi.
	AI_Output(self,other,"ORG_862_Jacko_ANGEBOT_Info_06_04");	//No dobra, w takim razie pogadaj z Renyu. Tylko bez kantów, w przeciwnym razie rozpirzê ci ka¿d¹ pojedyncz¹ koœæ!
	AI_StopProcessInfos(self);
};


instance org_862_jacko_kill(C_Info)
{
	npc = Org_862_Jacko;
	condition = org_862_jacko_kill_condition;
	information = org_862_jacko_kill_info;
	important = 0;
	permanent = 0;
	description = "Chcê po³o¿yæ kres ca³ej tej sprawie!";
};


func int org_862_jacko_kill_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_kalom) && !Npc_KnowsInfo(hero,org_862_jacko_angebot) && !Npc_KnowsInfo(hero,org_862_jacko_templar))
	{
		return TRUE;
	};
};

func void org_862_jacko_kill_info()
{
	var C_Npc Killian;
	var C_Npc Renyu;
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00");	//Chcê po³o¿yæ kres ca³ej tej sprawie!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01");	//Ch³opaki! ChodŸcie no tu na chwilê!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,0,"");
	Npc_SetPermAttitude(Killian,ATT_HOSTILE);
	Npc_SetTempAttitude(Killian,ATT_HOSTILE);
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	Npc_SetTarget(Renyu,hero);
	AI_StartState(Renyu,ZS_Attack,0,"");
	Npc_SetPermAttitude(Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude(Renyu,ATT_HOSTILE);
	Stooges_Fled = TRUE;
};


instance org_862_jacko_templar(C_Info)
{
	npc = Org_862_Jacko;
	condition = org_862_jacko_templar_condition;
	information = org_862_jacko_templar_info;
	important = 0;
	permanent = 0;
	description = "Jestem tu, ¿eby was ostrzec.";
};


func int org_862_jacko_templar_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_kalom) && !Npc_KnowsInfo(hero,org_862_jacko_angebot) && !Npc_KnowsInfo(hero,org_862_jacko_kill))
	{
		return TRUE;
	};
};

func void org_862_jacko_templar_info()
{
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_00");	//Jestem tu, ¿eby was ostrzec. Cor Kalom wys³a³ piêciu Stra¿ników Œwi¹tynnych, którzy maj¹ was wykoñczyæ.
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_01");	//¯e jak? Chyba ¿artujesz!
	AI_Output(other,self,"ORG_862_Jacko_GUARD_Templer_Info_15_02");	//Mog¹ tu byæ w ka¿dej chwili!
	AI_Output(self,other,"ORG_862_Jacko_GUARD_Templer_Info_06_03");	//Niech to szlag! Musimy st¹d wiaæ!
	Info_ClearChoices(ORG_862_Jacko_GUARD);
	B_LogEntry(CH1_DrugMonopol,"Ma³a podpucha ze Stra¿nikami Œwi¹tynnymi zmusi³a tych tchórzy do ucieczki. Zdaje siê, ¿e na razie problem zosta³ rozwi¹zany.");
	B_GiveXP(XP_JackoRetired);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_860_Renyu,"ARBEITSLOS");
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
};

