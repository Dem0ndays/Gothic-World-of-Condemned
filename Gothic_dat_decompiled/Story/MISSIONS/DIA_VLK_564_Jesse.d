
instance DIA_Jesse_Exit(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 999;
	condition = DIA_Jesse_Exit_Condition;
	information = DIA_Jesse_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jesse_Exit_Condition()
{
	return 1;
};

func void DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesse_Hallo(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Hallo_Condition;
	information = DIA_Jesse_Hallo_Info;
	permanent = 0;
	description = "Co s³ychaæ?";
};


func int DIA_Jesse_Hallo_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

func void DIA_Jesse_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Jesse_Hallo_03_01");	//Jesteœ tu nowy, co? Zapamiêtaj sobie, ¿eby nigdy nie w³aziæ w drogê Stra¿nikom.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_02");	//Jak za¿¹daj¹ od ciebie pieniêdzy - zap³aæ. Inaczej œci¹gniesz sobie na g³owê po³owê Obozu.
};


instance DIA_Jesse_Warn(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Warn_Condition;
	information = DIA_Jesse_Warn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Jesse_Warn_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Herek_Bully) && (Herek_ProtectionBully == TRUE))
	{
		return 1;
	};
};

func void DIA_Jesse_Warn_Info()
{
	AI_Output(self,other,"DIA_Jesse_Warn_03_00");	//Hej, ty! S³ysza³em, ¿e nie chcesz p³aciæ Bloodwynowi za ochronê!
	AI_Output(other,self,"DIA_Jesse_Warn_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Jesse_Warn_03_02");	//Chcê ciê ostrzec! Bloodwyn zap³aci³ paru ludziom, ¿eby ciê za³atwili.
	AI_Output(self,other,"DIA_Jesse_Warn_03_03");	//Widzia³em, jak rozmawia³ z paroma osobami, na przyk³ad z tamtym goœciem, Herekiem. Bóg wie, kogo jeszcze wynaj¹³!
	AI_Output(other,self,"DIA_Jesse_Warn_15_04");	//Jeœli chodzi o Hereka, to twoje ostrze¿enie jest nieco spóŸnione.
	AI_Output(self,other,"DIA_Jesse_Warn_03_05");	//Na pewno rozmawia³ z kimœ jeszcze, mo¿esz mi wierzyæ. Uwa¿aj na siebie.
};


instance DIA_Jesse_Mission(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Mission_Condition;
	information = DIA_Jesse_Mission_Info;
	permanent = 0;
	description = "Dlaczego opowiedzia³eœ mi o Bloodwynie?";
};


func int DIA_Jesse_Mission_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jesse_Warn))
	{
		return 1;
	};
};

func void DIA_Jesse_Mission_Info()
{
	AI_Output(other,self,"DIA_Jesse_Mission_15_00");	//Dlaczego opowiedzia³eœ mi o Bloodwynie?
	AI_Output(self,other,"DIA_Jesse_Mission_03_01");	//Bo za przys³ugê nale¿y siê przys³uga. Jesteœ m¹drym ch³opcem. Chyba siê rozumiemy?
	AI_Output(self,other,"DIA_Jesse_Mission_03_02");	//JA wyœwiadczy³em ci w³aœnie przys³ugê, wiêc teraz TWOJA kolej, ¿eby mi siê odwdziêczyæ!
	Info_ClearChoices(DIA_Jesse_Mission);
	Info_AddChoice(DIA_Jesse_Mission,"Nie jestem ci nic winien!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice(DIA_Jesse_Mission,"Co dok³adnie masz na myœli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00");	//Nie jestem ci nic winien!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//Widzê, ¿e myli³em siê co do ciebie. W przysz³oœci nie oczekuj ode mnie pomocy.
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00");	//Co dok³adnie masz na myœli?
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01");	//Nie mam ju¿ rudy, a Bloodwyn i mnie zaczyna dobieraæ siê do ty³ka.
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02");	//Pomog³em ci, wiêc móg³byœ zap³aciæ za mnie te 10 bry³ek, które zalegam, co? Powiedz mu, ¿e to ode mnie!
	Npc_SetTrueGuild(self,GIL_None);
	Info_AddChoice(DIA_Jesse_Mission,"Ja, mia³bym zap³aciæ za ciebie? Chyba œnisz!",DIA_Jesse_Mission_NO);
	Info_AddChoice(DIA_Jesse_Mission,"Zobaczê co siê da zrobiæ.",DIA_Jesse_Mission_YES);
};

func void DIA_Jesse_Mission_YES()
{
	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00");	//Zobaczê co siê da zrobiæ.
	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01");	//Dziêki, stary! Ocali³eœ mi ¿ycie! Daj mi znaæ, jak ju¿ wszystko za³atwisz, dobra?
	Jesse_PayForMe = LOG_RUNNING;
	Log_CreateTopic(CH1_JESSE,LOG_MISSION);
	B_LogEntry(CH1_JESSE,"Kopacz Jesse poprosi³ mnie, abym zap³aci³ Bloodwynowi 10 bry³ek rudy za jego ochronê.");
	Log_SetTopicStatus(CH1_JESSE,LOG_RUNNING);
	Info_ClearChoices(DIA_Jesse_Mission);
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00");	//Ja, mia³bym zap³aciæ za ciebie? Chyba œnisz!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//Widzê, ¿e myli³em siê co do ciebie. W przysz³oœci nie oczekuj ode mnie pomocy.
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
};


instance DIA_Jesse_MisSuccess(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_MisSuccess_Condition;
	information = DIA_Jesse_MisSuccess_Info;
	permanent = 0;
	description = "Zap³aci³em Bloodwynowi!";
};


func int DIA_Jesse_MisSuccess_Condition()
{
	if(Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Jesse_MisSuccess_Info()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00");	//Zap³aci³em Bloodwynowi!
	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01");	//Tak? To œwietnie! No to teraz jesteœmy kwita.
	Npc_SetTrueGuild(self,GIL_VLK);
	Jesse_PayForMe = LOG_SUCCESS;
	B_LogEntry(CH1_JESSE,"Da³em znaæ Jessemu, ¿e zap³aci³em za niego Bloodwynowi. Ch³opak widaæ wielce siê ucieszy³.");
	Log_SetTopicStatus(CH1_JESSE,LOG_SUCCESS);
	B_GiveXP(XP_JESSEPAYFORME);
	Info_ClearChoices(DIA_Jesse_MisSuccess);
	Info_AddChoice(DIA_Jesse_MisSuccess,"COOO???",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice(DIA_Jesse_MisSuccess,"Dok³adnie. Rêka rêkê myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00");	//COOO??? Wyda³em 10 bry³ek na cynk o którym i tak ju¿ wiedzia³em?
	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01");	//Na to wygl¹da.
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00");	//Dok³adnie. Rêka rêkê myje.
	AI_StopProcessInfos(self);
};


instance dia_jesse_sword(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = dia_jesse_sword_condition;
	information = dia_jesse_sword_info;
	permanent = 0;
	description = "Gdzie jest miecz Huno?";
};


func int dia_jesse_sword_condition()
{
	if(Npc_KnowsInfo(hero,dia_fingers_hunosschwert))
	{
		return 1;
	};
};

func void dia_jesse_sword_info()
{
	AI_Output(other,self,"DIA_Jesse_Sword_15_00");	//Gdzie jest miecz Huno?
	AI_Output(self,other,"DIA_Jesse_Sword_03_01");	//¯e co?! Nic o tym nie wiem.
	AI_Output(other,self,"DIA_Jesse_Sword_03_02");	//No ju¿, wypluj to z siebie. Przecie¿ wiem, ¿e macza³eœ w tym palce.
	AI_Output(self,other,"DIA_Jesse_Sword_03_03");	//Ju¿ dobrze... to ja mu ukrad³em ten miecz.
	AI_Output(self,other,"DIA_Jesse_Sword_03_04");	//Musia³em sk¹dœ wytrzasn¹æ rudê, inaczej nie mia³bym z czego zap³aciæ Stra¿nikom za ochronê.
	AI_Output(self,other,"DIA_Jesse_Sword_03_05");	//Sprzeda³em ten miecz pewnemu paserowi z Nowego Obozu.
	AI_Output(self,other,"DIA_Jesse_Sword_03_06");	//Nazywa³ siê Mordrag, pewnie krêci siê ci¹gle gdzieœ w pobli¿u po³udniowej bramy.
	AI_Output(self,other,"DIA_Jesse_Sword_03_07");	//Pomów z nim o tym, jeœli chcesz odzyskaæ ten miecz.
	B_LogEntry(CH1_HUNOLOSTSWORD,"To Kopacz Jesse jest odpowiedzialny za kradzie¿ tego miecza. Zd¹¿y³ sprzedaæ go ju¿ Mordragowi - paserowi z Nowego Obozu.");
};

