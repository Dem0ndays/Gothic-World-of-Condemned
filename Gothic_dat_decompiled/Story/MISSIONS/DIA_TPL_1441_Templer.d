
const string TPL_1441_CHECKPOINT = "PSI_TEMPLE_IN";

instance Info_TPL_1441_FirstWarn(C_Info)
{
	npc = TPL_1441_Templer;
	nr = 1;
	condition = Info_TPL_1441_FirstWarn_Condition;
	information = Info_TPL_1441_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_TPL_1441_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_TPL_1441_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_13_01");	//ST�J! Na �wi�tynne wzg�rze mo�na wej�� tylko za pozwoleniem kt�rego� z Guru!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	if(Npc_KnowsInfo(hero,PC_Psionic_BROTHERHOOD_TODO))
	{
		Info_ClearChoices(Info_TPL_1441_FirstWarn);
		Info_AddChoice(Info_TPL_1441_FirstWarn,"Sam Y'Berion udzieli� mi pozwolenia.",Info_TPL_1441_FirstWarn_Condition_YBERION);
		if(Npc_GetTrueGuild(hero) != GIL_NOV)
		{
			Info_AddChoice(Info_TPL_1441_FirstWarn,"Przysy�a mnie Nowicjusz Lester.",Info_TPL_1441_FirstWarn_Condition_LESTER);
		};
		if(Npc_GetTrueGuild(hero) == GIL_NOV)
		{
			Info_AddChoice(Info_TPL_1441_FirstWarn,"Przysy�a mnie Baal Namib.",info_tpl_1441_firstwarn_condition_namib);
		};
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void Info_TPL_1441_FirstWarn_Condition_YBERION()
{
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_YBERION_15_01");	//Sam Y'Berion udzieli� mi pozwolenia.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_YBERION_13_02");	//K�amcy �atwo mog� straci� j�zyk, wi�c uwa�aj co m�wisz.
};

func void Info_TPL_1441_FirstWarn_Condition_LESTER()
{
	var C_Npc Templer;
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_LESTER_15_01");	//Przysy�a mnie Nowicjusz Lester. Chcia�bym ofiarowa� moje us�ugi Y'Berionowi.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_LESTER_13_02");	//Znam Lestera. Mo�na mu zaufa�. Mo�esz przej��.
	Info_ClearChoices(Info_TPL_1441_FirstWarn);
	Templer = Hlp_GetNpc(TPL_1442_Templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
	Templer.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1441_firstwarn_condition_namib()
{
	var C_Npc Templer;
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_NAMIB_15_01");	//Przysy�a mnie Baal Namib. Pono� Y'Berionowi potrzebna jest pomoc Nowicjusza.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_NAMIB_13_02");	//Baal Namib ju� nas o tym poinformowa�. Mo�esz przej��.
	Info_ClearChoices(Info_TPL_1441_FirstWarn);
	Templer = Hlp_GetNpc(TPL_1442_Templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
	Templer.aivar[AIV_PASSGATE] = TRUE;
};


instance Info_TPL_1441_LastWarn(C_Info)
{
	npc = TPL_1441_Templer;
	nr = 1;
	condition = Info_TPL_1441_LastWarn_Condition;
	information = Info_TPL_1441_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_TPL_1441_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_TPL_1441_LastWarn_Info()
{
	AI_Output(self,hero,"Info_TPL_1441_LastWarn_13_01");	//Jeszcze jeden krok, a b�dzie po tobie.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_TPL_1441_Attack(C_Info)
{
	npc = TPL_1441_Templer;
	nr = 1;
	condition = Info_TPL_1441_Attack_Condition;
	information = Info_TPL_1441_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_TPL_1441_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_TPL_1441_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

