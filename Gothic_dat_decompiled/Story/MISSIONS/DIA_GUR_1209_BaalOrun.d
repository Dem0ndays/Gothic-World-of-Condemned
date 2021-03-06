
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
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Wszystko w porz�dku, kolego?",DIA_BaalOrun_NoTalk_Imp);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Niech �ni�cy b�dzie z tob�!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Cze��! Jestem tu nowy!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Cze��! Jestem tu nowy!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Niech �ni�cy b�dzie z tob�!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//Wszystko w porz�dku, kolego?
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
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//Rozmawia�em z Ghorimem. Odda�e� jednemu z naszych braci nie lada przys�ug�. Twoja sprawa by�a s�uszna.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//Dlatego postanowi�em wyznaczy� ci� do pewnego szczeg�lnego zadania.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//Cor Kalom pilnie potrzebuje do swoich eksperyment�w �wie�ej dostawy bagiennego ziela.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//Nasi zbieracze pracuj� dniem i noc�. Id� do nich i przynie� wszystko co uzbierali do laboratorium alchemicznego Kaloma.
	B_GiveXP(XP_BaalOrunTalks);
	B_LogEntry(CH1_GhorimsRelief,"Harlok wreszcie zast�pi� Ghorima. Cuda si� zdarzaj�.");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_SUCCESS);
	Log_CreateTopic(CH1_DeliverWeed,LOG_MISSION);
	Log_SetTopicStatus(CH1_DeliverWeed,LOG_RUNNING);
	B_LogEntry(CH1_DeliverWeed,"Spos�b, w jaki poradzi�em sobie z Harlokiem wywar� wra�enie na Guru Baal Orunie. Powierzy� mi zaszczytne zadanie dostarczenia �wie�ego zbioru bagiennego ziela do laboratorium Cor Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Nic nie m�w",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Gdzie znajd� tych zbieraczy?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//Gdzie znajd� tych zbieraczy?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//Nie pozwoli�em ci zwraca� si� do mnie!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//M�dl si�, aby �ni�cy wybaczy� ci to blu�nierstwo! A teraz odejd�! Twoje zadanie jest niezwykle wa�ne.
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
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//Obroni�e� naszych zbieraczy...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//Nie tylko udowodni�e�, �e jeste� po naszej stronie - pokaza�e� r�wnie�, �e jeste� godnym s�ug� �ni�cego.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//My�l�, �e jeste� godzien nosi� szat� Nowicjusza.
	BaalOrun_Ansprechbar = TRUE;
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Orun nazwa� mnie godnym s�ug� �ni�cego, gdy� obroni�em Nowicjuszy na bagnie przed atakami krwiopijc�w.");
	B_GiveXP(XP_ImpressedBaalOrun);
};


instance DIA_BaalOrun_WeedAtKaloms(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_WeedAtKaloms_Condition;
	information = DIA_BaalOrun_WeedAtKaloms_Info;
	permanent = 0;
	description = "Zanios�em ziele Cor Kalomowi.";
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
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//Zanios�em ziele Cor Kalomowi.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//Dobrze si� spisa�e�. Mam dla ciebie drobn� nagrod� za twoje trudy. Prosz�, we� to.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//To magiczne zakl�cie snu. Mo�esz go u�y� tylko jeden raz, ale jestem pewien, �e kiedy� ci si� przyda.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_09");	//A gdy tylko do nas do��czysz, poinstruuj� ci� w jaki spos�b przetworzy� bagienne ziele.
	BaalOrun_Ansprechbar = TRUE;
	B_GiveXP(XP_ReportToBaalOrun);
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Orun mo�e mnie nauczy� przerabia� bagienne ziele. Jedyny szkopu� le�y w tym, �e musz� pierw do��czy� do obozu na bagnie, aby zdradzi� mi tajemnice tej�e produkcji.");
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
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//Wyt�amy wszystkie si�y, �eby nad��y� z produkcj�. W ko�cu musimy zadba� o w�asne potrzeby, i jeszcze wymienia� cz�� towaru z innymi obozami.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//Ale nasi Nowicjusze ch�tnie ponosz� t� ofiar�, ku wi�kszej chwale �ni�cego.
};


instance DIA_BAALORUN_LEARN(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 3;
	condition = dia_baalorun_learn_condition;
	information = dia_baalorun_learn_info;
	permanent = 1;
	description = "Przetw�rstwo ziela (Koszt: 5 PN)";
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
	AI_Output(other,self,"DIA_BaalOrun_Learn_15_00");	//Chcia�bym nauczy� si� prawid�owo obrabia� bagienne ziele.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_01");	//Niech i tak b�dzie. Na pocz�tek bierzesz gar�� bagiennego ziela i umieszczasz go w garnku.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_02");	//Potem zaczyna si� ugniatanie. Musisz ubija� w jednolitym rytmie.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_03");	//Na koniec zabierasz to ut�uczone ziele i zabierasz si� za zwijanie skr�ta.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_04");	//Im lepsze ma by� dzia�anie zi�ka, tym wi�cej potrzeba ci b�dzie ro�lin bagiennego ziela.
		Log_CreateTopic(GE_HERB,LOG_NOTE);
		B_LogEntry(GE_HERB,"Pozna�em teraz tajemnice obrabiania bagiennego ziela i jestem teraz w stanie je przetworzy�.");
		B_LogEntry(GE_HERB,"Do zielonego nowicjusza potrzebna jest ro�lina bagiennego ziela.");
		B_LogEntry(GE_HERB,"Dla mroku p�nocy wymagane s� dwie ro�liny bagiennego ziela.");
		B_LogEntry(GE_HERB,"Dla zewu nocy konieczne s� trzy ro�liny bagiennego ziela.");
		knows_stompherb = TRUE;
		PrintScreen("Nowa umiej�tno��: Przetw�rstwo ziela",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "M�g�by� nauczy� mnie gotowa�?";
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
	AI_Output(other,self,"DIA_BaalOrun_Cooking_15_00");	//S�ysza�em, �e m�g�by� nauczy� mnie nieco o gotowaniu.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_01");	//Tak, to prawda.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_02");	//Znam si� na przyrz�dzaniu zupy z pe�zacza. Je�li jeste� zainteresowany, ch�tnie ci� tego naucz�.
};


instance DIA_BAALORUN_SOUP(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 5;
	condition = dia_baalorun_soup_condition;
	information = dia_baalorun_soup_info;
	permanent = 1;
	description = "Zupa z pe�zacza (Koszt: 1 PN)";
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
	AI_Output(other,self,"DIA_BaalOrun_Soup_15_00");	//Naucz mnie przyrz�dza� zup� z pe�zacza.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_01");	//Dobrze. Zacznij na pocz�tek od zagotowania wody.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_02");	//Po chwili dodajesz wn�trzno�ci pe�zacza do zupy.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_03");	//Musz� by� dobrze przegotowane, tak aby trucizna z �uwaczek utraci�a swoje dzia�anie.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_04");	//A na koniec dorzucasz jeszcze orkowe ziela i wszystko mieszasz.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Umiem sobie teraz przyrz�dzi� zup� z pe�zacza dzi�ki Baal Orunowi.");
		B_LogEntry(GE_COOK,"Sk�adniki: 2x orkowe ziele i 1x wn�trzno�ci pe�zacza.");
		knows_crawlersoup = TRUE;
		PrintScreen("Nowa umiej�tno��: Zupa z pe�zacza",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

