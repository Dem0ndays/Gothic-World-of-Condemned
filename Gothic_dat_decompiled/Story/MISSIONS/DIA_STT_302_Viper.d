
instance Stt_302_Viper_Exit(C_Info)
{
	npc = STT_302_Viper;
	nr = 999;
	condition = Stt_302_Viper_Exit_Condition;
	information = Stt_302_Viper_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_302_Viper_Exit_Condition()
{
	return 1;
};

func void Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_302_Viper_GREET(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_GREET_Condition;
	information = Stt_302_Viper_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Podobno jeste� hutnikiem.";
};


func int Stt_302_Viper_GREET_Condition()
{
	return 1;
};

func void Stt_302_Viper_GREET_Info()
{
	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01");	//Podobno jeste� hutnikiem.
	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02");	//Widz�, �e bystry z ciebie ch�opak.
};


instance Stt_302_Viper_MELT(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_MELT_Condition;
	information = Stt_302_Viper_MELT_Info;
	important = 0;
	permanent = 0;
	description = "Podobno przetapiasz tutaj cz�� wydobytej rudy.";
};


func int Stt_302_Viper_MELT_Condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_GREET) && Npc_KnowsInfo(hero,Grd_260_Drake_Mine_Mehr))
	{
		return 1;
	};
};

func void Stt_302_Viper_MELT_Info()
{
	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01");	//Podobno przetapiasz tutaj cz�� wydobytej rudy.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02");	//Kiedy� przetapiali�my tutaj ca�y urobek. Ale Gomezowi i Magom nie bardzo si� to podoba�o.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03");	//Siedzieli tu tygodniami, badaj�c rud� i wszystko dooko�a.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04");	//W�szyli wsz�dzie i wtykali swoje szlachetne nochale w rzeczy, o kt�rych nie mieli poj�cia.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05");	//W ko�cu poprzestali�my na przetapianiu cz�ci urobku. Magowie wi�cej si� tu nie pojawili.
};


var int viper_trade;

instance Stt_302_Viper_BUY(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_BUY_Condition;
	information = Stt_302_Viper_BUY_Info;
	important = 0;
	permanent = 1;
	description = "Mo�esz mi da� troch� rudy?";
	trade = 1;
};


func int Stt_302_Viper_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_GREET))
	{
		return 1;
	};
};

func void Stt_302_Viper_BUY_Info()
{
	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01");	//Mo�esz mi da� troch� rudy?
	AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02");	//Je�li dasz mi co� w zamian.
	if(viper_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"W�� - hutnik ze Starej Kopalni - mo�e wymieni� si� ze mn� rud� w zamian za rozmaite towary.");
		viper_trade = TRUE;
	};
};

