
instance DIA_KalomsGuard_Exit(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 999;
	condition = DIA_KalomsGuard_Exit_Condition;
	information = DIA_KalomsGuard_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KalomsGuard_PERM(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = DIA_KalomsGuard_PERM_Condition;
	information = DIA_KalomsGuard_PERM_Info;
	permanent = 1;
	description = "Chyba nie b�dziesz mia� nic przeciwko, je�li tam wejd�?";
};


func int DIA_KalomsGuard_PERM_Condition()
{
	if((TPL_1406_Templer.aivar[AIV_PASSGATE] == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_KalomsGuard_PERM_Info()
{
	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00");	//Chyba nie b�dziesz mia� nic przeciwko, je�li tam wejd�?
	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01");	//Okazuj mojemu mistrzowi nale�yty szacunek, albo nie po�yjesz d�ugo!
	AI_StopProcessInfos(self);
};


instance dia_kalomsguard_house(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = dia_kalomsguard_house_condition;
	information = dia_kalomsguard_house_info;
	permanent = 0;
	description = "Czym si� tutaj zajmujesz?";
};


func int dia_kalomsguard_house_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_house_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_HOUSE_15_00");	//Czym si� tutaj zajmujesz?
	AI_Output(self,other,"DIA_KalomsGuard_HOUSE_13_01");	//Zanim m�j mistrz odszed�, nakaza� mi czuwa� nad jego domem.
	AI_Output(self,other,"DIA_KalomsGuard_HOUSE_13_02");	//Dlatego mam dopilnowa�, �eby nikt nie grzeba� mu po jego skrzyni. I tak te� w�a�nie b�dzie, bowiem jedyn� osob�, kt�ra ma do niej klucz, jestem ja.
	CreateInvItem(self,itkey_kalom_gur_01);
};


instance DIA_KALOMSGUARD_TRUHE(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = dia_kalomsguard_truhe_condition;
	information = dia_kalomsguard_truhe_info;
	permanent = 0;
	description = "A co takiego specjalnego jest w jego skrzyni?";
};


func int dia_kalomsguard_truhe_condition()
{
	if(Npc_KnowsInfo(hero,dia_kalomsguard_house))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_truhe_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_TRUHE_15_00");	//A co takiego specjalnego jest w jego skrzyni?
	AI_Output(self,other,"DIA_KalomsGuard_TRUHE_13_01");	//Znajduj� si� tam osobiste rzeczy mojego mistrza, Cor Kaloma.
	AI_Output(self,other,"DIA_KalomsGuard_TRUHE_13_02");	//Wi�cej nie musisz wiedzie�.
	AI_StopProcessInfos(self);
};


const string TPL_1406_CHECKPOINT = "PSI_LABOR_IN";

instance info_tpl_1406_firstwarn(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_firstwarn_condition;
	information = info_tpl_1406_firstwarn_info;
	permanent = 1;
	important = 1;
};


var int guard_psi;

func int info_tpl_1406_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_tpl_1406_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_13_01");	//ST�J! Nikomu nie wolno przeszkadza� mojemu mistrzowi w jego eksperymentach!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	kaloms_guard = LOG_RUNNING;
	if(guard_psi == FALSE)
	{
		Log_CreateTopic(CH1_KALOMSGUARD,LOG_MISSION);
		B_LogEntry(CH1_KALOMSGUARD,"Przy wej�ciu do laboratorium Cor Kaloma zatrzyma� mnie jego osobisty stra�nik. B�d� musia� znale�� spos�b, jak ko�o niego przej�� i dosta� si� do Kaloma.");
		Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_RUNNING);
		guard_psi = TRUE;
	};
	if(Npc_HasItems(hero,ItAt_Crawler_01))
	{
		Info_ClearChoices(info_tpl_1406_firstwarn);
		Info_AddChoice(info_tpl_1406_firstwarn,"Mam wn�trzno�ci pe�zacza dla Cor Kaloma.",info_tpl_1406_firstwarn_condition_crawler);
	}
	else if(namib_gotocalom == TRUE)
	{
		Info_AddChoice(info_tpl_1406_firstwarn,"Baal Namib da� mi pozwolenie na wizyt� u Cor Kaloma.",info_tpl_1406_firstwarn_condition_namib);
	}
	else if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		Info_AddChoice(info_tpl_1406_firstwarn,"Przynosz� Cor Kalomowi dostaw� bagiennego ziela.",info_tpl_1406_firstwarn_condition_weed);
	}
	else if(!Npc_HasItems(hero,ItAt_Crawler_01) || (namib_gotocalom != TRUE) || (BaalOrun_FetchWeed != LOG_RUNNING))
	{
		AI_StopProcessInfos(self);
	};
};

func void info_tpl_1406_firstwarn_condition_crawler()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_CRAWLER_15_01");	//Mam wn�trzno�ci pe�zacza dla Cor Kaloma.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_CRAWLER_13_02");	//W porz�dku, mo�esz mu je dostarczy� osobi�cie.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	kaloms_guard = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Przynios�em Cor Kalomowi kilka wn�trzno�ci pe�zaczy, dzi�ki czemu stra�nik pozwoli� mi wej��.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1406_firstwarn_condition_namib()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_NAMIB_15_01");	//Baal Namib da� mi pozwolenie na wizyt� u Cor Kaloma.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_NAMIB_13_02");	//No, skoro Baal Namib osobi�cie udzieli� ci aprobaty, to mo�esz wej��.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	kaloms_guard = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Dzi�ki aprobacie Baal Namiba, stra�nik Cor Kaloma pozwoli� mi przej��.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1406_firstwarn_condition_weed()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_WEED_15_01");	//Przynosz� Cor Kalomowi dostaw� bagiennego ziela.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_WEED_13_02");	//W porz�dku, mo�esz przej��.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	kaloms_guard = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Kiedy tylko Baal Orun zleci� mi zaniesienie dostawy bagiennego ziela Cor Kalomowi, jego stra�nik pozwoli� mi przej��.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance INFO_TPL_1406_LASTWARN(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_lastwarn_condition;
	information = info_tpl_1406_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1406_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 75)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_tpl_1406_lastwarn_info()
{
	AI_Output(self,hero,"Info_Tpl_1406_LastWarn_13_01");	//Zr�b jeszcze jeden krok, a b�dzie to ju� ostatni krok w twoim �yciu.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_TPL_1406_ATTACK(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_attack_condition;
	information = info_tpl_1406_attack_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1406_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 75)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_tpl_1406_attack_info()
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

