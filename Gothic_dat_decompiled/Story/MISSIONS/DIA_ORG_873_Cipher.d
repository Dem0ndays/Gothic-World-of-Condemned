
instance Org_873_Cipher_Exit(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 999;
	condition = Org_873_Cipher_Exit_Condition;
	information = Org_873_Cipher_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

func void Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_873_Cipher_Hello(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Hello_Condition;
	information = Org_873_Cipher_Hello_Info;
	permanent = 0;
	description = "Co s³ychaæ?";
};


func int Org_873_Cipher_Hello_Condition()
{
	return 1;
};

func void Org_873_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//Nasypaliœmy trochê piasku w machinê Gomeza.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//Trzech zabitych stra¿ników i mnóstwo towaru na sprzeda¿. Trzeba to opiæ!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//Jesteœ jednym z ludzi, którzy bez przerwy napadaj¹ Stary Obóz?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//Nie. Napadamy go tylko wtedy, kiedy siê to op³aca.
};


instance Org_873_Cipher_Fisk(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Fisk_Condition;
	information = Org_873_Cipher_Fisk_Info;
	permanent = 1;
	description = "Fisk ze Starego Obozu szuka nowego partnera do interesów.";
};


func int Org_873_Cipher_Fisk_Condition()
{
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_873_Cipher_Fisk_Info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//Fisk ze Starego Obozu szuka nowego partnera do interesów.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//Nie jestem zainteresowany.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//Ale powinieneœ porozmawiaæ z Sharkym. Mo¿e on na to pójdzie.
};


var int Cipher_Trade;

instance Org_873_Cipher_FromBalor(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_FromBalor_Condition;
	information = Org_873_Cipher_FromBalor_Info;
	permanent = 1;
	description = "Co masz do zaoferowania?";
};


func int Org_873_Cipher_FromBalor_Condition()
{
	if(Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

func void Org_873_Cipher_FromBalor_Info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//Co masz do zaoferowania?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//Nie, nie! Pytanie brzmi: co TY masz do zaoferowania! Interesuj¹ mnie wy³¹cznie powa¿ne dostawy.
	if(Balor_TellsNCDealer == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//Balor powiedzia³ mi, ¿e interesuje ciê bagienne ziele.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//Mhm. Masz coœ na sprzeda¿?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//Niestety nie.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//Wiêc wróæ do mnie, jak bêdziesz mia³ coœ co mnie zainteresuje.
	};
};


instance Org_873_Cipher_TRADE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_TRADE_Condition;
	information = Org_873_Cipher_TRADE_Info;
	permanent = 1;
	description = "Dobijmy targu.";
	trade = 1;
};


func int Org_873_Cipher_TRADE_Condition()
{
	if(Cipher_Trade == TRUE)
	{
		return 1;
	};
};

func void Org_873_Cipher_TRADE_Info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Dobijmy targu.
	AI_Output(self,other,"DIA_Cipher_TRADE_12_01");	//Czego chcesz?
};


instance ORG_873_CIPHER_BOTE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = org_873_cipher_bote_condition;
	information = org_873_cipher_bote_info;
	permanent = 0;
	important = 1;
};


func int org_873_cipher_bote_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return 1;
	};
};

func void org_873_cipher_bote_info()
{
	AI_Output(self,other,"DIA_Cipher_BOTE_15_00");	//Hej, ty! Jesteœ z obozu sekty, prawda? Mia³bym robótkê dla kogoœ takiego jak ty.
	AI_Output(other,self,"DIA_Cipher_BOTE_12_01");	//O co chodzi?
	AI_Output(self,other,"DIA_Cipher_BOTE_15_01");	//Balor, jeden z waszych, nie tak dawno przys³a³ mi swoj¹ dostawê. Skoro i tak w³óczysz siê po obozie sekty, to mo¿esz mu przekazaæ przy okazji zap³atê.
	AI_Output(self,other,"DIA_Cipher_BOTE_15_02");	//Masz tu 50 bry³ek.
	AI_Output(self,other,"DIA_Cipher_BOTE_15_03");	//Powiedz mu po prostu, ¿e ciê przysy³am. Bêdzie wiedzia³ o co chodzi.
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	cipher_payment = LOG_RUNNING;
	Log_CreateTopic(CH1_CIPHERDELIEVERED,LOG_MISSION);
	Log_SetTopicStatus(CH1_CIPHERDELIEVERED,LOG_RUNNING);
	B_LogEntry(CH1_CIPHERDELIEVERED,"Cipher, jeden z paserów z Nowego Obozu, wetkn¹³ mi zadanie jako pos³aniec. Mam przekazaæ zap³atê Balorowi, jednemu z Nowicjuszy z obozu na bagnie, za dostawê, któr¹ Cipher otrzyma³. Rozchodzi siê o 50 bry³ek.");
};

