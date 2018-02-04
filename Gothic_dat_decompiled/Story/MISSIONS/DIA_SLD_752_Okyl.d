
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
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01");	//Hej, ty! Nie jesteœ jednym z moich ludzi! Czego tu szukasz?!
};


instance DIA_SLD_752_OKYL_EXIT(C_Info)
{
	nr = 999;
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_exit_condition;
	information = dia_sld_752_okyl_exit_info;
	important = 0;
	permanent = 1;
	description = "Muszê ju¿ iœæ.";
};


func int dia_sld_752_okyl_exit_condition()
{
	return 1;
};

func void dia_sld_752_okyl_exit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01");	//Muszê ju¿ iœæ.
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");	//To nie zawracaj mi g³owy!
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_UMSEHEN(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_umsehen_condition;
	information = dia_sld_752_okyl_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Tylko siê tu trochê rozejrzê.";
};


func int dia_sld_752_okyl_umsehen_condition()
{
	return 1;
};

func void dia_sld_752_okyl_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");	//Tylko siê tu trochê rozejrzê.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");	//Tylko nie próbuj rozrabiaæ w Kotle, bo trafisz do piachu szybciej ni¿ myœlisz.
};


instance dia_sld_752_okyl_werbistdu(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_werbistdu_condition;
	information = dia_sld_752_okyl_werbistdu_info;
	important = 0;
	permanent = 0;
	description = "Kim jesteœ?";
};


func int dia_sld_752_okyl_werbistdu_condition()
{
	return 1;
};

func void dia_sld_752_okyl_werbistdu_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");	//Kim jesteœ?
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");	//Jestem Okyl. To ja rozkazujê w Kotle.
};


instance dia_sld_752_okyl_inmine(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_inmine_condition;
	information = dia_sld_752_okyl_inmine_info;
	important = 0;
	permanent = 0;
	description = "Chcia³em rzuciæ okiem na kopalniê.";
};


func int dia_sld_752_okyl_inmine_condition()
{
	return 1;
};

func void dia_sld_752_okyl_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01");	//Chcia³em rzuciæ okiem na kopalniê.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");	//Och, chcia³eœ sobie zrobiæ ma³y spacer po kopalni, co?
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");	//Widzê, ¿e nie masz pojêcia co siê tutaj dzieje. Nikt nie mo¿e wejœæ do kopalni bez mojego pozwolenia.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");	//I zapamiêtaj sobie: ktokolwiek wejdzie do stró¿ówki bez mojej zgody, bêdzie martwym cz³owiekiem.
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
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");	//Nawet ciê nie znam. Dlaczego mia³bym ciê wpuœciæ do kopalni?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");	//A teraz spadaj st¹d, mam du¿o roboty.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_QUEST(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_quest_condition;
	information = dia_sld_752_okyl_quest_info;
	important = 0;
	permanent = 0;
	description = "Mogê siê tu na coœ przydaæ?";
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
	AI_Output(other,self,"DIA_SLD_752_OKYL_QUEST_INFO_15_01");	//Mogê siê tu na coœ przydaæ?
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_02");	//Raczej nie ma tu roboty dla kogoœ takiego jak ty.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_03");	//Chocia¿... móg³byœ coœ zrobiæ.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_04");	//Nasz poprzedni kowal da³ siê po¿reæ pe³zaczom w kopalni i teraz ju¿ od jakiegoœ czasu kuŸnia stoi pusta.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_05");	//Z tego co siê orientujê, mieliœmy kiedyœ jakiegoœ kowala w Nowym Obozie, ale ju¿ nawet nie pamiêtam jego imienia.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_06");	//Mo¿e ju¿ nawet dokona³ ¿ywota, kij go tam wie.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_07");	//Rozejrzyj siê po prostu. Jak kogoœ znajdziesz, poœlij go tu do nas do Kot³a.
	fmc_smith = LOG_RUNNING;
	Log_CreateTopic(CH1_FMCSMITH,LOG_MISSION);
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_RUNNING);
	B_LogEntry(CH1_FMCSMITH,"Okyl, szef Wolnej Kopalni, powiedzia³ mi, ¿e kuŸnia w Kotle ju¿ od jakiegoœ czasu stoi pusta. Mam teraz za zadanie znaleŸæ im nowego kowala. W Nowym Obozie powinien znaleŸæ siê jakiœ fachowiec.");
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_FOUND(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_found_condition;
	information = dia_sld_752_okyl_found_info;
	important = 0;
	permanent = 0;
	description = "Znalaz³em wam cz³owieka do kuŸni.";
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
	AI_Output(other,self,"DIA_SLD_752_OKYL_Found_INFO_15_01");	//Znalaz³em wam cz³owieka do kuŸni.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_02");	//Tak, zd¹¿y³em ju¿ zauwa¿yæ. Kosa jest porz¹dnym cz³owiekiem.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_03");	//Zacz¹³ ju¿ w³aœnie swoj¹ pracê przy kuŸni.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_04");	//Proszê, weŸ to za swoje starania.
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	AI_Teleport(SLD_704_Blade,"FMC_HUT08_IN");
	Npc_ExchangeRoutine(SLD_704_Blade,"SMITH");
	AI_ContinueRoutine(SLD_704_Blade);
	fmc_smith = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_SUCCESS);
	B_LogEntry(CH1_FMCSMITH,"Uda³o mi siê przekonaæ Kosê, aby pracowa³ w Wolnej Kopalni jako kowal. Okyl nie kry³ zadowolenia i da³ mi w nagrodê kilka bry³ek rudy.");
	B_GiveXP(XP_SMITH);
	AI_StopProcessInfos(self);
};

