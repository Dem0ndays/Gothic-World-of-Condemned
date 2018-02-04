
instance DIA_Caine_Exit(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Caine_Hallo(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	permanent = 0;
	description = "Cze��, jestem tu nowy.";
};


func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Cze��, jestem tu nowy.
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//Ja... Ja jestem Caine, ucze� Cor Kaloma. Zapewne ju� o nim s�ysza�e�, co?
	Info_ClearChoices(DIA_Caine_Hallo);
	Info_AddChoice(DIA_Caine_Hallo,"Nie.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo,"Tak.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//Tak.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Zatem wiesz ju�, �e to najwa�niejszy cz�owiek w tym obozie, zaraz po Ja�nie O�wieconym Y'Berionie.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Nie.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Nie?! Chyba jeste� tu od niedawna, co?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Cor Kalom to najwa�niejszy cz�owiek w Bractwie, po Y'Berionie. To on decyduje, kto zostanie przyj�ty w szeregi Nowicjuszy.
	Info_ClearChoices(DIA_Caine_Hallo);
};


instance DIA_CAINE_WAYSTOKALOM(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_waystokalom_condition;
	information = dia_caine_waystokalom_info;
	permanent = 0;
	description = "Chcia�bym porozmawia� z Cor Kalomem - mo�esz mi pom�c?";
};


func int dia_caine_waystokalom_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (kaloms_guard == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_waystokalom_info()
{
	AI_Output(other,self,"DIA_Caine_WaysToKalom_15_00");	//Chcia�bym porozmawia� z Cor Kalomem - mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Caine_WaysToKalom_13_01");	//Musisz mie� dobry pow�d, �eby si� z nim spotka�.
	AI_Output(self,other,"DIA_Caine_WaysToKalom_13_02");	//Stra�nik dosta� polecenie, by przepuszcza� tylko tych, kt�rzy przynosz� jakie� substancje alchemiczne, albo zostali przys�ani przez kt�rego� z Guru.
	if(kaloms_guard == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Je�li chcia�bym porozmawia� z Cor Kalomem, potrzebuj� albo jakich� substancji alchemicznych, albo pozwolenia kt�rego� z Guru.");
	};
};


instance DIA_CAINE_ALCHEMIES(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_alchemies_condition;
	information = dia_caine_alchemies_info;
	permanent = 0;
	description = "A jakie� to substancje alchemiczne m�g�bym przynie�� Kalomowi?";
};


func int dia_caine_alchemies_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_waystokalom) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (kaloms_guard == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_alchemies_info()
{
	AI_Output(other,self,"DIA_Caine_Alchemies_15_00");	//A jakie� to substancje alchemiczne m�g�bym przynie�� Kalomowi?
	AI_Output(self,other,"DIA_Caine_Alchemies_13_01");	//Mistrzowi potrzebna jest przede wszystkim wydzielina pe�zaczy. Je�li zbierzesz jej do�� du�o, stra�nik na pewno ci� przepu�ci.
	AI_Output(self,other,"DIA_Caine_Alchemies_13_02");	//Wprawdzie r�ne ro�liny i jagody, kt�re rosn� pomi�dzy obozami, r�wnie� mu si� przydaj�, ale to ju� dzia�ka Fortuno.
	if(kaloms_guard == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Stra�nik pozwoli mi przej��, je�li tylko przynios� Cor Kalomowi wydzielin� pe�zaczy.");
	};
};


instance DIA_Caine_Job(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	permanent = 0;
	description = "A ty czym si� zajmujesz?";
};


func int DIA_Caine_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//A ty czym si� zajmujesz?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Pomagam mojemu mistrzowi w pracach nad jego magicznymi wywarami.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//G��wnie z ziela bagiennego i wydzieliny pe�zaczy. Swoj� drog�, m�j mistrz pilnie potrzebuje tej wydzieliny.
};


instance DIA_Caine_WoSekret(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	permanent = 0;
	description = "Gdzie mog� zdoby� t�... Wydzielin� pe�zaczy?";
};


func int DIA_Caine_WoSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_WoSekret_Info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Gdzie mog� zdoby� t�... Wydzielin� pe�zaczy?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Stara Kopalnia a� roi si� od pe�zaczy, ale trzeba umie� pozyska� ich wydzielin�.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Je�li powa�nie my�lisz o walce z pe�zaczami, porozmawiaj z kt�rym� ze Stra�nik�w trudni�cych si� polowaniem na nie. Na przyk�ad z Gor Na Drakiem.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//On ka�dego dnia wyrusza z naszego obozu do Starej Kopalni. O �wicie znajdziesz go w pobli�u laboratorium.
};


instance DIA_Caine_AddInfoKalom(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	permanent = 0;
	description = "Co mo�esz mi jeszcze powiedzie� o swoim mistrzu?";
};


func int DIA_Caine_AddInfoKalom_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_AddInfoKalom_Info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Co mo�esz mi jeszcze powiedzie� o swoim mistrzu?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//Jest inny ni� pozostali Guru. Ka�dy mo�e si� do niego odezwa�, ale NIKOMU nie wolno marnowa� jego cennego czasu.
};


instance DIA_CAINE_WIEGURUSEND(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_wiegurusend_condition;
	information = dia_caine_wiegurusend_info;
	permanent = 0;
	description = "Jak mog� sk�oni� kt�rego� z Guru, �eby wys�a� mnie do Kaloma?";
};


func int dia_caine_wiegurusend_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_waystokalom) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (kaloms_guard == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_wiegurusend_info()
{
	AI_Output(other,self,"DIA_Caine_WieGuruSend_15_00");	//Jak mog� sk�oni� kt�rego� z Guru, �eby wys�a� mnie do Kaloma?
	AI_Output(self,other,"DIA_Caine_WieGuruSend_13_01");	//My�l�, �e w tej sprawie najlepiej pom�g�by ci Lester.
	AI_Output(self,other,"DIA_Caine_WieGuruSend_13_02");	//Sam do niedawna pracowa� jeszcze dla Cor Kaloma, a teraz troszczy si� o nowych wraz z innymi Guru.
	if(kaloms_guard == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Je�li mam przekona� kt�rego� z Guru do tego, aby wys�a� mnie do Cor Kaloma, powinienem najlepiej porozmawia� na ten temat z Lesterem.");
	};
};


instance Nov_1301_Caine_CHEST(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 3;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Jak mog� zdoby� receptur� Kaloma?";
};


func int Nov_1301_Caine_CHEST_Condition()
{
	if((Dexter_GetKalomsRecipe == LOG_RUNNING) && Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return TRUE;
	};
};

func void Nov_1301_Caine_CHEST_Info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Jak mog� zdoby� receptur� Kaloma?
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Nie mo�esz. Wszystkie receptury przechowywane s� w zamkni�tej skrzyni.
};


var int lernen_darf_psi;

instance NOV_1301_CAINE_LERNEN(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 4;
	condition = nov_1301_caine_lernen_condition;
	information = nov_1301_caine_lernen_info;
	important = 0;
	permanent = 1;
	description = "M�g�by� przyuczy� mnie nieco alchemii?";
};


func int nov_1301_caine_lernen_condition()
{
	if((lernen_darf_psi == FALSE) && Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return TRUE;
	};
};

func void nov_1301_caine_lernen_info()
{
	AI_Output(other,self,"Nov_1301_Caine_LERNEN_Info_14_01");	//M�g�by� przyuczy� mnie nieco alchemii?
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Caine, alchemik z obozu na bagnie, mo�e mnie poduczy� nieco w dziedzinie alchemii.");
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_02");	//Cor Kalom wiele mnie nauczy�. Wprawdzie koniec mojej edukacji jeszcze nie nadszed�, ale mog� ci ju� co nieco pokaza�.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_03");	//Znam si� zar�wno na miksturach leczniczych, miksturach many, jak i na paru specjalnych wywarach, w kt�rych tajemnice mo�e zosta� wtajemniczony tylko Guru naszego Bractwa.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_04");	//Ale przepisami na eliksiry many i leczenia mog� si� podzieli� r�wnie� z Nowicjuszami i Stra�nikami �wi�tynnymi.
		lernen_darf_psi = TRUE;
	}
	else
	{
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_05");	//M�g�bym - pod warunkiem, �e do nas do��czysz.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_06");	//Cor Kalom skr�ci�by mnie o g�ow�, gdyby si� dowiedzia�, �e zdradzam postronnym receptury naszych mikstur.
	};
};


instance nov_1301_caine_traenke(C_Info)
{
	npc = NOV_1301_Caine;
	condition = nov_1301_caine_traenke_condition;
	information = nov_1301_caine_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jakich mikstur m�g�by� nauczy� mnie warzy�?";
};


func int nov_1301_caine_traenke_condition()
{
	if(((lernen_darf_psi == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void nov_1301_caine_traenke_info()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Info_14_01");	//Jakich mikstur m�g�by� nauczy� mnie warzy�?
	AI_Output(self,other,"Nov_1301_Caine_Traenke_Info_14_02");	//Znam g��wnie receptury na eliksiry lecznicze i many.
	Info_ClearChoices(nov_1301_caine_traenke);
	Info_AddChoice(nov_1301_caine_traenke,DIALOG_BACK,nov_1301_caine_traenke_back);
	if(knows_heilessenz == FALSE)
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esencja uzdrawiaj�ca (Koszt: 1 PN)",nov_1301_caine_traenke_health1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Wyci�g uzdrawiaj�cy (Koszt: 2 PN)",nov_1301_caine_traenke_health2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir uzdrawiaj�cy (Koszt: 3 PN)",nov_1301_caine_traenke_health3);
	};
	if(knows_manaessenz == FALSE)
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esencja magicznej energii (Koszt: 1 PN)",nov_1301_caine_traenke_mana1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Wyci�g magicznej energii (Koszt: 2 PN)",nov_1301_caine_traenke_mana2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir magicznej energii (Koszt: 3 PN)",nov_1301_caine_traenke_mana3);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esencja �ycia (Koszt: 5 PN)",nov_1301_caine_traenke_healthperma1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Wyci�g �ycia (Koszt: 8 PN)",nov_1301_caine_traenke_healthperma2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == TRUE) && (knows_heilpermaelixier == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir �ycia (Koszt: 10 PN)",nov_1301_caine_traenke_healthperma3);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esencja ducha (Koszt: 5 PN)",nov_1301_caine_traenke_manaperma1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Wyci�g ducha (Koszt: 8 PN)",nov_1301_caine_traenke_manaperma2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == TRUE) && (knows_manapermaelixier == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir ducha (Koszt: 10 PN)",nov_1301_caine_traenke_manaperma3);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esencja si�y (Koszt: 5 PN)",nov_1301_caine_traenke_strengthperma1);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Wyci�g si�y (Koszt: 8 PN)",nov_1301_caine_traenke_strengthperma2);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir si�y (Koszt: 10 PN)",nov_1301_caine_traenke_strengthperma3);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Esencja zwinno�ci (Koszt: 5 PN)",nov_1301_caine_traenke_dexperma1);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Wyci�g zwinno�ci (Koszt: 8 PN)",nov_1301_caine_traenke_dexperma2);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir zwinno�ci (Koszt: 10 PN)",nov_1301_caine_traenke_dexperma3);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir zwinno�ci (Koszt: 10 PN)",nov_1301_caine_traenke_dexperma3);
	};
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_psielixier == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Eliksir (Koszt: 10 PN)",nov_1301_caine_traenke_elixier);
	};
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_psicrawler == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Nap�j z pe�zaczy (Koszt: 10 PN)",nov_1301_caine_traenke_crawlerelixier);
	};
};

func void nov_1301_caine_traenke_back()
{
	Info_ClearChoices(nov_1301_caine_traenke);
};

func void nov_1301_caine_traenke_health1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health1_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health1_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_heilessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja uzdrawiaj�ca - 1x woda, 1x s�abe zio�a uzdrawiaj�ce.");
		if((knows_heilessenz == TRUE) && (knows_heilextrakt == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Wyci�g uzdrawiaj�cy (Koszt: 2 PN)",nov_1301_caine_traenke_health2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_health2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiej�tno��: Wyci�g uzdrawiaj�cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health2_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health2_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_heilextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g uzdrawiaj�cy - 1x woda, 2x s�abe zio�a uzdrawiaj�ce, 1x ziele lecznicze.");
		if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir uzdrawiaj�cy (Koszt: 3 PN)",nov_1301_caine_traenke_health3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_health3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiej�tno��: Eliksir uzdrawiaj�cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health3_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health3_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_heilelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir uzdrawiaj�cy - 1x woda, 2x zio�a lecznicze, 1x silne zio�a lecznicze.");
		if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esencja �ycia (Koszt: 5 PN)",nov_1301_caine_traenke_healthperma1);
		};
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esencja si�y (Koszt: 5 PN)",nov_1301_caine_traenke_strengthperma1);
		};
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esencja zwinno�ci (Koszt: 5 PN)",nov_1301_caine_traenke_dexperma1);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana1_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana1_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_manaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja magicznej energii - 1x alkohol, 1x krucze ziele.");
		if((knows_manaessenz == TRUE) && (knows_manaextrakt == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Wyci�g magicznej energii (Koszt: 2 PN)",nov_1301_caine_traenke_mana2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiej�tno��: Wyci�g magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana2_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana2_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_manaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g magicznej energii - 1x alkohol, 2x krucze ziele, 1x czarne ziele.");
		if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir magicznej energii (Koszt: 3 PN)",nov_1301_caine_traenke_mana3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiej�tno��: Eliksir magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana3_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana3_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_manaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir magicznej energii - 1x alkohol, 2x czarne ziele.");
		if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esencja ducha (Koszt: 5 PN)",nov_1301_caine_traenke_manaperma1);
		};
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esencja si�y (Koszt: 5 PN)",nov_1301_caine_traenke_strengthperma1);
		};
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Esencja zwinno�ci (Koszt: 5 PN)",nov_1301_caine_traenke_dexperma1);
		};
		if((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_psielixier == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir (Koszt: 10 PN)",nov_1301_caine_traenke_elixier);
		};
		if((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_psicrawler == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Nap�j z pe�zaczy (Koszt: 10 PN)",nov_1301_caine_traenke_crawlerelixier);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma1_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma1_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_manapermaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja ducha - 1x alkohol, 2x czarne ziele, 1x psianka.");
		if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Wyci�g ducha (Koszt: 8 PN)",nov_1301_caine_traenke_manaperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma2_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma2_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_manapermaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g ducha - 1x alkohol, 2x czarne ziele, 2x psianka.");
		if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == TRUE) && (knows_manapermaelixier == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir ducha (Koszt: 10 PN)",nov_1301_caine_traenke_manaperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma3_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma3_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_manapermaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir ducha - 1x alkohol, 3x czarne ziele, 2x kocianka.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_HealthPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma1_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma1_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_heilpermaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja �ycia - 1x woda, 2x silne zio�a lecznicze.");
		if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Wyci�g �ycia (Koszt: 8 PN)",nov_1301_caine_traenke_healthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_HealthPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma2_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma2_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_heilpermaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g �ycia - 1x woda, 2x silne zio�a lecznicze, 1x orkowe ziele.");
		if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == TRUE) && (knows_heilpermaelixier == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir �ycia (Koszt: 10 PN)",nov_1301_caine_traenke_healthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma3_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma3_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_heilpermaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir �ycia - 1x woda, 3x silne zio�a lecznicze, 2x li�� d�bu.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja si�y",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma1_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma1_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_strengthessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja si�y - 1x woda, 2x orkowe ziele, 1x trolest.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Wyci�g si�y (Koszt: 8 PN)",nov_1301_caine_traenke_strengthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g si�y",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma2_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma2_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_strengthextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g si�y - 1x woda, 3x orkowe ziele, 1x trolest.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir si�y (Koszt: 10 PN)",nov_1301_caine_traenke_strengthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir si�y",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma3_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma3_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_strengthelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir si�y - 1x woda, 4x orkowe ziele, 1x trolest, 1x dragrot.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja zwinno�ci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma1_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma1_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_dexessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja zwinno�ci - 1x alkohol, 2x serafis, 1x ogniocier�.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Wyci�g zwinno�ci (Koszt: 8 PN)",nov_1301_caine_traenke_dexperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g zwinno�ci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma2_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma2_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_dexextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g zwinno�ci - 1x alkohol, 3x serafis, 1x ogniocier�.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Eliksir zwinno�ci (Koszt: 10 PN)",nov_1301_caine_traenke_dexperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir zwinno�ci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma3_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma3_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_dexelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir zwinno�ci - 1x alkohol, 4x serafis, 1x ogniocier�, 1x velais.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_elixier()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Elixier_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Elixier_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Elixier_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_psielixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir - 1x woda, 2x bagienne ziele, 1x wydzielina krwiopijcy.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_crawlerelixier()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_CrawlerElixier_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Nap�j z pe�zaczy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_CrawlerElixier_06_01");	//Przede wszystkim pilnuj, aby doda� ro�liny i zio�a do menzurki PRZED wlaniem do niej r�norakich cieczy.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_CrawlerElixier_06_02");	//Je�li zrobisz wszystko jak trzeba, to powiniene� uzyska� po��dany rezultat.
		knows_psicrawler = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Nap�j z pe�zaczy - 1x woda, 4x bagienne ziele, 4x wn�trzno�ci pe�zacza.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};


instance NOV_1301_CAINE_WELCOME(C_Info)
{
	npc = Nov_1330_BaalParvez;
	condition = nov_1301_caine_welcome_condition;
	information = nov_1301_caine_welcome_info;
	important = 1;
	permanent = 0;
};


func int nov_1301_caine_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1301_caine_welcome_info()
{
	AI_Output(self,other,"Nov_1301_Caine_WELCOME_Info_08_01");	//Daleko zaszed�e� w tak kr�tkim czasie, przyjacielu. Teraz jeste� jednym z naszych duchowych przyw�dc�w. Niesamowite.
	AI_StopProcessInfos(self);
};


instance DIA_CAINE_POTIONHELP(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = dia_caine_potionhelp_condition;
	information = dia_caine_potionhelp_info;
	permanent = 0;
	description = "Potrzebna mi twoja pomoc.";
};


func int dia_caine_potionhelp_condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5))
	{
		return 1;
	};
};

func void dia_caine_potionhelp_info()
{
	AI_Output(other,self,"DIA_Caine_PotionHelp_15_00");	//Potrzebna mi twoja pomoc.
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_01");	//O co chodzi?
	AI_Output(other,self,"DIA_Caine_PotionHelp_13_02");	//Y'Berion jest ju� na skraju �mierci i tylko dzi�ki silnemu eliksirowi leczniczemu b�dziemy w stanie go uratowa�.
	AI_Output(other,self,"DIA_Caine_PotionHelp_13_03");	//Zebra�em te oto lecznicze zio�a, by� m�g� z nich uwarzy� nap�j.
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_04");	//W porz�dku. Poczekaj chwilk�.
	B_GiveInvItems(other,self,ItFo_Plants_Herb_03,5);
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,5);
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_05");	//No, gotowe. Masz, lepiej si� pospiesz!
	CreateInvItem(self,HealthWater);
	B_GiveInvItems(self,other,HealthWater,1);
};

