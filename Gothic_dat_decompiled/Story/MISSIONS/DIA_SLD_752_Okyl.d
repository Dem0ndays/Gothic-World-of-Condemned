
instance dia_sld_752_okyl_intro(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_intro_condition;
	information = dia_sld_752_okyl_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_752_okyl_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 250)
	{
		return 1;
	};
};

func void dia_sld_752_okyl_intro_info()
{
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01");	//Hej, ty! Nie jeste� jednym z moich ludzi! Czego tu szukasz?!
};


instance DIA_SLD_752_OKYL_EXIT(C_Info)
{
	nr = 999;
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_exit_condition;
	information = dia_sld_752_okyl_exit_info;
	important = 0;
	permanent = 1;
	description = "Musz� ju� i��.";
};


func int dia_sld_752_okyl_exit_condition()
{
	return 1;
};

func void dia_sld_752_okyl_exit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");	//To nie zawracaj mi g�owy!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_UMSEHEN(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_umsehen_condition;
	information = dia_sld_752_okyl_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Tylko si� tu troch� rozejrz�.";
};


func int dia_sld_752_okyl_umsehen_condition()
{
	return 1;
};

func void dia_sld_752_okyl_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");	//Tylko si� tu troch� rozejrz�.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");	//Tylko nie pr�buj rozrabia� w Kotle, bo trafisz do piachu szybciej ni� my�lisz.
};


instance dia_sld_752_okyl_werbistdu(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_werbistdu_condition;
	information = dia_sld_752_okyl_werbistdu_info;
	important = 0;
	permanent = 0;
	description = "Kim jeste�?";
};


func int dia_sld_752_okyl_werbistdu_condition()
{
	return 1;
};

func void dia_sld_752_okyl_werbistdu_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");	//Kim jeste�?
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");	//Jestem Okyl. To ja rozkazuj� w Kotle.
};


instance dia_sld_752_okyl_inmine(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_inmine_condition;
	information = dia_sld_752_okyl_inmine_info;
	important = 0;
	permanent = 0;
	description = "Chcia�em rzuci� okiem na kopalni�.";
};


func int dia_sld_752_okyl_inmine_condition()
{
	return 1;
};

func void dia_sld_752_okyl_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01");	//Chcia�em rzuci� okiem na kopalni�.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");	//Och, chcia�e� sobie zrobi� ma�y spacer po kopalni, co?
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");	//Widz�, �e nie masz poj�cia co si� tutaj dzieje. Nikt nie mo�e wej�� do kopalni bez mojego pozwolenia.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");	//I zapami�taj sobie: ktokolwiek wejdzie do str��wki bez mojej zgody, b�dzie martwym cz�owiekiem.
};


instance DIA_SLD_752_OKYL_PERMIT(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_permit_condition;
	information = dia_sld_752_okyl_permit_info;
	important = 0;
	permanent = 0;
	description = "Udzielisz mi pozwolenia?";
};


func int dia_sld_752_okyl_permit_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_inmine))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_permit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");	//Udzielisz mi pozwolenia?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");	//Nawet ci� nie znam. Dlaczego mia�bym ci� wpu�ci� do kopalni?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");	//A teraz spadaj st�d, mam du�o roboty.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_QUEST(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_quest_condition;
	information = dia_sld_752_okyl_quest_info;
	important = 0;
	permanent = 0;
	description = "Mog� si� tu na co� przyda�?";
};


func int dia_sld_752_okyl_quest_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_intro))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_quest_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_QUEST_INFO_15_01");	//Mog� si� tu na co� przyda�?
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_02");	//Raczej nie ma tu roboty dla kogo� takiego jak ty.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_03");	//Chocia�... m�g�by� co� zrobi�.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_04");	//Nasz poprzedni kowal da� si� po�re� pe�zaczom w kopalni i teraz ju� od jakiego� czasu ku�nia stoi pusta.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_05");	//Z tego co si� orientuj�, mieli�my kiedy� jakiego� kowala w Nowym Obozie, ale ju� nawet nie pami�tam jego imienia.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_06");	//Mo�e ju� nawet dokona� �ywota, kij go tam wie.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_07");	//Rozejrzyj si� po prostu. Jak kogo� znajdziesz, po�lij go tu do nas do Kot�a.
	fmc_smith = LOG_RUNNING;
	Log_CreateTopic(CH1_FMCSMITH,LOG_MISSION);
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_RUNNING);
	B_LogEntry(CH1_FMCSMITH,"Okyl, szef Wolnej Kopalni, powiedzia� mi, �e ku�nia w Kotle ju� od jakiego� czasu stoi pusta. Mam teraz za zadanie znale�� im nowego kowala. W Nowym Obozie powinien znale�� si� jaki� fachowiec.");
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_FOUND(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_found_condition;
	information = dia_sld_752_okyl_found_info;
	important = 0;
	permanent = 0;
	description = "Znalaz�em wam cz�owieka do ku�ni.";
};


func int dia_sld_752_okyl_found_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_smith))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_found_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_Found_INFO_15_01");	//Znalaz�em wam cz�owieka do ku�ni.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_02");	//Tak, zd��y�em ju� zauwa�y�. Kosa jest porz�dnym cz�owiekiem.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_03");	//Zacz�� ju� w�a�nie swoj� prac� przy ku�ni.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_04");	//Prosz�, we� to za swoje starania.
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	AI_Teleport(SLD_704_Blade,"FMC_HUT08_IN");
	Npc_ExchangeRoutine(SLD_704_Blade,"SMITH");
	AI_ContinueRoutine(SLD_704_Blade);
	fmc_smith = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_SUCCESS);
	B_LogEntry(CH1_FMCSMITH,"Uda�o mi si� przekona� Kos�, aby pracowa� w Wolnej Kopalni jako kowal. Okyl nie kry� zadowolenia i da� mi w nagrod� kilka bry�ek rudy.");
	B_GiveXP(XP_SMITH);
	AI_StopProcessInfos(self);
};

