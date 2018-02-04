
instance DIA_Joru_Exit(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 999;
	condition = DIA_Joru_Exit_Condition;
	information = DIA_Joru_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Joru_Exit_Condition()
{
	return 1;
};

func void DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORU_SMOKINGTEACHER(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = dia_joru_smokingteacher_condition;
	information = dia_joru_smokingteacher_info;
	permanent = 0;
	important = 1;
	description = "Nowy?";
};


func int dia_joru_smokingteacher_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void dia_joru_smokingteacher_info()
{
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_15_00");	//Jeste� tu nowy, co? Mia�e� ju� okazj� posmakowa� naszego ziela?
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_01");	//Je�li nie, powiniene� to jak najszybciej uczyni�. Wiesz, jest naprawd� dobre. Ono otwiera tw�j umys� na s�owa �ni�cego.
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_02");	//Chod�, do��cz do nas i uwolnij swego ducha. Przygotuj si� na podr�.
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_03");	//Duchow� podr�. Naucz si� korzysta� z si�y umys�u. Naucz si� j� kontrolowa�.
	AI_Output(self,other,"DIA_Joru_SmokingTeacher_07_04");	//Otw�rz si� na poszukiwania, zacznij wypatrywa�, odkryj prawd�. Wszystkiego b�dziesz w stanie do�wiadczy�, je�li tylko do nas do��czysz.
};


instance DIA_Joru_Greet(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = DIA_Joru_Greet_Condition;
	information = DIA_Joru_Greet_Info;
	permanent = 0;
	description = "Czym si� tu zajmujesz?";
};


func int DIA_Joru_Greet_Condition()
{
	return 1;
};

func void DIA_Joru_Greet_Info()
{
	AI_Output(other,self,"DIA_Joru_Greet_15_00");	//Czym si� tu zajmujesz?
	AI_Output(self,other,"DIA_Joru_Greet_07_01");	//Przekazuj� m�dro�� �ni�cego naszym Nowicjuszom.
	AI_Output(self,other,"DIA_Joru_Greet_07_02");	//Sam jestem jeszcze Nowicjuszem, ale ju� wkr�tce zostan� Baalem - jednym z Guru.
	AI_Output(self,other,"DIA_Joru_Greet_07_03");	//Rozmawia�em nawet z Y'Berionem. To wielki Wybraniec. Powiedzia� mi, �e je�li b�d� pracowa� wystarczaj�co ci�ko, nied�ugo sam zostan� wielkim mistrzem.
	AI_Output(self,other,"DIA_Joru_Greet_07_04");	//Ale to jeszcze przysz�o��. Nie spieszy mi si�, rozumiesz? Zostan� mistrzem, gdy przyjdzie odpowiednia pora.
	AI_Output(self,other,"DIA_Joru_Greet_07_05");	//Chwilowo jestem bardzo zadowolony z mojej pracy.
};


instance DIA_Joru_Tester(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = DIA_Joru_Tester_Condition;
	information = DIA_Joru_Tester_Info;
	permanent = 0;
	description = "Na czym polega twoja praca?";
};


func int DIA_Joru_Tester_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

func void DIA_Joru_Tester_Info()
{
	AI_Output(other,self,"DIA_Joru_Tester_15_00");	//Na czym polega twoja praca?
	AI_Output(self,other,"DIA_Joru_Tester_07_01");	//Wraz z kolegami testuj� magiczne substancje opracowane przez Cor Kaloma w jego laboratorium.
	AI_Output(self,other,"DIA_Joru_Tester_07_02");	//Jego asystent przynosi nam co kilka dni co� nowego, a my to testujemy.
	AI_Output(self,other,"DIA_Joru_Tester_07_03");	//To ziele otwiera twoj� dusz�. Po za�yciu odpowiedniej ilo�ci b�dziesz m�g� nawi�za� kontakt ze �ni�cym!
};


instance DIA_Joru_SleeperContact(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 1;
	condition = DIA_Joru_SleeperContact_Condition;
	information = DIA_Joru_SleeperContact_Info;
	permanent = 0;
	description = "A tobie uda�o si� kiedy� stan�� przed obliczem �ni�cego?";
};


func int DIA_Joru_SleeperContact_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

func void DIA_Joru_SleeperContact_Info()
{
	AI_Output(other,self,"DIA_Joru_SleeperContact_15_00");	//A tobie uda�o si� kiedy� stan�� przed obliczem �ni�cego?
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_01");	//Nie, jeszcze nie! Ale tylko dlatego, �e nie dostajemy wystarczaj�cej ilo�ci ziela.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_02");	//Kalom zawsze pyta nas o efekty, ale odnosz� wra�enie, �e wcale mu nie zale�y na moim zdaniu.
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_03");	//Je�li jego wynalazki dzia�aj� stymuluj�co, natychmiast trafiaj� do Guru...
	AI_Output(self,other,"DIA_Joru_SleeperContact_07_04");	//Ale nied�ugo ja sam zostan� Guru. Wtedy otrzymam odpowiedni� porcj� ziela i b�d� m�g� osobi�cie wys�ucha� g�osu �ni�cego.
};


var int Joru_BringJoints;

instance DIA_Joru_JoinPsi(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_JoinPsi_Condition;
	information = DIA_Joru_JoinPsi_Info;
	permanent = 0;
	description = "Chcia�bym do��czy� do waszego obozu. Mo�esz mi pom�c?";
};


func int DIA_Joru_JoinPsi_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Joru_Greet) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Joru_JoinPsi_Info()
{
	AI_Output(other,self,"DIA_Joru_JoinPsi_15_00");	//Chcia�bym do��czy� do waszego obozu. Mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_01");	//Chcesz do nas do��czy�! To �wietnie! Zaczekaj... Tak, chyba m�g�bym ci pom�c!
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_02");	//Nie jestem jeszcze Guru, ale mam pewne wp�ywy w Bractwie.
	AI_Output(self,other,"DIA_Joru_JoinPsi_07_03");	//Oczywi�cie musia�by� wy�wiadczy� mi drobn� przys�ug�. Rozmawia�e� ju� z Fortuno?
	Info_ClearChoices(DIA_Joru_JoinPsi);
	Info_AddChoice(DIA_Joru_JoinPsi,"Nie.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice(DIA_Joru_JoinPsi,"Tak.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_JA_15_01");	//Tak.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Ja_07_00");	//Zatem masz swoj� dzienn� racj�? Je�li mi j� oddasz, dobijemy targu.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Ja_15_01");	//Przemy�l� to sobie.
	Joru_BringJoints = LOG_RUNNING;
	Info_ClearChoices(DIA_Joru_JoinPsi);
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//Nie.
	AI_Output(self,other,"DIA_Joru_JoinPsi_Nein_07_00");	//W takim razie id� do niego i odbierz swoj� dzienn� racj�. Je�li dasz mi ca�e ziele, kt�re od niego otrzymasz, dobijemy targu.
	AI_Output(other,self,"DIA_Joru_JoinPsi_Nein_15_01");	//Przemy�l� to sobie.
	Joru_BringJoints = LOG_RUNNING;
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	B_LogEntry(CH1_JoinPsi,"Joru chce dosta� moj� dzienn� racj� ziela, kt�r� mog� dosta� od Fortuno.");
	Info_ClearChoices(DIA_Joru_JoinPsi);
};


instance DIA_Joru_JointsRunning(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_JointsRunning_Condition;
	information = DIA_Joru_JointsRunning_Info;
	permanent = 1;
	description = "Mam ziele przy sobie. Mo�emy zawrze� uk�ad.";
};


func int DIA_Joru_JointsRunning_Condition()
{
	if(Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Joru_JointsRunning_Info()
{
	AI_Output(other,self,"DIA_Joru_JointsRunning_15_00");	//Mam ziele przy sobie. Mo�emy zawrze� uk�ad.
	if(Npc_HasItems(other,ItMiJoint_2) >= 3)
	{
		AI_Output(self,other,"DIA_Joru_JointsRunning_07_01");	//Dobrze. Zauwa�y�e� pewnie, �e �aden z Guru nie chce z tob� rozmawia�.
		AI_Output(self,other,"DIA_Joru_JointsRunning_07_02");	//Mo�esz to zmieni�, sprawiaj�c na nich dobre wra�enie. Mog� ci powiedzie�, jak tego dokona�.
		B_GiveInvItems(other,self,ItMiJoint_2,3);
		Joru_BringJoints = LOG_SUCCESS;
		B_GiveXP(XP_WeedForJoru);
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00");	//Mia� by� Mrok P�nocy a nie jaka� trawa! Przynie� mi to, o co ci� prosi�em, wtedy dobijemy targu!
	};
};


var int Joru_Tips;

instance DIA_Joru_ImpressGurus(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_ImpressGurus_Condition;
	information = DIA_Joru_ImpressGurus_Info;
	permanent = 1;
	description = "Jak mog� przekona� do siebie Guru?";
};


func int DIA_Joru_ImpressGurus_Condition()
{
	if((Joru_BringJoints == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Joru_ImpressGurus_Info()
{
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_00");	//Jak mog� przekona� do siebie Guru?
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_01");	//Baal Cadar wprowadza Nowicjuszy w tajniki magii.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_02");	//Je�li chcesz zwr�ci� na siebie jego uwag�, pos�u� si� czarami.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_03");	//Tylko nie potraktuj go od razu Uderzeniem Wiatru! U�pij kt�rego� z jego uczni�w, albo co� w tym stylu.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_04");	//Baal Namib to ten przy bramie. To jeden z najpot�niejszych ludzi w obozie. Lester b�dzie m�g� ci jako� pom�c. Porozmawiaj z nim jak tylko mistrz oddali si� na chwil�.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_05");	//Pozostali Guru s� mniej wymagaj�cy. Spr�buj si� im jako� przypodoba�, a raz-dwa - dostaniesz si� do Bractwa!
	AI_Output(other,self,"DIA_Joru_ImpressGurus_15_06");	//Dzi�ki za rad�.
	AI_Output(self,other,"DIA_Joru_ImpressGurus_07_07");	//W ko�cu umowa to umowa, nie?
	if(Joru_JoinPsi == FALSE)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		B_LogEntry(CH1_JoinPsi,"Aby zwr�ci� na siebie uwag� Baal Cadara, mam rzuci� zakl�cie snu na jednego z jego uczni�w.");
		B_LogEntry(CH1_JoinPsi,"Zapytam Lestera, w jaki spos�b zjedna� sobie sympati� Baal Namiba. Musz� to tylko zrobi�, gdy Guru nie b�dzie w pobli�u!");
		Joru_JoinPsi = TRUE;
	};
	Joru_Tips = TRUE;
};


instance DIA_Joru_GetMagic(C_Info)
{
	npc = NOV_1305_Joru;
	nr = 5;
	condition = DIA_Joru_GetMagic_Condition;
	information = DIA_Joru_GetMagic_Info;
	permanent = 1;
	description = "Jak mog� opanowa� magi� �ni�cego?";
};


func int DIA_Joru_GetMagic_Condition()
{
	if((Joru_Tips == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Joru_GetMagic_Info()
{
	if(Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
		B_LogEntry(GE_TraderPSI,"Baal Cadar sprzedaje runy i magiczne zwoje.");
		Joru_Tips_Mage = TRUE;
	};
	AI_Output(other,self,"DIA_Joru_GetMagic_15_00");	//Jak mog� opanowa� magi� �ni�cego?
	AI_Output(self,other,"DIA_Joru_GetMagic_07_01");	//Baal Cadar sprzedaje magiczne runy i zwoje z zakl�ciami, ale to dla ciebie niewielka pociecha, bo nie b�dzie chcia� z tob� rozmawia�.
	AI_Output(self,other,"DIA_Joru_GetMagic_07_02");	//Mo�e inny Guru b�dzie m�g� ci pom�c.
};


instance NOV_1305_JORU_WELCOME(C_Info)
{
	npc = NOV_1305_Joru;
	condition = nov_1305_joru_welcome_condition;
	information = nov_1305_joru_welcome_info;
	important = 1;
	permanent = 0;
};


func int nov_1305_joru_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1305_joru_welcome_info()
{
	AI_Output(self,other,"Nov_1305_Joru_WELCOME_Info_08_11");	//Widz�, �e by�e� szybszy ode mnie i uda�o ci si� zosta� Guru. Dobra robota, przyjacielu.
	AI_StopProcessInfos(self);
};

