
instance Info_Pacho_EXIT(C_Info)
{
	npc = GRD_224_Pacho;
	nr = 999;
	condition = Info_Pacho_EXIT_Condition;
	information = Info_Pacho_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func void Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Pacho_STOP(C_Info)
{
	npc = GRD_224_Pacho;
	condition = Info_Pacho_STOP_Condition;
	information = Info_Pacho_STOP_Info;
	important = 1;
	permanent = 0;
};


func int Info_Pacho_STOP_Condition()
{
	return TRUE;
};

func void Info_Pacho_STOP_Info()
{
	AI_Output(self,hero,"Info_Pacho_STOP_13_01");	//Hej, ty!
	AI_Output(hero,self,"Info_Pacho_STOP_15_02");	//Kto? Ja?
	AI_Output(self,hero,"Info_Pacho_STOP_13_03");	//Nie, twoja babcia... Jasne, ¿e ty!!!
	AI_Output(self,hero,"Info_Pacho_STOP_13_04");	//Na twoim miejscu nie szed³bym dalej!
	AI_Output(hero,self,"Info_Pacho_STOP_15_05");	//Dlaczego?
	AI_Output(self,hero,"Info_Pacho_STOP_13_06");	//Widzê, ¿e jesteœ tu nowy, co?
	AI_Output(self,hero,"Info_Pacho_STOP_13_07");	//Stary, ta droga prowadzi na ziemie Orków...
	AI_Output(self,hero,"Info_Pacho_STOP_13_08");	//Zrobi¹ z ciebie kotlety!
	AI_Output(hero,self,"Info_Pacho_STOP_15_09");	//Och!
	AI_Output(self,hero,"Info_Pacho_STOP_13_10");	//Nie ma za co!
	AI_StopProcessInfos(self);
};


instance INFO_PACHO_MESSAGE(C_Info)
{
	npc = GRD_224_Pacho;
	condition = info_pacho_message_condition;
	information = info_pacho_message_info;
	important = 0;
	permanent = 0;
	description = "Mam dla ciebie wiadomoœæ.";
};


func int info_pacho_message_condition()
{
	return TRUE;
};

func void info_pacho_message_info()
{
	AI_Output(hero,self,"Info_Pacho_Message_15_02");	//Mam dla ciebie wiadomoœæ.
	AI_Output(self,hero,"Info_Pacho_Message_13_01");	//Ach tak?
	AI_Output(hero,self,"Info_Pacho_Message_15_03");	//Twój kumpel Orry kaza³ przekazaæ, ¿e jest nastêpny w kolejce.
	AI_Output(self,hero,"Info_Pacho_Message_15_04");	//O, dobra. Czajê. Hehe.
	orry_message = LOG_SUCCESS;
	B_LogEntry(CH1_MESSAGEPACHO,"Przekaza³em Pacho wiadomoœæ. Nie dosta³em jednak od niego ¿adnej informacji, co w ogóle mieli na myœli. No ale có¿, przynajmniej Pacho by³ mi wdziêczny.");
	Log_SetTopicStatus(CH1_MESSAGEPACHO,LOG_SUCCESS);
	B_GiveXP(XP_PACHOMESSAGE);
	AI_StopProcessInfos(self);
};

