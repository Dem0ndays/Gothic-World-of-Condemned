
instance DIA_BAALLUKOR_EXIT(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 999;
	condition = dia_baallukor_exit_condition;
	information = dia_baallukor_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baallukor_exit_condition()
{
	return 1;
};

func void dia_baallukor_exit_info()
{
	AI_StopProcessInfos(self);
};


var int baallukor_sakrileg;

instance dia_baallukor_notalk(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 1;
	condition = dia_baallukor_notalk_condition;
	information = dia_baallukor_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baallukor_notalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (baallukor_ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baallukor_notalk_info()
{
	Info_ClearChoices(dia_baallukor_notalk);
	Info_AddChoice(dia_baallukor_notalk,DIALOG_ENDE,dia_baallukor_notalk_ende);
	Info_AddChoice(dia_baallukor_notalk,"Wszystko w porz�dku, kolego?",dia_baallukor_notalk_imp);
	Info_AddChoice(dia_baallukor_notalk,"Niech �ni�cy b�dzie z tob�!",dia_baallukor_notalk_sleeper);
	Info_AddChoice(dia_baallukor_notalk,"Cze��! Jestem tu nowy!",dia_baallukor_notalk_hi);
};

func void dia_baallukor_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Cze��! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	baallukor_sakrileg = TRUE;
};

func void dia_baallukor_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Niech �ni�cy b�dzie z tob�!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	baallukor_sakrileg = TRUE;
};

func void dia_baallukor_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Wszystko w porz�dku, kolego?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	baallukor_sakrileg = TRUE;
};

func void dia_baallukor_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance dia_baallukor_hypnoticteacher(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 1;
	condition = dia_baallukor_hypnoticteacher_condition;
	information = dia_baallukor_hypnoticteacher_info;
	permanent = 0;
	important = 1;
};


func int dia_baallukor_hypnoticteacher_condition()
{
	if(baallukor_ansprechbar == TRUE)
	{
		return 1;
	};
};

func void dia_baallukor_hypnoticteacher_info()
{
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_01");	//Powiniene� wybra� drog� z rozwag� i po dok�adnym rozwa�eniu.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_02");	//Zastan�w si� dobrze nad t� decyzj�. Mo�e i w innych obozach dostaniesz ochron� i po�ywienie, ale czy to jest w�a�nie to, czego pragniesz?
	AI_Output(other,self,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_15_03");	//A czego mog� si� spodziewa�, je�li okaza�bym si� godzien do was do��czy�?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_04");	//Ju� teraz mog� ci powiedzie�, �e Stra�nicy �wi�tynni maj� nieodpart� wol�, �e magiczna si�a Guru znacznie przerasta imaginacj� nawet Mag�w Ognia i Wody.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_05");	//�e nasza �ywno�� r�wnie� jest syc�ca. Ale to jeszcze nic w por�wnaniu z tym, co ta spo�eczno�� oferuje.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_06");	//To, co ci� tu czeka, to istny dar. Wst�pisz na drog�, kt�ra jest niezwykle wymagaj�ca.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_07");	//Ale dzi�ki temu po�wi�ceniu staniesz si� wielki. Dost�pisz mocy, kt�ra ci� o�wieci. Mocy, kt�ra poprowadzi ci� do wolno�ci.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_08");	//Czy� nie jest to co�, czego pragniesz?... Wolno��?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_09");	//Dlatego nie powiniene� zadawa� pytania, dlaczego mia�by� do nas do��czy�, ale pyta� raczej, dlaczego by do nas nie do��czy�?
	Info_ClearChoices(dia_baallukor_hypnoticteacher);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Nic nie m�w",dia_baallukor_hypnoticteacher_muteende);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Chc� pod��a� drog� �ni�cego!",dia_baallukor_hypnoticteacher_where);
};

func void dia_baallukor_hypnoticteacher_where()
{
	AI_Output(other,self,"DIA_BaalLukor_HypnoticTeacher_Where_15_00");	//Chc� pod��a� drog� �ni�cego!
	AI_Output(self,other,"DIA_BaalLukor_HypnoticTeacher_Where_12_01");	//Zatem udaj si� do Cor Kaloma. On uczyni z ciebie prawdziwego s�ug� �ni�cego.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Lukor chce, by zrobiono ze mnie prawdziwego s�ug� �ni�cego.");
	B_GiveXP(XP_ImpressBaalCadar);
};

func void dia_baallukor_hypnoticteacher_muteende()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

