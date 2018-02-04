
const string Grd_213_CHECKPOINT = "OCC_GATE_INSIDE";

instance Info_Grd_213_FirstWarn(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_FirstWarn_Condition;
	information = Info_Grd_213_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_213_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Grd_213_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_01");	//ST�J!
	AI_Output(hero,self,"Info_Grd_213_FirstWarn_Info_15_02");	//Co si� dzieje?
	AI_Output(self,hero,"Info_Grd_213_FirstWarn_Info_07_03");	//Nie wolno ci wej�� do zamku. Spadaj!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_LastWarn(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_LastWarn_Condition;
	information = Info_Grd_213_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_213_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Grd_213_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Grd_213_LastWarn_07_01");	//Og�uch�e�? Jeszcze jeden krok a nakarmi� tob� robaki!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Grd_213_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_Attack(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Attack_Condition;
	information = Info_Grd_213_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Grd_213_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Grd_213_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_Grd_213_Attack_Info()
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


instance Grd_213_Torwache_WELCOME(C_Info)
{
	npc = Grd_213_Torwache;
	condition = Grd_213_Torwache_WELCOME_Condition;
	information = Grd_213_Torwache_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int Grd_213_Torwache_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void Grd_213_Torwache_WELCOME_Info()
{
	AI_Output(self,other,"Grd_213_Torwache_WELCOME_Info_07_01");	//Podobno jeste� teraz jednym z nas? Nie�le jak na kogo�, kto jest tu od niedawna.
};


instance Info_Grd_213_EXIT(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 999;
	condition = Info_Grd_213_EXIT_Condition;
	information = Info_Grd_213_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Grd_213_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_213_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_Abblitzen(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Abblitzen_Condition;
	information = Info_Grd_213_Abblitzen_Info;
	permanent = 1;
	description = "M�g�by� od czasu do czasu zrobi� co� bardziej ekscytuj�cego.";
};


func int Info_Grd_213_Abblitzen_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void Info_Grd_213_Abblitzen_Info()
{
	AI_Output(other,self,"Info_Grd_213_Abblitzen_15_00");	//M�g�by� od czasu do czasu zrobi� co� bardziej ekscytuj�cego. Na przyk�ad wpu�ci� kogo� potajemnie do zamku.
	AI_Output(self,other,"Info_Grd_213_Abblitzen_07_01");	//Bardziej ekscytuj�cego, powiadasz? To ca�kiem dobry pomys� - ju� od dawna nie obi�em nikomu twarzy.
	AI_StopProcessInfos(self);
};


instance Info_Grd_213_Passgate(C_Info)
{
	npc = Grd_213_Torwache;
	nr = 1;
	condition = Info_Grd_213_Passgate_Condition;
	information = Info_Grd_213_Passgate_Info;
	permanent = 1;
	description = "Hej, wszystko w porz�dku?";
};


func int Info_Grd_213_Passgate_Condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void Info_Grd_213_Passgate_Info()
{
	AI_Output(other,self,"Info_Grd_213_Passgate_15_00");	//Hej, wszystko w porz�dku?
	AI_Output(self,other,"Info_Grd_213_Passgate_07_01");	//Przesta� si� tu kr�ci�. W�a� do �rodka.
	AI_StopProcessInfos(self);
};

