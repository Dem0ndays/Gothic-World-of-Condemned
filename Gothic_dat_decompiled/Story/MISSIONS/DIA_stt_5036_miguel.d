
instance STT_5036_MIGUEL_EXIT(C_Info)
{
	npc = stt_5036_miguel;
	nr = 999;
	condition = stt_5036_miguel_exit_condition;
	information = stt_5036_miguel_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_5036_miguel_exit_condition()
{
	return 1;
};

func void stt_5036_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance stt_5036_miguel_hello(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_hello_condition;
	information = stt_5036_miguel_hello_info;
	important = 0;
	permanent = 0;
	description = "Kim jeste�?";
};


func int stt_5036_miguel_hello_condition()
{
	return 1;
};

func void stt_5036_miguel_hello_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Hello_Info_15_01");	//Kim jeste�?
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_02");	//Nazywam si� Miguel. Handluj� zio�ami i ro�linami, kt�re mo�na znale�� w tutejszych lasach i terenach.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_03");	//Je�li jakie� znajdziesz, ch�tnie je od ciebie odkupi�. Mog� si� te� wymieni� je�li chcesz, mam kilka ciekawych rzeczy.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_04");	//Mog� ci te� nieco opowiedzie� o ro�linach i zio�ach, kt�re rosn� w kolonii.
	Log_CreateTopic(GE_TraderOW,LOG_NOTE);
	B_LogEntry(GE_TraderOW,"Miguel, jeden z Cieni, zajmuje si� handlem zio�ami i ro�linami. Zwykle kr�ci si� gdzie� w obozie przed Star� Kopalni�.");
};


instance STT_5036_MIGUEL_TRADE(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_trade_condition;
	information = stt_5036_miguel_trade_info;
	important = 0;
	permanent = 1;
	description = "Dobijmy targu.";
	trade = 1;
};


func int stt_5036_miguel_trade_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_hello))
	{
		return 1;
	};
};

func void stt_5036_miguel_trade_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Trade_Info_15_01");	//Dobijmy targu.
	AI_Output(self,other,"STT_5036_Miguel_Trade_Info_07_02");	//Wi�c poka�, co tam masz.
};


instance stt_5036_miguel_erzaehl(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_erzaehl_condition;
	information = stt_5036_miguel_erzaehl_info;
	important = 0;
	permanent = 1;
	description = "Opowiedz mi co� o ro�linach.";
};


func int stt_5036_miguel_erzaehl_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_hello))
	{
		return 1;
	};
};

func void stt_5036_miguel_erzaehl_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Erzaehl_Info_15_01");	//Opowiedz mi co� o ro�linach.
	AI_Output(self,other,"STT_5036_Miguel_Erzaehl_Info_07_02");	//Co chcesz wiedzie�?
	Info_ClearChoices(stt_5036_miguel_erzaehl);
	Info_AddChoice(stt_5036_miguel_erzaehl,DIALOG_BACK,info_miguel_erzaehl_back);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Mo�e co� o ro�linach leczniczych?",info_miguel_erzaehl_heal);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Jak wygl�daj� ro�liny many?",info_miguel_erzaehl_mana);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Co warto wiedzie� o specjalnych ro�linach?",info_miguel_erzaehl_special);
};

func void info_miguel_erzaehl_back()
{
	Info_ClearChoices(stt_5036_miguel_erzaehl);
};

func void info_miguel_erzaehl_heal()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Heal_15_01");	//Co mo�esz mi powiedzie� o ro�linach leczniczych?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_02");	//Istniej� trzy r�ne odmiany tej�e ro�liny: s�aba, zwyk�a i mocna.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_03");	//Ro�lin� lecznicz� mo�esz albo samemu za�y�, albo przetworzy� j� nieco na stole alchemicznym.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_04");	//Po przerobieniu nada si� ona idealnie na mikstur� lecznicz�. Im silniejsze dzia�anie ma dana ro�lina, tym lepszy b�dzie eliksir, kt�ry uwarzysz.
};

func void info_miguel_erzaehl_mana()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Mana_15_01");	//Jak wygl�daj� ro�liny many?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_02");	//Istniej� trzy r�ne odmiany tej�e ro�liny: s�aba, zwyk�a i mocna.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_03");	//Tak� ro�lin� mo�esz albo samemu za�y�, albo przetworzy� j� nieco na stole alchemicznym.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_04");	//Po przerobieniu nada si� ona idealnie na mikstur� many. Im silniejsze dzia�anie ma dana ro�lina, tym lepszy b�dzie eliksir, kt�ry uwarzysz.
};

func void info_miguel_erzaehl_special()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Special_15_01");	//Co warto wiedzie� o specjalnych ro�linach?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_02");	//S� to ro�liny, kt�re zdecydowanie trudniej jest znale��. Ale maj� one za to niezwyk�e w�a�ciwo�ci.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_03");	//Do takich rzadszych ro�lin mo�na zaliczy� te� jagody, nasiona czy mech.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_04");	//Istniej� mikstury, kt�re mo�na uwarzy� tylko z takich w�a�nie sk�adnik�w. Oczywi�cie cena ro�nie w zale�no�ci od tego, jak cenna jest dana ro�lina dla kupca.
};


instance stt_5036_miguel_garaz(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_garaz_condition;
	information = stt_5036_miguel_garaz_info;
	important = 0;
	permanent = 0;
	description = "M�g�by� mi co nieco opowiedzie� o Garazie?";
};


func int stt_5036_miguel_garaz_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_tax) && (erz_schulden == LOG_RUNNING))
	{
		return 1;
	};
};

func void stt_5036_miguel_garaz_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_15_01");	//M�g�by� mi co nieco opowiedzie� o Garazie?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_02");	//A co konkretnie chcesz wiedzie�?
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_03");	//Naprawd� pilnie potrzebuj� klucza do jego skrzyni, tyle �e niestety ca�y czas trzyma go przy sobie.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_04");	//Ach, o to chodzi, he he.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_05");	//Dobra, skoro tak ci zale�y na tym kluczu, to istniej� dwa warianty jego zdobycia.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_06");	//Mo�esz mu go po prostu zwin�� z kieszeni...
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_07");	//...albo wykorzystasz jedn� z jego s�abo�ci.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_08");	//A c� to za s�abo��?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_09");	//Pocz�stuj go butelk� wina. Dzi�ki temu do�� szybko si� zaleje i nie powinno by� ju� problemu z uzyskaniem od niego klucza.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_10");	//Dzi�ki za rad�, trzymaj si�!
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_11");	//Ach, nie ma sprawy. To b�dzie dla niego nauczka za to ci�g�e deptanie mojej - jak on to nazywa - zieleniny.
	B_LogEntry(CH1_SCHULDEN,"Miguel twierdzi, �e powinienem pocz�stowa� Garaza butelk� wina. Dzi�ki temu nie b�dzie ju� z kluczem �adnego problemu.");
};

