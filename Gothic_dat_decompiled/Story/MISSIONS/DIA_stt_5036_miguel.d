
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
	description = "Kim jesteœ?";
};


func int stt_5036_miguel_hello_condition()
{
	return 1;
};

func void stt_5036_miguel_hello_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Hello_Info_15_01");	//Kim jesteœ?
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_02");	//Nazywam siê Miguel. Handlujê zio³ami i roœlinami, które mo¿na znaleŸæ w tutejszych lasach i terenach.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_03");	//Jeœli jakieœ znajdziesz, chêtnie je od ciebie odkupiê. Mogê siê te¿ wymieniæ jeœli chcesz, mam kilka ciekawych rzeczy.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_04");	//Mogê ci te¿ nieco opowiedzieæ o roœlinach i zio³ach, które rosn¹ w kolonii.
	Log_CreateTopic(GE_TraderOW,LOG_NOTE);
	B_LogEntry(GE_TraderOW,"Miguel, jeden z Cieni, zajmuje siê handlem zio³ami i roœlinami. Zwykle krêci siê gdzieœ w obozie przed Star¹ Kopalni¹.");
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
	AI_Output(self,other,"STT_5036_Miguel_Trade_Info_07_02");	//Wiêc poka¿, co tam masz.
};


instance stt_5036_miguel_erzaehl(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_erzaehl_condition;
	information = stt_5036_miguel_erzaehl_info;
	important = 0;
	permanent = 1;
	description = "Opowiedz mi coœ o roœlinach.";
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
	AI_Output(other,self,"STT_5036_Miguel_Erzaehl_Info_15_01");	//Opowiedz mi coœ o roœlinach.
	AI_Output(self,other,"STT_5036_Miguel_Erzaehl_Info_07_02");	//Co chcesz wiedzieæ?
	Info_ClearChoices(stt_5036_miguel_erzaehl);
	Info_AddChoice(stt_5036_miguel_erzaehl,DIALOG_BACK,info_miguel_erzaehl_back);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Mo¿e coœ o roœlinach leczniczych?",info_miguel_erzaehl_heal);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Jak wygl¹daj¹ roœliny many?",info_miguel_erzaehl_mana);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Co warto wiedzieæ o specjalnych roœlinach?",info_miguel_erzaehl_special);
};

func void info_miguel_erzaehl_back()
{
	Info_ClearChoices(stt_5036_miguel_erzaehl);
};

func void info_miguel_erzaehl_heal()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Heal_15_01");	//Co mo¿esz mi powiedzieæ o roœlinach leczniczych?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_02");	//Istniej¹ trzy ró¿ne odmiany tej¿e roœliny: s³aba, zwyk³a i mocna.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_03");	//Roœlinê lecznicz¹ mo¿esz albo samemu za¿yæ, albo przetworzyæ j¹ nieco na stole alchemicznym.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_04");	//Po przerobieniu nada siê ona idealnie na miksturê lecznicz¹. Im silniejsze dzia³anie ma dana roœlina, tym lepszy bêdzie eliksir, który uwarzysz.
};

func void info_miguel_erzaehl_mana()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Mana_15_01");	//Jak wygl¹daj¹ roœliny many?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_02");	//Istniej¹ trzy ró¿ne odmiany tej¿e roœliny: s³aba, zwyk³a i mocna.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_03");	//Tak¹ roœlinê mo¿esz albo samemu za¿yæ, albo przetworzyæ j¹ nieco na stole alchemicznym.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_04");	//Po przerobieniu nada siê ona idealnie na miksturê many. Im silniejsze dzia³anie ma dana roœlina, tym lepszy bêdzie eliksir, który uwarzysz.
};

func void info_miguel_erzaehl_special()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Special_15_01");	//Co warto wiedzieæ o specjalnych roœlinach?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_02");	//S¹ to roœliny, które zdecydowanie trudniej jest znaleŸæ. Ale maj¹ one za to niezwyk³e w³aœciwoœci.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_03");	//Do takich rzadszych roœlin mo¿na zaliczyæ te¿ jagody, nasiona czy mech.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_04");	//Istniej¹ mikstury, które mo¿na uwarzyæ tylko z takich w³aœnie sk³adników. Oczywiœcie cena roœnie w zale¿noœci od tego, jak cenna jest dana roœlina dla kupca.
};


instance stt_5036_miguel_garaz(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_garaz_condition;
	information = stt_5036_miguel_garaz_info;
	important = 0;
	permanent = 0;
	description = "Móg³byœ mi co nieco opowiedzieæ o Garazie?";
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
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_15_01");	//Móg³byœ mi co nieco opowiedzieæ o Garazie?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_02");	//A co konkretnie chcesz wiedzieæ?
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_03");	//Naprawdê pilnie potrzebujê klucza do jego skrzyni, tyle ¿e niestety ca³y czas trzyma go przy sobie.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_04");	//Ach, o to chodzi, he he.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_05");	//Dobra, skoro tak ci zale¿y na tym kluczu, to istniej¹ dwa warianty jego zdobycia.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_06");	//Mo¿esz mu go po prostu zwin¹æ z kieszeni...
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_07");	//...albo wykorzystasz jedn¹ z jego s³aboœci.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_08");	//A có¿ to za s³aboœæ?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_09");	//Poczêstuj go butelk¹ wina. Dziêki temu doœæ szybko siê zaleje i nie powinno byæ ju¿ problemu z uzyskaniem od niego klucza.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_10");	//Dziêki za radê, trzymaj siê!
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_11");	//Ach, nie ma sprawy. To bêdzie dla niego nauczka za to ci¹g³e deptanie mojej - jak on to nazywa - zieleniny.
	B_LogEntry(CH1_SCHULDEN,"Miguel twierdzi, ¿e powinienem poczêstowaæ Garaza butelk¹ wina. Dziêki temu nie bêdzie ju¿ z kluczem ¿adnego problemu.");
};

