
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
	Info_AddChoice(dia_baallukor_notalk,"Wszystko w porz¹dku, kolego?",dia_baallukor_notalk_imp);
	Info_AddChoice(dia_baallukor_notalk,"Niech Œni¹cy bêdzie z tob¹!",dia_baallukor_notalk_sleeper);
	Info_AddChoice(dia_baallukor_notalk,"Czeœæ! Jestem tu nowy!",dia_baallukor_notalk_hi);
};

func void dia_baallukor_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Czeœæ! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	baallukor_sakrileg = TRUE;
};

func void dia_baallukor_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Niech Œni¹cy bêdzie z tob¹!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	baallukor_sakrileg = TRUE;
};

func void dia_baallukor_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Wszystko w porz¹dku, kolego?
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
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_01");	//Powinieneœ wybraæ drogê z rozwag¹ i po dok³adnym rozwa¿eniu.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_02");	//Zastanów siê dobrze nad t¹ decyzj¹. Mo¿e i w innych obozach dostaniesz ochronê i po¿ywienie, ale czy to jest w³aœnie to, czego pragniesz?
	AI_Output(other,self,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_15_03");	//A czego mogê siê spodziewaæ, jeœli okaza³bym siê godzien do was do³¹czyæ?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_04");	//Ju¿ teraz mogê ci powiedzieæ, ¿e Stra¿nicy Œwi¹tynni maj¹ nieodpart¹ wolê, ¿e magiczna si³a Guru znacznie przerasta imaginacjê nawet Magów Ognia i Wody.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_05");	//¯e nasza ¿ywnoœæ równie¿ jest syc¹ca. Ale to jeszcze nic w porównaniu z tym, co ta spo³ecznoœæ oferuje.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_06");	//To, co ciê tu czeka, to istny dar. Wst¹pisz na drogê, która jest niezwykle wymagaj¹ca.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_07");	//Ale dziêki temu poœwiêceniu staniesz siê wielki. Dost¹pisz mocy, która ciê oœwieci. Mocy, która poprowadzi ciê do wolnoœci.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_08");	//Czy¿ nie jest to coœ, czego pragniesz?... Wolnoœæ?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_09");	//Dlatego nie powinieneœ zadawaæ pytania, dlaczego mia³byœ do nas do³¹czyæ, ale pytaæ raczej, dlaczego by do nas nie do³¹czyæ?
	Info_ClearChoices(dia_baallukor_hypnoticteacher);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Nic nie mów",dia_baallukor_hypnoticteacher_muteende);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Chcê pod¹¿aæ drog¹ Œni¹cego!",dia_baallukor_hypnoticteacher_where);
};

func void dia_baallukor_hypnoticteacher_where()
{
	AI_Output(other,self,"DIA_BaalLukor_HypnoticTeacher_Where_15_00");	//Chcê pod¹¿aæ drog¹ Œni¹cego!
	AI_Output(self,other,"DIA_BaalLukor_HypnoticTeacher_Where_12_01");	//Zatem udaj siê do Cor Kaloma. On uczyni z ciebie prawdziwego s³ugê Œni¹cego.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Lukor chce, by zrobiono ze mnie prawdziwego s³ugê Œni¹cego.");
	B_GiveXP(XP_ImpressBaalCadar);
};

func void dia_baallukor_hypnoticteacher_muteende()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

