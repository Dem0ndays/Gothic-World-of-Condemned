
instance DIA_PAUL_EXIT(C_Info)
{
	npc = non_5054_paul;
	nr = 999;
	condition = dia_paul_exit_condition;
	information = dia_paul_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_paul_exit_condition()
{
	return 1;
};

func void dia_paul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_paul_who(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_who_condition;
	information = dia_paul_who_info;
	permanent = 0;
	important = 0;
	description = "Co tam?";
};


func int dia_paul_who_condition()
{
	if(paul_oc == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_paul_who_info()
{
	AI_Output(other,self,"DIA_PAUL_WHO_15_00");	//Co tam?
	AI_Output(self,other,"DIA_PAUL_WHO_02_01");	//Czego ode mnie chcesz? Ty te¿ chêtny, ¿eby mi w zêby przywaliæ?
};


instance dia_paul_oc(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_oc_condition;
	information = dia_paul_oc_info;
	permanent = 0;
	important = 0;
	description = "Jestem tu, by z³o¿yæ ci propozycjê.";
};


func int dia_paul_oc_condition()
{
	if((paul_oc == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_paul_who))
	{
		return 1;
	};
};

func void dia_paul_oc_info()
{
	AI_Output(other,self,"DIA_PAUL_OC_15_00");	//Jestem tu, by z³o¿yæ ci propozycjê.
	AI_Output(self,other,"DIA_PAUL_OC_02_01");	//Co to za propozycja?
	AI_Output(other,self,"DIA_PAUL_OC_02_02");	//Szansa do³¹czenia do Starego Obozu.
	AI_Output(self,other,"DIA_PAUL_OC_02_03");	//Ach, pewnie jesteœ jego dzia³aczem, co? Ostatnio jeden z waszych nieŸle mi siê dobra³ do skóry.
	AI_Output(self,other,"DIA_PAUL_OC_02_04");	//Wiêc czemu niby mia³bym chcieæ do was do³¹czyæ?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Bo w Starym Obozie bêdziesz mia³ perspektywy.",dia_paul_oc_chances);
	Info_AddChoice(dia_paul_oc,"¯ycie w Starym Obozie jest prawdziwie wolnym ¿yciem.",dia_paul_oc_free);
	Info_AddChoice(dia_paul_oc,"Bo inaczej dostaniesz w zêby, Paul.",dia_paul_oc_maul);
};

func void dia_paul_oc_chances()
{
	AI_Output(other,self,"DIA_PAUL_OC_CHANCES_Info_15_01");	//Bo w Starym Obozie bêdziesz mia³ perspektywy.
	AI_Output(self,other,"DIA_PAUL_OC_CHANCES_Info_14_02");	//Doprawdy? A jakie¿ to perspektywy na mnie czekaj¹?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Bêdziesz móg³ wypracowaæ sobie wysok¹ pozycjê.",dia_paul_oc_workhard);
	Info_AddChoice(dia_paul_oc,"Bêdziesz móg³ zarobiæ od groma rudy w kopalni.",dia_paul_oc_earnore);
};

func void dia_paul_oc_free()
{
	AI_Output(other,self,"DIA_PAUL_OC_FREE_Info_15_01");	//¯ycie w Starym Obozie jest prawdziwie wolnym ¿yciem.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_02");	//Nie s¹dzê. Nie mam siê co spodziewaæ swobodnego ¿ycia w obozie, w którym na powitanie dostajê po mordzie.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_03");	//ZnajdŸ sobie innego pacana. Moja noga w Starym Obozie nigdy nie postanie.
	paul_oc = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nie uda³o mi siê przekonaæ Paula, ¿e najlepsze bêdzie dla niego do³¹czenie do Starego Obozu. Siekaczowi siê to nie spodoba.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_maul()
{
	AI_Output(other,self,"DIA_PAUL_OC_MAUL_Info_15_01");	//Bo inaczej dostaniesz w zêby, Paul.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_02");	//Wiedzia³em, ¿e jesteœ dok³adnie takim samym obdartusem co tamten.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_03");	//Spadaj st¹d!
	paul_oc = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nie uda³o mi siê przekonaæ Paula, ¿e najlepsze bêdzie dla niego do³¹czenie do Starego Obozu. Siekaczowi siê to nie spodoba.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_workhard()
{
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_15_01");	//Bêdziesz móg³ wypracowaæ sobie wysok¹ pozycjê.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_02");	//Ty te¿ tak zrobi³eœ?
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_14_03");	//Otó¿ to.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_04");	//I zdaje siê, ¿e nieŸle ci idzie.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_05");	//Myœlê, ¿e ruszê w drogê i zerknê na ten obóz.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_06");	//Dziêki za pomoc!
	paul_oc = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_PAULOC,LOG_SUCCESS);
	B_LogEntry(CH1_PAULOC,"Uda³o mi siê przekonaæ Paula, ¿e najlepsze bêdzie dla niego do³¹czenie do Starego Obozu. Wykona³em swoje zadanie, Siekacz bêdzie wniebowziêty.");
	B_GiveXP(XP_PAUL);
	Info_ClearChoices(dia_paul_oc);
	Npc_ExchangeRoutine(self,"OLDCAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OLDCAMP");
};

func void dia_paul_oc_earnore()
{
	AI_Output(other,self,"DIA_PAUL_OC_EARNORE_Info_15_01");	//Bêdziesz móg³ zarobiæ od groma rudy w kopalni.
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_02");	//Mam dobrowolnie tyraæ w kopalni?
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_03");	//Nie, to ju¿ wolê poszukaæ sobie innego obozu, zamiast siê mordowaæ dla tych Magnatów.
	paul_oc = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Nie uda³o mi siê przekonaæ Paula, ¿e najlepsze bêdzie dla niego do³¹czenie do Starego Obozu. Siekaczowi siê to nie spodoba.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};


instance DIA_PAUL_NOW(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_now_condition;
	information = dia_paul_now_info;
	permanent = 1;
	important = 0;
	description = "Jak tam?";
};


func int dia_paul_now_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_success))
	{
		return 1;
	};
};

func void dia_paul_now_info()
{
	AI_Output(other,self,"DIA_PAUL_NOW_15_00");	//Jak tam?
	AI_Output(self,other,"DIA_PAUL_NOW_02_01");	//Dobrze. Stary Obóz nie jest wcale takim z³ym miejscem do ¿ycia.
	AI_Output(self,other,"DIA_PAUL_NOW_02_02");	//Przynajmniej lepsze to, ni¿ jakbym mia³ siê ci¹gle przedzieraæ przez tê dzicz na zewn¹trz.
	AI_Output(self,other,"DIA_PAUL_NOW_02_03");	//Na razie bêdê pracowa³ u Huno. Obieca³, ¿e weŸmie mnie na czeladnika i przyuczy do kowalstwa.
};

