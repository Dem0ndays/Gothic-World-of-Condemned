
instance STT_335_Santino_Exit(C_Info)
{
	npc = STT_335_Santino;
	nr = 999;
	condition = STT_335_Santino_Exit_Condition;
	information = STT_335_Santino_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_335_Santino_Exit_Condition()
{
	return 1;
};

func void STT_335_Santino_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int santino_trade;

instance STT_335_Santino_BUY(C_Info)
{
	npc = STT_335_Santino;
	condition = STT_335_Santino_BUY_Condition;
	information = STT_335_Santino_BUY_Info;
	important = 0;
	permanent = 1;
	description = "Mog� co� od ciebie kupi�?";
	trade = 1;
};


func int STT_335_Santino_BUY_Condition()
{
	return 1;
};

func void STT_335_Santino_BUY_Info()
{
	AI_Output(other,self,"STT_335_Santino_BUY_Info_15_01");	//Mog� co� od ciebie kupi�?
	AI_Output(self,other,"STT_335_Santino_BUY_Info_07_02");	//Mam tu wszystko, czego m�g�by� zapragn��. To czego NIE MAM, i tak by ci si� nie przyda�o.
	if(santino_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Santino - Cie� w Starej Kopalni - handluje r�norakimi towarami. Kr�ci si� zawsze na najwy�szym poziomie.");
		santino_trade = TRUE;
	};
};

