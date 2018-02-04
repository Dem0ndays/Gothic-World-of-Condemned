
instance DIA_Grd_215_Torwache_Exit(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 999;
	condition = DIA_Grd_215_Torwache_Exit_Condition;
	information = DIA_Grd_215_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grd_215_Torwache_PERM(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_PERM_Condition;
	information = DIA_Grd_215_Torwache_PERM_Info;
	permanent = 1;
	description = "Co� nowego?";
};


func int DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00");	//Co� nowego?
	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01");	//Nie. Wszystko po staremu.
};


const string GRD_215_CHECKPOINT = "OCR_MAINGATE_OUTSIDE";

instance DIA_Grd_215_Torwache_First(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 2;
	condition = DIA_Grd_215_Torwache_First_Condition;
	information = DIA_Grd_215_Torwache_First_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Grd_215_Torwache_First_Condition()
{
	if(((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)) || ((other.guild == GIL_STT) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) || ((other.guild == GIL_GRD) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))))
	{
		return TRUE;
	};
};

func void DIA_Grd_215_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00");	//A ty dok�d si� wybierasz?
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01");	//Do obozu.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02");	//Chyba nie przyszed�e� tu, �eby sprawia� k�opoty, co?
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Jasne, zamierzam przej�� kontrol� nad ca�ym obozem!",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Chcia�em si� tylko troch� rozejrze�.",DIA_Grd_215_Torwache_First_JustLooking);
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Diego powiedzia�, �e mam si� z nim spotka� w obozie.",DIA_Grd_215_Torwache_First_Diego);
	};
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Cronos_Messenger == LOG_RUNNING))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Jestem pos�a�cem Mag�w Wody.",dia_grd_215_torwache_first_bandit);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00");	//Jasne, zamierzam przej�� kontrol� nad ca�ym obozem!
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01");	//Hej, facet jest ca�kiem zabawny... Nie lubi� zabawnych facet�w.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00");	//Chcia�em si� tylko troch� rozejrze�.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01");	//To ci� b�dzie kosztowa� 10 bry�ek rudy.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Niewa�ne.",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"10 bry�ek...",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00");	//Diego powiedzia�, �e mam si� z nim spotka� w obozie.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01");	//W takim razie - w�a�.
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00");	//Niewa�ne.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01");	//W takim razie - spadaj.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_215_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00");	//Dobrze, masz tu swoje 10 bry�ek.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01");	//Dobra. Zapraszam do �rodka.
		B_GiveInvItems(other,self,ItMiNugget,10);
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//Nie mam tyle przy sobie.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01");	//C�. Tym razem zrobi� wyj�tek, bo jeste� tu nowy.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void dia_grd_215_torwache_first_bandit()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Bandit_15_00");	//Jestem pos�a�cem Mag�w Wody.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_01");	//No, skoro tak, to w�a�.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_02");	//Tylko zwa�aj na czyny.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_03");	//Nie pa�amy zbytnio sympati� do Szkodnik�w, kt�rzy nie potrafi� si� stosownie zachowa�.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_04");	//A teraz wynocha.
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};


instance INFO_GRD_215_LASTWARN(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = info_grd_215_lastwarn_condition;
	information = info_grd_215_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_215_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_215_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_grd_215_lastwarn_info()
{
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00");	//Og�uch�e�, czy co?!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_215_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_215_ATTACK(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = info_grd_215_attack_condition;
	information = info_grd_215_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_215_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_215_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_grd_215_attack_info()
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

