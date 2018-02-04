
instance DIA_Scatty_Exit(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 999;
	condition = DIA_Scatty_Exit_Condition;
	information = DIA_Scatty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Scatty_Exit_Condition()
{
	return 1;
};

func void DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Scatty_WhatDoYouDo(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WhatDoYouDo_Condition;
	information = DIA_Scatty_WhatDoYouDo_Info;
	permanent = 0;
	description = "Czym si� tutaj zajmujesz?";
};


func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//Czym si� tutaj zajmujesz?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//Organizuj� walki na arenie. Przyjmuj� zak�ady, pozyskuj� nowych wojownik�w... No wiesz.
};


var int Scatty_ChargeKirgo;
var int Scatty_ChargeKharim;
var int Scatty_ChargeGorHanis;

instance DIA_Scatty_JoinOC(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 4;
	condition = DIA_Scatty_JoinOC_Condition;
	information = DIA_Scatty_JoinOC_Info;
	permanent = 0;
	description = "Chc� do��czy� do waszego obozu. Mo�esz mi pom�c?";
};


func int DIA_Scatty_JoinOC_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_JoinOC_Info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//Chc� do��czy� do waszego obozu. Mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//Pomog� ci, je�li zrobisz na mnie odpowiednio dobre wra�enie.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//Najlepsi wojownicy z wszystkich oboz�w przybywaj� tutaj, by stan�� w szranki na mojej arenie.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//Wyzwij kt�rego� z nich na pojedynek. Zobacz�, co potrafisz, i je�li mi si� spodoba, mo�e szepn� s��wko w twoim imieniu.
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	B_LogEntry(CH1_JoinOC,"Scatty, organizator walk na arenie, chcia�by zobaczy�, jak sobie poradz� w starciu z kt�rym� z jego wojownik�w.");
};


instance DIA_Scatty_KirgoSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
	description = "Walczy�em z Kirgo!";
};


func int DIA_Scatty_KirgoSuccess_Condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if((Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KirgoSuccess_Info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//Walczy�em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//Tak, ale przegra�e�!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//Chyba nie my�lisz, �e b�d� pod wra�eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		B_LogEntry(CH1_JoinOC,"Pora�ka w walce z Kirgo nie zjedna�a mi bynajmniej sympatii Scatty'ego.");
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//I pokona�e� go! Ca�kiem nie�le jak na takiego ��todzioba! Jestem pod wra�eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Scatty by� pod wra�eniem mojej walki z Kirgo.");
		B_GiveXP(XP_kirgovictory);
	};
};


instance DIA_Scatty_KHARIMSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KHARIMSuccess_Condition;
	information = DIA_Scatty_KHARIMSuccess_Info;
	permanent = 0;
	description = "Wyzwa�em Kharima na pojedynek!";
};


func int DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if((Scatty_ChargeKharim == LOG_RUNNING) && (Kharim_Charged == TRUE) && ((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KHARIMSuccess_Info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//Wyzwa�em Kharima na pojedynek!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//I spu�ci� ci niez�e baty!
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//Ale musz� przyzna�, �e wybra�e� sobie dobrego przeciwnika. Nie znosz� tych sukinsyn�w z Nowego Obozu.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//Widz�, �e my�limy podobnie. Przyda si� nam kto� taki jak ty!
		};
		Scatty_ChargeKharim = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry(CH1_JoinOC,"Zosta�em pokonany przez Kharima! Scatty podziwia moj� odwag�, ale uwa�a, �e wojownik ze mnie �aden.");
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//I pokona�e� go! Musz� przyzna�, �e �wietnie sobie poradzi�e�. Kharim od dawna uchodzi� za jednego z najlepszych wojownik�w w kolonii.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//Jestem pod wra�eniem!
		Scatty_ChargeKharim = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Pokaza�em Kharimowi, gdzie raki zimuj�. Scatty by� pod wra�eniem.");
		B_GiveXP(XP_kharimvictory);
	};
};


instance DIA_Scatty_OtherCamps(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 3;
	condition = DIA_Scatty_OtherCamps_Condition;
	information = DIA_Scatty_OtherCamps_Info;
	permanent = 0;
	description = "My�la�em, �e Stary i Nowy Ob�z nie dogaduj� si� najlepiej.";
};


func int DIA_Scatty_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_OtherCamps_Info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//My�la�em, �e Stary i Nowy Ob�z nie dogaduj� si� najlepiej. Dlaczego pozwalacie obcym walczy� na waszej arenie?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi� patrze�, jak Szkodniki z Nowego Obozu dostaj� po g�owie.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//Gdy walczy kt�ry� z nich przyjmuj� wi�cej zak�ad�w, a to dobrze wp�ywa na interes!
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//Osobi�cie nienawidz� tych wieprzy z Nowego Obozu, ale w tych trudnych czasach �aden pieni�dz nie �mierdzi...
};


var int scatty_betday;

instance DIA_Scatty_WannaBet(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "Chcia�bym obstawi� walk�.";
};


func int DIA_Scatty_WannaBet_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Chcia�bym obstawi� walk�.
	if((scatty_betday <= (Wld_GetDay() - 7)) && Wld_IsTime(18,0,23,0))
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_11");	//�wietnie. Dzi� wszyscy wojownicy walcz� na arenie. Mo�esz zatem wybra�, na kogo chcesz zaryzykowa�.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_12");	//Masz prawo postawi� 75 bry�ek, tak jak ca�a reszta. Bez wyj�tk�w, taka kwota zak�ad�w obowi�zuje ka�dego.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		Info_AddChoice(DIA_Scatty_WannaBet,"Stawiam na Kirgo.",dia_scatty_wannabet_kirgo);
		Info_AddChoice(DIA_Scatty_WannaBet,"Stawiam na Kharima.",dia_scatty_wannabet_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"Stawiam na Gor Hanisa.",dia_scatty_wannabet_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_01");	//Przecie� teraz nikt nie walczy!
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_02");	//Najbli�sza walka odb�dzie si� dopiero za kilka dni. B�dzie og�oszenie!
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_03");	//Zak�ady przyjmuj� jedynie mi�dzy godzin� 18 a 23.
	};
};

func void dia_scatty_wannabet_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_WannaBet_15_00");	//Stawiam na Kirgo.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_01");	//Dobrze. Kirgo wprawdzie d�ugo u nas nie zabawi�, ale robi ch�opak du�e post�py.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_02");	//Je�li wygra Kirgo, czeka na ciebie 150 bry�ek. Za� je�li nie, zatrzymam sobie dla siebie twoje wpisowe i zostajesz z niczym.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_04");	//Ruszaj na trybuny ku pozosta�ym widzom i rozkoszuj si� walk�.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		kirgo_bet = TRUE;
		arena_fight = TRUE;
		scatty_betday = Wld_GetDay();
		Npc_ExchangeRoutine(GRD_251_Kirgo,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(GRD_251_Kirgo);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_05");	//Nie widz� tu �adnych 75 bry�ek. Znasz zasady - nie ma rudy, nie ma walki.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_wannabet_kharim()
{
	AI_Output(other,self,"DIA_Scatty_Kharim_WannaBet_15_00");	//Stawiam na Kharima.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_01");	//Na Kharima? No dobra, w ko�cu to dobry wojownik, chocia� jest z Nowego Obozu...
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_02");	//Je�li wygra Kharim, czeka na ciebie 150 bry�ek. Za� je�li nie, zatrzymam sobie dla siebie twoje wpisowe i zostajesz z niczym.
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_04");	//Ruszaj na trybuny ku pozosta�ym widzom i rozkoszuj si� walk�.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		kharim_bet = TRUE;
		arena_fight = TRUE;
		scatty_betday = Wld_GetDay();
		Npc_ExchangeRoutine(GRD_251_Kirgo,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(GRD_251_Kirgo);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_05");	//Nie widz� tu �adnych 75 bry�ek. Znasz zasady - nie ma rudy, nie ma walki.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_wannabet_hanis()
{
	AI_Output(other,self,"DIA_Scatty_Hanis_WannaBet_15_00");	//Stawiam na Gor Hanisa.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_01");	//Tego Sekciarza? To dobry wojownik i wygra� ju� naprawd� wiele walk.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_02");	//Je�li wygra Gor Hanis, czeka na ciebie 150 bry�ek. Za� je�li nie, zatrzymam sobie dla siebie twoje wpisowe i zostajesz z niczym.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_04");	//Ruszaj na trybuny ku pozosta�ym widzom i rozkoszuj si� walk�.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		hanis_bet = TRUE;
		arena_fight = TRUE;
		scatty_betday = Wld_GetDay();
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(Tpl_1422_GorHanis);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_05");	//Nie widz� tu �adnych 75 bry�ek. Znasz zasady - nie ma rudy, nie ma walki.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Scatty_WannaFight(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaFight_Condition;
	information = DIA_Scatty_WannaFight_Info;
	permanent = 1;
	description = "Chcia�bym stoczy� walk� na arenie.";
};


func int DIA_Scatty_WannaFight_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (Npc_GetTrueGuild(hero) == GIL_None) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//Chcia�bym stoczy� walk� na arenie.
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//Nie mog� ci pozwoli� walczy�, p�ki nie do��czysz do kt�rego� z oboz�w.
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//Ludzi nie interesuj� niezale�ni wojownicy.
};


instance DIA_Scatty_TRAIN(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
	description = "Zajmujesz si� r�wnie� szkoleniem wojownik�w?";
};


func int DIA_Scatty_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_TRAIN_Info()
{
	if(log_scattytrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Scatty mo�e mnie nauczy� walki jednor�cznym or�em.");
		log_scattytrain = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//Zajmujesz si� r�wnie� szkoleniem wojownik�w?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//Tak, ale nie za darmo. Jak chcesz, �ebym ci� czego� nauczy�, musisz zap�aci�.
	Info_ClearChoices(DIA_Scatty_TRAIN);
	Info_AddChoice(DIA_Scatty_TRAIN,DIALOG_BACK,DIA_Scatty_TRAIN_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,150),dia_scatty_train_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,50),dia_scatty_train_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_TRAIN);
};

func void dia_scatty_train_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//Chcia�bym nauczy� si� walki jednor�cznym or�em.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
			B_GiveInvItems(other,self,ItMiNugget,50);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//Nie masz wystarczaj�cej ilo�ci rudy!
	};
};

func void dia_scatty_train_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	if(Npc_HasItems(other,ItMiNugget) >= 150)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//Wtedy wyprowad� nast�pne ci�cie z prawej strony...
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
			B_GiveInvItems(other,self,ItMiNugget,150);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	};
};


var int scatty_maybefight;
var int scatty_idoit;

instance dia_scatty_fletcher(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_fletcher_condition;
	information = dia_scatty_fletcher_info;
	permanent = 0;
	description = "Fletcher ma u ciebie jakie� d�ugi?";
};


func int dia_scatty_fletcher_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_reden) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_fletcher_info()
{
	AI_Output(other,self,"DIA_Scatty_Fletcher_15_00");	//Fletcher ma u ciebie jakie� d�ugi?
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_01");	//Tak ci powiedzia�? Ale prawda, i to wcale nie takie ma�e d�ugi.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_02");	//A tobie co do tego?
	AI_Output(other,self,"DIA_Scatty_Fletcher_01_03");	//Chc� mu pom�c.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_04");	//Aha, wi�c tak si� sprawy maj�.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_05");	//No dobra. My�l�, �e mog� ci z�o�y� pewn� propozycj�.
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"Jak� propozycj�?",dia_scatty_fletcher_idea);
};

func void dia_scatty_fletcher_idea()
{
	AI_Output(other,self,"DIA_Scatty_Idea_15_00");	//Jak� propozycj�?
	AI_Output(self,other,"DIA_Scatty_Idea_01_01");	//Walcz za Fletchera na arenie.
	AI_Output(self,other,"DIA_Scatty_Idea_01_02");	//Wygrasz walk�, to daruj� Fletcherowi jego zobowi�zania.
	AI_Output(self,other,"DIA_Scatty_Idea_01_03");	//Za� je�li przegrasz, Fletcher b�dzie zmuszony zap�aci� jeszcze wi�ksz�, podw�jn� sumk�.
	AI_Output(self,other,"DIA_Scatty_Idea_01_04");	//Co ty na to?
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"No dobra, chyba i tak nie mam wyboru.",dia_scatty_fletcher_okay);
	Info_AddChoice(dia_scatty_fletcher,"Zastanowi� si� nad tym.",dia_scatty_fletcher_maybe);
};

func void dia_scatty_fletcher_okay()
{
	AI_Output(other,self,"DIA_Scatty_Okay_15_00");	//No dobra, chyba i tak nie mam wyboru.
	AI_Output(self,other,"DIA_Scatty_Okay_01_01");	//Wspaniale. Zajm� si� wszystkimi niezb�dnymi przygotowaniami do walki.
	AI_Output(self,other,"DIA_Scatty_Okay_01_02");	//Pom�w z Gor Hanisem. On b�dzie twoim przeciwnikiem.
	AI_Output(self,other,"DIA_Scatty_Okay_01_03");	//Powiniene� jednak jeszcze przed tym porozmawia� na ten temat z Fletcherem. Te� chcia�by pewnie zosta� wtajemniczony w t� spraw�.
	Info_ClearChoices(dia_scatty_fletcher);
	scatty_idoit = TRUE;
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty da� mi szans� walczy� z Gor Hanisem, aby darowa� d�ugi Fletcherowi. Je�li wygram, Scatty pu�ci Fletcherowi to wszystko p�azem. Je�li za� przegram, Fletcher zmuszony b�dzie dop�aci� tak� sam� ilo�� rudy. Mo�e pierw powinienem powiedzie� wszystko Fletcherowi, czego si� dowiedzia�em.");
};

func void dia_scatty_fletcher_maybe()
{
	AI_Output(other,self,"DIA_Scatty_Maybe_15_00");	//Zastanowi� si� nad tym.
	AI_Output(self,other,"DIA_Scatty_Maybe_01_01");	//Niech b�dzie, byle nie za d�ugo. Nie b�d� czeka� na rud� w niesko�czono��.
	Info_ClearChoices(dia_scatty_fletcher);
	scatty_maybefight = TRUE;
};


instance dia_scatty_remember(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_remember_condition;
	information = dia_scatty_remember_info;
	permanent = 0;
	description = "Przemy�la�em jeszcze raz t� spraw� z Fletcherem.";
};


func int dia_scatty_remember_condition()
{
	if((scatty_maybefight == TRUE) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_remember_info()
{
	AI_Output(other,self,"DIA_Scatty_Remember_15_00");	//Przemy�la�em jeszcze raz t� spraw� z Fletcherem.
	AI_Output(self,other,"DIA_Scatty_Remember_01_01");	//I?
	AI_Output(other,self,"DIA_Scatty_Remember_01_02");	//Przyjmuj� twoj� ofert�.
	AI_Output(self,other,"DIA_Scatty_Remember_01_03");	//�wietnie. Zajm� si� niezb�dnymi przygotowaniami. Pom�w z Gor Hanisem. On b�dzie twoim przeciwnikiem.
	AI_Output(self,other,"DIA_Scatty_Remember_01_04");	//Najlepiej b�dzie, je�li przed tym wtajemniczysz jeszcze w to wszystko Fletchera.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty da� mi szans� walczy� z Gor Hanisem, aby darowa� d�ugi Fletcherowi. Je�li wygram, Scatty pu�ci Fletcherowi to wszystko p�azem. Je�li za� przegram, Fletcher zmuszony b�dzie dop�aci� tak� sam� ilo�� rudy. Mo�e pierw powinienem powiedzie� wszystko Fletcherowi, czego si� dowiedzia�em.");
};


instance DIA_SCATTY_HANISSUCCESS(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanissuccess_condition;
	information = dia_scatty_hanissuccess_info;
	permanent = 0;
	description = "Walczy�em z Gor Hanisem!";
};


func int dia_scatty_hanissuccess_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((hanis_herausforderung == TRUE) && (fletcher_schulden == LOG_RUNNING) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_hanissuccess_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_HanisSuccess_15_00");	//Walczy�em z Gor Hanisem!
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_01");	//I pos�a� ci� do piachu...
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_02");	//Mo�esz ju� da� zna� Fletcherowi, �e wisi mi teraz podw�jn� sumk�.
		fletcher_schulden = LOG_FAILED;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_FAILED);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Przez moj� kl�sk� z Gor Hanisem, Fletcher b�dzie teraz musia� zap�aci� Scatty'emu podw�jn� sumk�. Co� mi si� zdaje, �e nie b�dzie zbytnio zadowolony z tego powodu...");
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//I pokona�e� go! Nie�le jak na kogo�, kto jest tu od niedawna. Powiedz Fletcherowi, �e mu daruj�.
		fletcher_schulden = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Uda�o mi si� pokona� Gor Hanisa w walce, dzi�ki czemu Fletcher jest teraz wolny od d�ug�w.");
		B_GiveXP(XP_HANISVICTORY);
	};
};


var int scatty_fightday;

instance dia_scatty_fightnow(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_fightnow_condition;
	information = dia_scatty_fightnow_info;
	permanent = 0;
	description = "Jestem ju� cz�onkiem obozu. Pozw�l mi walczy�.";
};


func int dia_scatty_fightnow_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_NOV) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_ORG) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GRD) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_STT) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_fightnow_info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_FightNow_15_00");	//Jestem ju� cz�onkiem obozu. Pozw�l mi walczy�.
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowPSI_01_01");	//Ach, wi�c zdecydowa�e� si� do��czy� do obozu na bagnie? Bosko. Gor Hanis jest jednym z naszych najlepszych wojownik�w.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Dobra, pozw�l, �e wyja�ni� ci pierw regu�y walki, kt�re musisz zna� jako wojownik na arenie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Pierwsza zasada, o kt�rej powiniene� wiedzie� - nie walczymy tu na �mier� i �ycie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Walka ko�czy si�, gdy jeden z walcz�cych padnie na ziemi�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Potrzebujemy wojownik�w do przysz�ych walk, wi�c czasem nie wpadnij na pomys�, �eby kogo� wys�a� na tamten �wiat, bo inaczej sam si� tam znajdziesz.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Warto te� wiedzie�, �e jako wojownik dostajesz rud� za ka�d� odbyt� walk�. Tylko wiesz, nie spodziewaj si� zbyt wiele, w ko�cu dostajesz z tego jedynie niewielk� cz��.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale nie przywi�zuj zbytnio do tego wagi. Wa�ne, �e zyskasz chwa�� i uznanie za ka�d� wygran� potyczk�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Przyjd� do mnie, je�li tylko b�dziesz chcia� walczy�, a porozmawiamy o twoim przeciwniku.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowOC_01_01");	//�wietnie. Jeszcze jeden got�w przela� krew za nasz ob�z. Przyjdzie czas, �e i ty dobierzesz si� do rzyci tym szumowinom z Nowego Obozu.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Dobra, pozw�l, �e wyja�ni� ci pierw regu�y walki, kt�re musisz zna� jako wojownik na arenie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Pierwsza zasada, o kt�rej powiniene� wiedzie� - nie walczymy tu na �mier� i �ycie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Walka ko�czy si�, gdy jeden z walcz�cych padnie na ziemi�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Potrzebujemy wojownik�w do przysz�ych walk, wi�c czasem nie wpadnij na pomys�, �eby kogo� wys�a� na tamten �wiat, bo inaczej sam si� tam znajdziesz.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Warto te� wiedzie�, �e jako wojownik dostajesz rud� za ka�d� odbyt� walk�. Tylko wiesz, nie spodziewaj si� zbyt wiele, w ko�cu dostajesz z tego jedynie niewielk� cz��.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale nie przywi�zuj zbytnio do tego wagi. Wa�ne, �e zyskasz chwa�� i uznanie za ka�d� wygran� potyczk�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Przyjd� do mnie, je�li tylko b�dziesz chcia� walczy�, a porozmawiamy o twoim przeciwniku.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowNC_01_01");	//Jeszcze jeden z Nowego Obozu? No, to ciekaw jestem na co ci� sta�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Dobra, pozw�l, �e wyja�ni� ci pierw regu�y walki, kt�re musisz zna� jako wojownik na arenie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Pierwsza zasada, o kt�rej powiniene� wiedzie� - nie walczymy tu na �mier� i �ycie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Walka ko�czy si�, gdy jeden z walcz�cych padnie na ziemi�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Potrzebujemy wojownik�w do przysz�ych walk, wi�c czasem nie wpadnij na pomys�, �eby kogo� wys�a� na tamten �wiat, bo inaczej sam si� tam znajdziesz.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Warto te� wiedzie�, �e jako wojownik dostajesz rud� za ka�d� odbyt� walk�. Tylko wiesz, nie spodziewaj si� zbyt wiele, w ko�cu dostajesz z tego jedynie niewielk� cz��.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale nie przywi�zuj zbytnio do tego wagi. Wa�ne, �e zyskasz chwa�� i uznanie za ka�d� wygran� potyczk�.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Przyjd� do mnie, je�li tylko b�dziesz chcia� walczy�, a porozmawiamy o twoim przeciwniku.
	};
};


var int kirgo_fight;
var int kharim_fight;
var int hanis_fight;

instance dia_scatty_fighter(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_fighter_condition;
	information = dia_scatty_fighter_info;
	permanent = 1;
	description = "Chcia�bym stoczy� walk� na arenie.";
};


func int dia_scatty_fighter_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_fightnow) && (hanis_bet != TRUE) && (kirgo_bet != TRUE) && (kharim_bet != TRUE) && (kirgo_fight != TRUE) && (kharim_fight != TRUE) && (hanis_fight != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_fighter_info()
{
	AI_Output(other,self,"DIA_Scatty_Fighter_15_00");	//Chcia�bym stoczy� walk� na arenie.
	if(scatty_fightday <= (Wld_GetDay() - 4))
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_01_01");	//W porz�dku. Pierw pogadajmy o twoim przeciwniku, na p�ac� przyjdzie czas p�niej.
		AI_Output(self,other,"DIA_Scatty_Fighter_01_02");	//Twoja nale�no�� uwarunkowana jest g��wnie od tego, kogo obierzesz sobie za przeciwnika.
		Info_ClearChoices(dia_scatty_fighter);
		Info_AddChoice(dia_scatty_fighter,"Chc� walczy� z Kirgo.",dia_scatty_fighter_kirgo);
		Info_AddChoice(dia_scatty_fighter,"Chc� walczy� z Kharimem.",dia_scatty_fighter_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(dia_scatty_fighter,"Chc� walczy� z Gor Hanisem.",dia_scatty_fighter_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_15_01");	//Przecie� teraz nikt nie walczy. Zagl�daj do mnie od czasu co czasu, a na pewno co� si� dla ciebie znajdzie.
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_fighter_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_15_00");	//Chc� walczy� z Kirgo.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_01");	//No dobra. Czyli stawka jest taka:
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_02");	//Je�li wygrasz walk�, 25 bry�ek jest twoje.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_03");	//Za� je�li przegrasz, nie dostajesz kompletnie nic. No, mo�e poza pogruchotan� szcz�k� w prezencie.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_04");	//Kirgo czeka ju� na ciebie na arenie. Powodzenia!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE");
	Npc_SetTarget(GRD_251_Kirgo,other);
	AI_StartState(GRD_251_Kirgo,ZS_Attack,1,"");
	Npc_ExchangeRoutine(GRD_251_Kirgo,"GUIDE");
	b_story_npcs_watchfight();
	kirgo_fight = TRUE;
	scatty_fightday = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
	};
	AI_StopProcessInfos(self);
};

func void dia_scatty_fighter_kharim()
{
	AI_Output(other,self,"DIA_Scatty_Kharim_15_00");	//Chc� walczy� z Kharimem.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_01");	//No dobra. Czyli stawka wychodzi tak:
	AI_Output(self,other,"DIA_Scatty_Kharim_01_02");	//Wygrasz walk�, 50 bry�ek w�druje do ciebie.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_03");	//Za� je�li przegrasz, nie dostajesz kompletnie nic. No, mo�e poza pogruchotan� szcz�k� w prezencie.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_04");	//Kharim czeka ju� na ciebie na arenie. Powodzenia!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE");
	Npc_SetTarget(Sld_729_Kharim,other);
	AI_StartState(Sld_729_Kharim,ZS_Attack,1,"");
	Npc_ExchangeRoutine(Sld_729_Kharim,"GUIDE");
	b_story_npcs_watchfight();
	kharim_fight = TRUE;
	scatty_fightday = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
	};
	AI_StopProcessInfos(self);
};

func void dia_scatty_fighter_hanis()
{
	AI_Output(other,self,"DIA_Scatty_Hanis_15_00");	//Chc� walczy� z Gor Hanisem.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_01");	//No i pi�knie. Je�li chodzi o niego, stawka wygl�da nastepuj�co:
	AI_Output(self,other,"DIA_Scatty_Hanis_01_02");	//Je�eli wygrasz walk�, 100 bry�ek rudy trafia do twojej kieszeni.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_03");	//Za� je�li przegrasz, nie dostajesz kompletnie nic. No, mo�e poza pogruchotan� szcz�k� w prezencie.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_04");	//Gor Hanis czeka ju� na ciebie na arenie. Powodzenia!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE");
	Npc_SetTarget(Tpl_1422_GorHanis,other);
	AI_StartState(Tpl_1422_GorHanis,ZS_Attack,1,"");
	Npc_ExchangeRoutine(Tpl_1422_GorHanis,"GUIDE");
	b_story_npcs_watchfight();
	hanis_fight = TRUE;
	scatty_fightday = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
	};
	AI_StopProcessInfos(self);
};


instance DIA_SCATTY_KIRGOFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_kirgofight_condition;
	information = dia_scatty_kirgofight_info;
	permanent = 1;
	description = "Walczy�em z Kirgo!";
};


func int dia_scatty_kirgofight_condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if(((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (kirgo_fight == TRUE)) || ((Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) && (kirgo_fight == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_kirgofight_info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoFight_15_00");	//Walczy�em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_01");	//Widzia�em, nie�le ci facjat� przerobi�...
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_02");	//Przykro mi, ale rozumiesz. Tylko zwyci�zcy dostaj� sw�j udzia� w rudzie.
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
		kirgo_fight = FALSE;
		AI_Teleport(Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kirgo,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_03");	//Pi�knie� mu si� dobra� do rzyci.
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_04");	//Zaprawd�, porywaj�ca walka. Masz tu sw�j udzia�.
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
		kirgo_fight = FALSE;
		AI_Teleport(Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kirgo,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,25);
		B_GiveInvItems(self,hero,ItMiNugget,25);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance DIA_SCATTY_KHARIMFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_kharimfight_condition;
	information = dia_scatty_kharimfight_info;
	permanent = 1;
	description = "Walczy�em z Kharimem!";
};


func int dia_scatty_kharimfight_condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if(((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (kharim_fight == TRUE)) || ((Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE) && (kharim_fight == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_kharimfight_info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KharimFight_15_00");	//Walczy�em z Kharimem!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_01");	//I jak wida� wybornie ci t� bu�k� przefasoli�.
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_02");	//W ka�dym razie twa ruda spoczywa teraz w kieszeni tego Najemnika.
		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
		kharim_fight = FALSE;
		AI_Teleport(Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kharim,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_03");	//Pokaza�e� mu, gdzie raki zimuj�!
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_04");	//Uwielbiam, kiedy sukinsyn z Nowego Obozu dostaje takie baty. Oto twoja ruda.
		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
		kharim_fight = FALSE;
		AI_Teleport(Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kharim,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,50);
		B_GiveInvItems(self,hero,ItMiNugget,50);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance DIA_SCATTY_HANISFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanisfight_condition;
	information = dia_scatty_hanisfight_info;
	permanent = 1;
	description = "Walczy�em z Gor Hanisem.";
};


func int dia_scatty_hanisfight_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if(((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (hanis_fight == TRUE)) || ((hanis.aivar[AIV_HASDEFEATEDSC] == TRUE) && (hanis_fight == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_hanisfight_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_HanisFight_15_00");	//Walczy�em z Gor Hanisem.
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_01");	//Ju� od dawien dawna nie widzia�em nikogo, kto by zebra� takie ci�gi.
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_02");	//No ale w sumie nie ma co si� dziwi�, mia�e� naprawd� twardy orzech do zgryzienia. Ruda oczywi�cie w�druje do niego.
		hanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		hanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		hanis_fight = FALSE;
		AI_Teleport(hanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(hanis,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//I pokona�e� go! Nie�le jak na kogo�, kto jest tu od niedawna. Powiedz Fletcherowi, �e mu daruj�.
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_04");	//A tutaj tw�j udzia�. Nale�y ci si�.
		hanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		hanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		hanis_fight = FALSE;
		AI_Teleport(hanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(hanis,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,100);
		B_GiveInvItems(self,hero,ItMiNugget,100);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance DIA_SCATTY_FIGHTSOVER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_fightsover_condition;
	information = dia_scatty_fightsover_info;
	permanent = 1;
	description = "Chcia�bym odebra� m�j wk�ad z zak�ad�w.";
};


func int dia_scatty_fightsover_condition()
{
	if(((hanis_bet == TRUE) && (arena_fight == FALSE)) || ((kirgo_bet == TRUE) && (arena_fight == FALSE)) || ((kharim_bet == TRUE) && (arena_fight == FALSE)))
	{
		return 1;
	};
};

func void dia_scatty_fightsover_info()
{
	AI_Output(other,self,"DIA_Scatty_FightsOver_15_00");	//Chcia�bym odebra� m�j wk�ad z zak�ad�w.
	if((hanis_bet == TRUE) && (Tpl_1422_GorHanis.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_11");	//Gor Hanis przegra� walk�, a to znaczy, �e nic dla ciebie nie ma.
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_02");	//W ci�gu najbli�szych kilku dni b�dzie nast�pna walka, tak �e mo�esz znowu spr�bowa� swojego szcz�cia.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		b_story_npcs_fightisover();
		kirgo_bet = FALSE;
		kharim_bet = FALSE;
		hanis_bet = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((hanis_bet == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_22");	//Gor Hanis wygra�, co znaczy, �e 150 bry�ek jest twoje.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_04");	//Tylko nie przepij wszystkiego od razu. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_05");	//W ci�gu najbli�szych kilku dni b�dzie nast�pna walka. Zapraszam wtedy ponownie do obstawiania.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		b_story_npcs_fightisover();
		kirgo_bet = FALSE;
		kharim_bet = FALSE;
		hanis_bet = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((kharim_bet == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_33");	//Kharim przegra� walk�, a to znaczy, �e nic dla ciebie nie ma.
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_02");	//W ci�gu najbli�szych kilku dni b�dzie nast�pna walka, tak �e mo�esz znowu spr�bowa� swojego szcz�cia.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		kirgo_bet = FALSE;
		kharim_bet = FALSE;
		hanis_bet = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((kharim_bet == TRUE) && (GRD_251_Kirgo.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_44");	//Kharim wygra�, co znaczy, �e 150 bry�ek jest twoje.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_04");	//Tylko nie przepij wszystkiego od razu. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_05");	//W ci�gu najbli�szych kilku dni b�dzie nast�pna walka. Zapraszam wtedy ponownie do obstawiania.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		kirgo_bet = FALSE;
		kharim_bet = FALSE;
		hanis_bet = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((kirgo_bet == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_55");	//Kirgo wygra�, co znaczy, �e 150 bry�ek jest twoje.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_04");	//Tylko nie przepij wszystkiego od razu. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_05");	//W ci�gu najbli�szych kilku dni b�dzie nast�pna walka. Zapraszam wtedy ponownie do obstawiania.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		kirgo_bet = FALSE;
		kharim_bet = FALSE;
		hanis_bet = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((kirgo_bet == TRUE) && (GRD_251_Kirgo.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_66");	//Kirgo przegra� walk�, a to znaczy, �e nic dla ciebie nie ma.
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_02");	//W ci�gu najbli�szych kilku dni b�dzie nast�pna walka, tak �e mo�esz znowu spr�bowa� swojego szcz�cia.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		kirgo_bet = FALSE;
		kharim_bet = FALSE;
		hanis_bet = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	};
};

