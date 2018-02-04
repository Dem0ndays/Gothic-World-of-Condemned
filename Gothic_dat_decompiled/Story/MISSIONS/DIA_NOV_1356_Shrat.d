
instance DIA_Shrat_Exit(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Shrat_WhyHere(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	permanent = 0;
	description = "Co tu robisz?";
};


func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//Czy pozwoli³em ci siê do mnie odezwaæ?!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//Tylko ¿artujê! Te cholerne œwiry zaczynaj¹ mnie ju¿ denerwowaæ, dlatego tu jestem!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//"Nie odzywaj siê do mnie!" - "Módl siê o ³askê Œni¹cego!" - "Twoje zadanie jest szczególnie wa¿ne!"
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//Przy tych ludziach mo¿na w mig zwariowaæ. Nic dziwnego, ¿e mieszkaj¹ tam sami wariaci.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//Jestem Shrat, Nowicjusz pierwszego stopnia. I bêdê nim ju¿ do koñca ¿ycia!
};


instance DIA_Shrat_JoinPSI(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	permanent = 0;
	description = "Chcia³bym do³¹czyæ do Bractwa. Mo¿esz mi pomóc?";
};


func int DIA_Shrat_JoinPSI_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Shrat_JoinPSI_Info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//Chcia³bym do³¹czyæ do Bractwa. Mo¿esz mi pomóc?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//Chcesz tu zamieszkaæ? A ja zastanawiam siê w³aœnie jak st¹d uciec!
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//Moglibyœmy przemierzyæ ca³¹ koloniê, odci¹¿yæ kilku frajerów z ich gotówki, zebraæ trochê rudy - co ty na to?
};


instance DIA_Shrat_ComeWithMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	permanent = 1;
	description = "Jasne! Trzymajmy siê razem! ChodŸ ze mn¹!";
};


func int DIA_Shrat_ComeWithMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//Jasne! Trzymajmy siê razem! ChodŸ ze mn¹!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//To w³aœnie chcia³em us³yszeæ! ChodŸmy!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Shrat_LeaveMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	permanent = 1;
	description = "Tutaj nasze drogi siê rozchodz¹. Dalej pójdê sam.";
};


func int DIA_Shrat_LeaveMe_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void DIA_Shrat_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//Tutaj nasze drogi siê rozchodz¹. Dalej pójdê sam.
	if(!Npc_KnowsInfo(hero,nov_1356_shrat_tavern))
	{
		AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//Dobra. Ja wracam do mojej kryjówki na bagnach. Uwa¿aj na siebie!
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Shrat_LeaveMe_02_02");	//W porz¹dku. W takim razie bêdê w karczmie w Nowym Obozie. Jeœli byœ mnie kiedyœ potrzebowa³, to w³aœnie tam mnie znajdziesz. Do tego czasu uwa¿aj na siebie!
		Npc_ExchangeRoutine(self,"NEWCAMP");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
};


instance NOV_1356_SHRAT_WELCOME(C_Info)
{
	npc = NOV_1356_Shrat;
	condition = nov_1356_shrat_welcome_condition;
	information = nov_1356_shrat_welcome_info;
	important = 1;
	permanent = 0;
};


func int nov_1356_shrat_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1356_shrat_welcome_info()
{
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_01");	//O cz³owieku, wygl¹da na to, ¿e daleko zaszed³eœ u tych œwirów. Och, zapomnia³em, przecie¿ nie jestem godzien, by do ciebie mówiæ, prawda? Hehe.
	AI_StopProcessInfos(self);
};


instance nov_1356_shrat_tavern(C_Info)
{
	npc = NOV_1356_Shrat;
	condition = nov_1356_shrat_tavern_condition;
	information = nov_1356_shrat_tavern_info;
	important = 1;
	permanent = 0;
};


func int nov_1356_shrat_tavern_condition()
{
	if((Npc_GetDistToWP(self,"NC_TAVERN_ROOM01") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void nov_1356_shrat_tavern_info()
{
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_01");	//O cz³owieku, wygl¹da na to, ¿e daleko zaszed³eœ u tych œwirów. Och, zapomnia³em, przecie¿ nie jestem godzien, by do ciebie mówiæ, prawda? Hehe.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_02");	//...nie wygl¹da wcale tak Ÿle, co?
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_03");	//Myœlê, ¿e jeœli bêdziesz chcia³ nastêpnym razem samemu iœæ dalej, to ja sobie zostanê tutaj, zamiast niepotrzebnie wracaæ do tego zdegradowanego potworami bagna.
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_04");	//Jakoœ bardziej odpowiada mi to towarzystwo od ry¿ówki, ani¿eli te b³otne wê¿e. Hehe.
	B_GiveXP(XP_SHRAT);
	AI_StopProcessInfos(self);
};

