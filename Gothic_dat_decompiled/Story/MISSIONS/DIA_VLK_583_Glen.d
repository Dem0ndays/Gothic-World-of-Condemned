
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
	description = "O czym powinienem pami�ta�, b�d�c w kopalni?";
};


func int VLK_583_Glen_INFO_Condition()
{
	return 1;
};

func void VLK_583_Glen_INFO_Info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//O czym powinienem pami�ta�, b�d�c w kopalni?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//Uwa�aj na pe�zacze.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//Im ni�ej zejdziesz, tym cz�ciej mo�esz na nie wpa��. Te przekl�te stwory przychodz� chyba wprost z kr�lestwa samego Beliara!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//Bez przerwy s�ycha�, jak grzebi� i kopi�. Siedz� w ciemno�ci i czekaj� na jakiego� biednego g�rnika, z kt�rego zrobi� sobie obiad.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//S� bezlitosne i bardzo szybkie. Je�li ci �ycie mi�e, uciekaj st�d ile si� w nogach. Pr�dzej czy p�niej padnie i na ciebie.
};


instance VLK_583_Glen_LOCKPICK(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_LOCKPICK_Condition;
	information = VLK_583_Glen_LOCKPICK_Info;
	important = 0;
	permanent = 0;
	description = "S�ysza�em, �e mo�na tu kupi� wytrychy?";
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
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//S�ysza�em, �e mo�na tu kupi� wytrychy?
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//Skoro okaza�e� si� na tyle sprytny, �eby do mnie dotrze�, mo�esz kilka kupi�. To b�dzie 10 bry�ek rudy za sztuk�.
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
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//Chc� kupi� kilka wytrych�w.
	if(glen_trade == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Jeden z Kopaczy w Starej Kopalni, niejaki Glen, mo�e mi sprzeda� kilka wytrych�w.");
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
	description = "M�wi ci co� imi� Garret?";
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
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_01");	//M�wi ci co� imi� Garret?
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_02");	//Garret? A tak, to by� jeden z Kopaczy. Kop� lat ju� siedzi za t� barier�.
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_03");	//W�a�nie jego szukam. Ian powiedzia�, �e gdzie� znikn��.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_04");	//Garret znikn��? No c�, nie widzia�em go...
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_05");	//Ale mog� ci zapewni�, �e nie opu�ci� kopalni. Tyle jest pewne.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_06");	//W ko�cu widz� ka�dego, kto wchodzi lub wychodzi z kopalni, a Garret si� do �adnej z tych grup nie zalicza�.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_07");	//W zwi�zku z tym musi si� pewnie ukrywa� gdzie� tutaj.
	B_LogEntry(CH1_LOSTDIGGER,"Glen jest pewien, �e Garret ukrywa si� gdzie� w kopalni, bowiem nigdy jej jeszcze nie opu�ci�.");
};

