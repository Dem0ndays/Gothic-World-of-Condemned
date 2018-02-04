
instance DIA_BaalOrun_Exit(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 999;
	condition = DIA_BaalOrun_Exit_Condition;
	information = DIA_BaalOrun_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

func void DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalOrun_Ansprechbar;
var int BaalOrun_Sakrileg;

instance DIA_BaalOrun_NoTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_NoTalk_Condition;
	information = DIA_BaalOrun_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalOrun_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalOrun_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalOrun_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalOrun_NoTalk);
	Info_AddChoice(DIA_BaalOrun_NoTalk,DIALOG_ENDE,DIA_BaalOrun_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Wszystko w porz¹dku, kolego?",DIA_BaalOrun_NoTalk_Imp);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Niech Œni¹cy bêdzie z tob¹!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Czeœæ! Jestem tu nowy!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Czeœæ! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Niech Œni¹cy bêdzie z tob¹!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//Wszystko w porz¹dku, kolego?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalOrun_FirstTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_FirstTalk_Condition;
	information = DIA_BaalOrun_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalOrun_FirstTalk_Condition()
{
	if(Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE;
		return 1;
	};
};

func void DIA_BaalOrun_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//Rozmawia³em z Ghorimem. Odda³eœ jednemu z naszych braci nie lada przys³ugê. Twoja sprawa by³a s³uszna.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//Dlatego postanowi³em wyznaczyæ ciê do pewnego szczególnego zadania.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//Cor Kalom pilnie potrzebuje do swoich eksperymentów œwie¿ej dostawy bagiennego ziela.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//Nasi zbieracze pracuj¹ dniem i noc¹. IdŸ do nich i przynieœ wszystko co uzbierali do laboratorium alchemicznego Kaloma.
	B_GiveXP(XP_BaalOrunTalks);
	B_LogEntry(CH1_GhorimsRelief,"Harlok wreszcie zast¹pi³ Ghorima. Cuda siê zdarzaj¹.");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_SUCCESS);
	Log_CreateTopic(CH1_DeliverWeed,LOG_MISSION);
	Log_SetTopicStatus(CH1_DeliverWeed,LOG_RUNNING);
	B_LogEntry(CH1_DeliverWeed,"Sposób, w jaki poradzi³em sobie z Harlokiem wywar³ wra¿enie na Guru Baal Orunie. Powierzy³ mi zaszczytne zadanie dostarczenia œwie¿ego zbioru bagiennego ziela do laboratorium Cor Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Nic nie mów",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Gdzie znajdê tych zbieraczy?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//Gdzie znajdê tych zbieraczy?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//Nie pozwoli³em ci zwracaæ siê do mnie!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//Módl siê, aby Œni¹cy wybaczy³ ci to bluŸnierstwo! A teraz odejdŸ! Twoje zadanie jest niezwykle wa¿ne.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};


instance DIA_BaalOrun_GotWeed(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_GotWeed_Condition;
	information = DIA_BaalOrun_GotWeed_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalOrun_GotWeed_Condition()
{
	if(Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_GotWeed_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//Obroni³eœ naszych zbieraczy...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//Nie tylko udowodni³eœ, ¿e jesteœ po naszej stronie - pokaza³eœ równie¿, ¿e jesteœ godnym s³ug¹ Œni¹cego.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//Myœlê, ¿e jesteœ godzien nosiæ szatê Nowicjusza.
	BaalOrun_Ansprechbar = TRUE;
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Orun nazwa³ mnie godnym s³ug¹ Œni¹cego, gdy¿ obroni³em Nowicjuszy na bagnie przed atakami krwiopijców.");
	B_GiveXP(XP_ImpressedBaalOrun);
};


instance DIA_BaalOrun_WeedAtKaloms(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_WeedAtKaloms_Condition;
	information = DIA_BaalOrun_WeedAtKaloms_Info;
	permanent = 0;
	description = "Zanios³em ziele Cor Kalomowi.";
};


func int DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//Zanios³em ziele Cor Kalomowi.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//Dobrze siê spisa³eœ. Mam dla ciebie drobn¹ nagrodê za twoje trudy. Proszê, weŸ to.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//To magiczne zaklêcie snu. Mo¿esz go u¿yæ tylko jeden raz, ale jestem pewien, ¿e kiedyœ ci siê przyda.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_09");	//A gdy tylko do nas do³¹czysz, poinstruujê ciê w jaki sposób przetworzyæ bagienne ziele.
	BaalOrun_Ansprechbar = TRUE;
	B_GiveXP(XP_ReportToBaalOrun);
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Orun mo¿e mnie nauczyæ przerabiaæ bagienne ziele. Jedyny szkopu³ le¿y w tym, ¿e muszê pierw do³¹czyæ do obozu na bagnie, aby zdradzi³ mi tajemnice tej¿e produkcji.");
	CreateInvItem(self,ItArScrollSleep);
	B_GiveInvItems(self,other,ItArScrollSleep,1);
};


instance DIA_BaalOrun_Perm(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_Perm_Condition;
	information = DIA_BaalOrun_Perm_Info;
	permanent = 1;
	description = "Jak przebiega produkcja ziela?";
};


func int DIA_BaalOrun_Perm_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_Perm_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00");	//Jak przebiega produkcja ziela?
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//Wytê¿amy wszystkie si³y, ¿eby nad¹¿yæ z produkcj¹. W koñcu musimy zadbaæ o w³asne potrzeby, i jeszcze wymieniaæ czêœæ towaru z innymi obozami.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//Ale nasi Nowicjusze chêtnie ponosz¹ tê ofiarê, ku wiêkszej chwale Œni¹cego.
};


instance DIA_BAALORUN_LEARN(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 3;
	condition = dia_baalorun_learn_condition;
	information = dia_baalorun_learn_info;
	permanent = 1;
	description = "Przetwórstwo ziela (Koszt: 5 PN)";
};


func int dia_baalorun_learn_condition()
{
	if((BaalOrun_FetchWeed == LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_BaalOrun_WeedAtKaloms) && (knows_stompherb == FALSE) && C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};
};

func void dia_baalorun_learn_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Learn_15_00");	//Chcia³bym nauczyæ siê prawid³owo obrabiaæ bagienne ziele.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_01");	//Niech i tak bêdzie. Na pocz¹tek bierzesz garœæ bagiennego ziela i umieszczasz go w garnku.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_02");	//Potem zaczyna siê ugniatanie. Musisz ubijaæ w jednolitym rytmie.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_03");	//Na koniec zabierasz to ut³uczone ziele i zabierasz siê za zwijanie skrêta.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_04");	//Im lepsze ma byæ dzia³anie zió³ka, tym wiêcej potrzeba ci bêdzie roœlin bagiennego ziela.
		Log_CreateTopic(GE_HERB,LOG_NOTE);
		B_LogEntry(GE_HERB,"Pozna³em teraz tajemnice obrabiania bagiennego ziela i jestem teraz w stanie je przetworzyæ.");
		B_LogEntry(GE_HERB,"Do zielonego nowicjusza potrzebna jest roœlina bagiennego ziela.");
		B_LogEntry(GE_HERB,"Dla mroku pó³nocy wymagane s¹ dwie roœliny bagiennego ziela.");
		B_LogEntry(GE_HERB,"Dla zewu nocy konieczne s¹ trzy roœliny bagiennego ziela.");
		knows_stompherb = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Przetwórstwo ziela",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance dia_baalorun_cooking(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 4;
	condition = dia_baalorun_cooking_condition;
	information = dia_baalorun_cooking_info;
	permanent = 0;
	description = "Móg³byœ nauczyæ mnie gotowaæ?";
};


func int dia_baalorun_cooking_condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY) && (BaalOrun_Ansprechbar == TRUE))
	{
		return 1;
	};
};

func void dia_baalorun_cooking_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Cooking_15_00");	//S³ysza³em, ¿e móg³byœ nauczyæ mnie nieco o gotowaniu.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_01");	//Tak, to prawda.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_02");	//Znam siê na przyrz¹dzaniu zupy z pe³zacza. Jeœli jesteœ zainteresowany, chêtnie ciê tego nauczê.
};


instance DIA_BAALORUN_SOUP(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 5;
	condition = dia_baalorun_soup_condition;
	information = dia_baalorun_soup_info;
	permanent = 1;
	description = "Zupa z pe³zacza (Koszt: 1 PN)";
};


func int dia_baalorun_soup_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalorun_cooking) && (knows_crawlersoup == FALSE))
	{
		return 1;
	};
};

func void dia_baalorun_soup_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Soup_15_00");	//Naucz mnie przyrz¹dzaæ zupê z pe³zacza.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_01");	//Dobrze. Zacznij na pocz¹tek od zagotowania wody.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_02");	//Po chwili dodajesz wnêtrznoœci pe³zacza do zupy.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_03");	//Musz¹ byæ dobrze przegotowane, tak aby trucizna z ¿uwaczek utraci³a swoje dzia³anie.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_04");	//A na koniec dorzucasz jeszcze orkowe ziela i wszystko mieszasz.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Umiem sobie teraz przyrz¹dziæ zupê z pe³zacza dziêki Baal Orunowi.");
		B_LogEntry(GE_COOK,"Sk³adniki: 2x orkowe ziele i 1x wnêtrznoœci pe³zacza.");
		knows_crawlersoup = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Zupa z pe³zacza",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

