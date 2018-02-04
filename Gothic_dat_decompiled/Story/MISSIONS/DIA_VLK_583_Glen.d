
instance VLK_583_Glen_Exit(C_Info)
{
	npc = VLK_583_Glen;
	nr = 999;
	condition = VLK_583_Glen_Exit_Condition;
	information = VLK_583_Glen_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int VLK_583_Glen_Exit_Condition()
{
	return 1;
};

func void VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance VLK_583_Glen_INFO(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_INFO_Condition;
	information = VLK_583_Glen_INFO_Info;
	important = 0;
	permanent = 1;
	description = "O czym powinienem pamiêtaæ, bêd¹c w kopalni?";
};


func int VLK_583_Glen_INFO_Condition()
{
	return 1;
};

func void VLK_583_Glen_INFO_Info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//O czym powinienem pamiêtaæ, bêd¹c w kopalni?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//Uwa¿aj na pe³zacze.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//Im ni¿ej zejdziesz, tym czêœciej mo¿esz na nie wpaœæ. Te przeklête stwory przychodz¹ chyba wprost z królestwa samego Beliara!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//Bez przerwy s³ychaæ, jak grzebi¹ i kopi¹. Siedz¹ w ciemnoœci i czekaj¹ na jakiegoœ biednego górnika, z którego zrobi¹ sobie obiad.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//S¹ bezlitosne i bardzo szybkie. Jeœli ci ¿ycie mi³e, uciekaj st¹d ile si³ w nogach. Prêdzej czy póŸniej padnie i na ciebie.
};


instance VLK_583_Glen_LOCKPICK(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_LOCKPICK_Condition;
	information = VLK_583_Glen_LOCKPICK_Info;
	important = 0;
	permanent = 0;
	description = "S³ysza³em, ¿e mo¿na tu kupiæ wytrychy?";
};


func int VLK_583_Glen_LOCKPICK_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GLEN))
	{
		return 1;
	};
};

func void VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//S³ysza³em, ¿e mo¿na tu kupiæ wytrychy?
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//Skoro okaza³eœ siê na tyle sprytny, ¿eby do mnie dotrzeæ, mo¿esz kilka kupiæ. To bêdzie 10 bry³ek rudy za sztukê.
};


var int glen_trade;

instance VLK_583_Glen_BUY(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_BUY_Condition;
	information = VLK_583_Glen_BUY_Info;
	important = 0;
	permanent = 1;
	description = "(kup wytrychy)";
	trade = 1;
};


func int VLK_583_Glen_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_583_Glen_LOCKPICK))
	{
		return 1;
	};
};

func void VLK_583_Glen_BUY_Info()
{
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//Chcê kupiæ kilka wytrychów.
	if(glen_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Jeden z Kopaczy w Starej Kopalni, niejaki Glen, mo¿e mi sprzedaæ kilka wytrychów.");
		glen_trade = TRUE;
	};
};


instance VLK_583_GLEN_GARRET(C_Info)
{
	npc = VLK_583_Glen;
	condition = vlk_583_glen_garret_condition;
	information = vlk_583_glen_garret_info;
	important = 0;
	permanent = 0;
	description = "Mówi ci coœ imiê Garret?";
};


func int vlk_583_glen_garret_condition()
{
	if(lost_digger == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_583_glen_garret_info()
{
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_01");	//Mówi ci coœ imiê Garret?
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_02");	//Garret? A tak, to by³ jeden z Kopaczy. Kopê lat ju¿ siedzi za t¹ barier¹.
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_03");	//W³aœnie jego szukam. Ian powiedzia³, ¿e gdzieœ znikn¹³.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_04");	//Garret znikn¹³? No có¿, nie widzia³em go...
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_05");	//Ale mogê ci zapewniæ, ¿e nie opuœci³ kopalni. Tyle jest pewne.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_06");	//W koñcu widzê ka¿dego, kto wchodzi lub wychodzi z kopalni, a Garret siê do ¿adnej z tych grup nie zalicza³.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_07");	//W zwi¹zku z tym musi siê pewnie ukrywaæ gdzieœ tutaj.
	B_LogEntry(CH1_LOSTDIGGER,"Glen jest pewien, ¿e Garret ukrywa siê gdzieœ w kopalni, bowiem nigdy jej jeszcze nie opuœci³.");
};

