
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
	description = "Czym siê tutaj zajmujesz?";
};


func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//Czym siê tutaj zajmujesz?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//Organizujê walki na arenie. Przyjmujê zak³ady, pozyskujê nowych wojowników... No wiesz.
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
	description = "Chcê do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?";
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
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//Chcê do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//Pomogê ci, jeœli zrobisz na mnie odpowiednio dobre wra¿enie.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//Najlepsi wojownicy z wszystkich obozów przybywaj¹ tutaj, by stan¹æ w szranki na mojej arenie.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//Wyzwij któregoœ z nich na pojedynek. Zobaczê, co potrafisz, i jeœli mi siê spodoba, mo¿e szepnê s³ówko w twoim imieniu.
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
	B_LogEntry(CH1_JoinOC,"Scatty, organizator walk na arenie, chcia³by zobaczyæ, jak sobie poradzê w starciu z którymœ z jego wojowników.");
};


instance DIA_Scatty_KirgoSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
	description = "Walczy³em z Kirgo!";
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
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//Walczy³em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//Tak, ale przegra³eœ!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//Chyba nie myœlisz, ¿e bêdê pod wra¿eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		B_LogEntry(CH1_JoinOC,"Pora¿ka w walce z Kirgo nie zjedna³a mi bynajmniej sympatii Scatty'ego.");
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//I pokona³eœ go! Ca³kiem nieŸle jak na takiego ¿ó³todzioba! Jestem pod wra¿eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Scatty by³ pod wra¿eniem mojej walki z Kirgo.");
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
	description = "Wyzwa³em Kharima na pojedynek!";
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
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//Wyzwa³em Kharima na pojedynek!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//I spuœci³ ci niez³e baty!
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//Ale muszê przyznaæ, ¿e wybra³eœ sobie dobrego przeciwnika. Nie znoszê tych sukinsynów z Nowego Obozu.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//Widzê, ¿e myœlimy podobnie. Przyda siê nam ktoœ taki jak ty!
		};
		Scatty_ChargeKharim = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry(CH1_JoinOC,"Zosta³em pokonany przez Kharima! Scatty podziwia moj¹ odwagê, ale uwa¿a, ¿e wojownik ze mnie ¿aden.");
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//I pokona³eœ go! Muszê przyznaæ, ¿e œwietnie sobie poradzi³eœ. Kharim od dawna uchodzi³ za jednego z najlepszych wojowników w kolonii.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//Jestem pod wra¿eniem!
		Scatty_ChargeKharim = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Pokaza³em Kharimowi, gdzie raki zimuj¹. Scatty by³ pod wra¿eniem.");
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
	description = "Myœla³em, ¿e Stary i Nowy Obóz nie dogaduj¹ siê najlepiej.";
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
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//Myœla³em, ¿e Stary i Nowy Obóz nie dogaduj¹ siê najlepiej. Dlaczego pozwalacie obcym walczyæ na waszej arenie?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi¹ patrzeæ, jak Szkodniki z Nowego Obozu dostaj¹ po g³owie.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//Gdy walczy któryœ z nich przyjmujê wiêcej zak³adów, a to dobrze wp³ywa na interes!
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//Osobiœcie nienawidzê tych wieprzy z Nowego Obozu, ale w tych trudnych czasach ¿aden pieni¹dz nie œmierdzi...
};


var int scatty_betday;

instance DIA_Scatty_WannaBet(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "Chcia³bym obstawiæ walkê.";
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
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Chcia³bym obstawiæ walkê.
	if((scatty_betday <= (Wld_GetDay() - 7)) && Wld_IsTime(18,0,23,0))
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_11");	//Œwietnie. Dziœ wszyscy wojownicy walcz¹ na arenie. Mo¿esz zatem wybraæ, na kogo chcesz zaryzykowaæ.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_12");	//Masz prawo postawiæ 75 bry³ek, tak jak ca³a reszta. Bez wyj¹tków, taka kwota zak³adów obowi¹zuje ka¿dego.
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
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_01");	//Przecie¿ teraz nikt nie walczy!
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_02");	//Najbli¿sza walka odbêdzie siê dopiero za kilka dni. Bêdzie og³oszenie!
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_03");	//Zak³ady przyjmujê jedynie miêdzy godzin¹ 18 a 23.
	};
};

func void dia_scatty_wannabet_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_WannaBet_15_00");	//Stawiam na Kirgo.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_01");	//Dobrze. Kirgo wprawdzie d³ugo u nas nie zabawi³, ale robi ch³opak du¿e postêpy.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_02");	//Jeœli wygra Kirgo, czeka na ciebie 150 bry³ek. Zaœ jeœli nie, zatrzymam sobie dla siebie twoje wpisowe i zostajesz z niczym.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_04");	//Ruszaj na trybuny ku pozosta³ym widzom i rozkoszuj siê walk¹.
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
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_05");	//Nie widzê tu ¿adnych 75 bry³ek. Znasz zasady - nie ma rudy, nie ma walki.
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
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_01");	//Na Kharima? No dobra, w koñcu to dobry wojownik, chocia¿ jest z Nowego Obozu...
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_02");	//Jeœli wygra Kharim, czeka na ciebie 150 bry³ek. Zaœ jeœli nie, zatrzymam sobie dla siebie twoje wpisowe i zostajesz z niczym.
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_04");	//Ruszaj na trybuny ku pozosta³ym widzom i rozkoszuj siê walk¹.
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
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_05");	//Nie widzê tu ¿adnych 75 bry³ek. Znasz zasady - nie ma rudy, nie ma walki.
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
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_01");	//Tego Sekciarza? To dobry wojownik i wygra³ ju¿ naprawdê wiele walk.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_02");	//Jeœli wygra Gor Hanis, czeka na ciebie 150 bry³ek. Zaœ jeœli nie, zatrzymam sobie dla siebie twoje wpisowe i zostajesz z niczym.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_04");	//Ruszaj na trybuny ku pozosta³ym widzom i rozkoszuj siê walk¹.
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
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_05");	//Nie widzê tu ¿adnych 75 bry³ek. Znasz zasady - nie ma rudy, nie ma walki.
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
	description = "Chcia³bym stoczyæ walkê na arenie.";
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
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//Chcia³bym stoczyæ walkê na arenie.
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//Nie mogê ci pozwoliæ walczyæ, póki nie do³¹czysz do któregoœ z obozów.
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//Ludzi nie interesuj¹ niezale¿ni wojownicy.
};


instance DIA_Scatty_TRAIN(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
	description = "Zajmujesz siê równie¿ szkoleniem wojowników?";
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
		B_LogEntry(GE_TeacherOC,"Scatty mo¿e mnie nauczyæ walki jednorêcznym orê¿em.");
		log_scattytrain = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//Zajmujesz siê równie¿ szkoleniem wojowników?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//Tak, ale nie za darmo. Jak chcesz, ¿ebym ciê czegoœ nauczy³, musisz zap³aciæ.
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
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//M¹dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneœ nauczyæ siê prawid³owo trzymaæ orê¿ w rêku.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
			B_GiveInvItems(other,self,ItMiNugget,50);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//Nie masz wystarczaj¹cej iloœci rudy!
	};
};

func void dia_scatty_train_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if(Npc_HasItems(other,ItMiNugget) >= 150)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//Dobrze, podstawy ju¿ znasz. Nieznaczne opuszczenie broni zwiêkszy si³ê twojego pierwszego ciosu.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
			B_GiveInvItems(other,self,ItMiNugget,150);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
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
	description = "Fletcher ma u ciebie jakieœ d³ugi?";
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
	AI_Output(other,self,"DIA_Scatty_Fletcher_15_00");	//Fletcher ma u ciebie jakieœ d³ugi?
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_01");	//Tak ci powiedzia³? Ale prawda, i to wcale nie takie ma³e d³ugi.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_02");	//A tobie co do tego?
	AI_Output(other,self,"DIA_Scatty_Fletcher_01_03");	//Chcê mu pomóc.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_04");	//Aha, wiêc tak siê sprawy maj¹.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_05");	//No dobra. Myœlê, ¿e mogê ci z³o¿yæ pewn¹ propozycjê.
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"Jak¹ propozycjê?",dia_scatty_fletcher_idea);
};

func void dia_scatty_fletcher_idea()
{
	AI_Output(other,self,"DIA_Scatty_Idea_15_00");	//Jak¹ propozycjê?
	AI_Output(self,other,"DIA_Scatty_Idea_01_01");	//Walcz za Fletchera na arenie.
	AI_Output(self,other,"DIA_Scatty_Idea_01_02");	//Wygrasz walkê, to darujê Fletcherowi jego zobowi¹zania.
	AI_Output(self,other,"DIA_Scatty_Idea_01_03");	//Zaœ jeœli przegrasz, Fletcher bêdzie zmuszony zap³aciæ jeszcze wiêksz¹, podwójn¹ sumkê.
	AI_Output(self,other,"DIA_Scatty_Idea_01_04");	//Co ty na to?
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"No dobra, chyba i tak nie mam wyboru.",dia_scatty_fletcher_okay);
	Info_AddChoice(dia_scatty_fletcher,"Zastanowiê siê nad tym.",dia_scatty_fletcher_maybe);
};

func void dia_scatty_fletcher_okay()
{
	AI_Output(other,self,"DIA_Scatty_Okay_15_00");	//No dobra, chyba i tak nie mam wyboru.
	AI_Output(self,other,"DIA_Scatty_Okay_01_01");	//Wspaniale. Zajmê siê wszystkimi niezbêdnymi przygotowaniami do walki.
	AI_Output(self,other,"DIA_Scatty_Okay_01_02");	//Pomów z Gor Hanisem. On bêdzie twoim przeciwnikiem.
	AI_Output(self,other,"DIA_Scatty_Okay_01_03");	//Powinieneœ jednak jeszcze przed tym porozmawiaæ na ten temat z Fletcherem. Te¿ chcia³by pewnie zostaæ wtajemniczony w tê sprawê.
	Info_ClearChoices(dia_scatty_fletcher);
	scatty_idoit = TRUE;
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty da³ mi szansê walczyæ z Gor Hanisem, aby darowaæ d³ugi Fletcherowi. Jeœli wygram, Scatty puœci Fletcherowi to wszystko p³azem. Jeœli zaœ przegram, Fletcher zmuszony bêdzie dop³aciæ tak¹ sam¹ iloœæ rudy. Mo¿e pierw powinienem powiedzieæ wszystko Fletcherowi, czego siê dowiedzia³em.");
};

func void dia_scatty_fletcher_maybe()
{
	AI_Output(other,self,"DIA_Scatty_Maybe_15_00");	//Zastanowiê siê nad tym.
	AI_Output(self,other,"DIA_Scatty_Maybe_01_01");	//Niech bêdzie, byle nie za d³ugo. Nie bêdê czeka³ na rudê w nieskoñczonoœæ.
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
	description = "Przemyœla³em jeszcze raz tê sprawê z Fletcherem.";
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
	AI_Output(other,self,"DIA_Scatty_Remember_15_00");	//Przemyœla³em jeszcze raz tê sprawê z Fletcherem.
	AI_Output(self,other,"DIA_Scatty_Remember_01_01");	//I?
	AI_Output(other,self,"DIA_Scatty_Remember_01_02");	//Przyjmujê twoj¹ ofertê.
	AI_Output(self,other,"DIA_Scatty_Remember_01_03");	//Œwietnie. Zajmê siê niezbêdnymi przygotowaniami. Pomów z Gor Hanisem. On bêdzie twoim przeciwnikiem.
	AI_Output(self,other,"DIA_Scatty_Remember_01_04");	//Najlepiej bêdzie, jeœli przed tym wtajemniczysz jeszcze w to wszystko Fletchera.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty da³ mi szansê walczyæ z Gor Hanisem, aby darowaæ d³ugi Fletcherowi. Jeœli wygram, Scatty puœci Fletcherowi to wszystko p³azem. Jeœli zaœ przegram, Fletcher zmuszony bêdzie dop³aciæ tak¹ sam¹ iloœæ rudy. Mo¿e pierw powinienem powiedzieæ wszystko Fletcherowi, czego siê dowiedzia³em.");
};


instance DIA_SCATTY_HANISSUCCESS(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanissuccess_condition;
	information = dia_scatty_hanissuccess_info;
	permanent = 0;
	description = "Walczy³em z Gor Hanisem!";
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
	AI_Output(other,self,"DIA_Scatty_HanisSuccess_15_00");	//Walczy³em z Gor Hanisem!
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_01");	//I pos³a³ ciê do piachu...
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_02");	//Mo¿esz ju¿ daæ znaæ Fletcherowi, ¿e wisi mi teraz podwójn¹ sumkê.
		fletcher_schulden = LOG_FAILED;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_FAILED);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Przez moj¹ klêskê z Gor Hanisem, Fletcher bêdzie teraz musia³ zap³aciæ Scatty'emu podwójn¹ sumkê. Coœ mi siê zdaje, ¿e nie bêdzie zbytnio zadowolony z tego powodu...");
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//I pokona³eœ go! NieŸle jak na kogoœ, kto jest tu od niedawna. Powiedz Fletcherowi, ¿e mu darujê.
		fletcher_schulden = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Uda³o mi siê pokonaæ Gor Hanisa w walce, dziêki czemu Fletcher jest teraz wolny od d³ugów.");
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
	description = "Jestem ju¿ cz³onkiem obozu. Pozwól mi walczyæ.";
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
	AI_Output(other,self,"DIA_Scatty_FightNow_15_00");	//Jestem ju¿ cz³onkiem obozu. Pozwól mi walczyæ.
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
		AI_Output(self,other,"DIA_Scatty_FightNowPSI_01_01");	//Ach, wiêc zdecydowa³eœ siê do³¹czyæ do obozu na bagnie? Bosko. Gor Hanis jest jednym z naszych najlepszych wojowników.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Dobra, pozwól, ¿e wyjaœniê ci pierw regu³y walki, które musisz znaæ jako wojownik na arenie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Pierwsza zasada, o której powinieneœ wiedzieæ - nie walczymy tu na œmieræ i ¿ycie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Walka koñczy siê, gdy jeden z walcz¹cych padnie na ziemiê.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Potrzebujemy wojowników do przysz³ych walk, wiêc czasem nie wpadnij na pomys³, ¿eby kogoœ wys³aæ na tamten œwiat, bo inaczej sam siê tam znajdziesz.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Warto te¿ wiedzieæ, ¿e jako wojownik dostajesz rudê za ka¿d¹ odbyt¹ walkê. Tylko wiesz, nie spodziewaj siê zbyt wiele, w koñcu dostajesz z tego jedynie niewielk¹ czêœæ.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale nie przywi¹zuj zbytnio do tego wagi. Wa¿ne, ¿e zyskasz chwa³ê i uznanie za ka¿d¹ wygran¹ potyczkê.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//PrzyjdŸ do mnie, jeœli tylko bêdziesz chcia³ walczyæ, a porozmawiamy o twoim przeciwniku.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowOC_01_01");	//Œwietnie. Jeszcze jeden gotów przelaæ krew za nasz obóz. Przyjdzie czas, ¿e i ty dobierzesz siê do rzyci tym szumowinom z Nowego Obozu.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Dobra, pozwól, ¿e wyjaœniê ci pierw regu³y walki, które musisz znaæ jako wojownik na arenie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Pierwsza zasada, o której powinieneœ wiedzieæ - nie walczymy tu na œmieræ i ¿ycie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Walka koñczy siê, gdy jeden z walcz¹cych padnie na ziemiê.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Potrzebujemy wojowników do przysz³ych walk, wiêc czasem nie wpadnij na pomys³, ¿eby kogoœ wys³aæ na tamten œwiat, bo inaczej sam siê tam znajdziesz.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Warto te¿ wiedzieæ, ¿e jako wojownik dostajesz rudê za ka¿d¹ odbyt¹ walkê. Tylko wiesz, nie spodziewaj siê zbyt wiele, w koñcu dostajesz z tego jedynie niewielk¹ czêœæ.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale nie przywi¹zuj zbytnio do tego wagi. Wa¿ne, ¿e zyskasz chwa³ê i uznanie za ka¿d¹ wygran¹ potyczkê.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//PrzyjdŸ do mnie, jeœli tylko bêdziesz chcia³ walczyæ, a porozmawiamy o twoim przeciwniku.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowNC_01_01");	//Jeszcze jeden z Nowego Obozu? No, to ciekaw jestem na co ciê staæ.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Dobra, pozwól, ¿e wyjaœniê ci pierw regu³y walki, które musisz znaæ jako wojownik na arenie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Pierwsza zasada, o której powinieneœ wiedzieæ - nie walczymy tu na œmieræ i ¿ycie.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Walka koñczy siê, gdy jeden z walcz¹cych padnie na ziemiê.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Potrzebujemy wojowników do przysz³ych walk, wiêc czasem nie wpadnij na pomys³, ¿eby kogoœ wys³aæ na tamten œwiat, bo inaczej sam siê tam znajdziesz.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Warto te¿ wiedzieæ, ¿e jako wojownik dostajesz rudê za ka¿d¹ odbyt¹ walkê. Tylko wiesz, nie spodziewaj siê zbyt wiele, w koñcu dostajesz z tego jedynie niewielk¹ czêœæ.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Ale nie przywi¹zuj zbytnio do tego wagi. Wa¿ne, ¿e zyskasz chwa³ê i uznanie za ka¿d¹ wygran¹ potyczkê.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//PrzyjdŸ do mnie, jeœli tylko bêdziesz chcia³ walczyæ, a porozmawiamy o twoim przeciwniku.
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
	description = "Chcia³bym stoczyæ walkê na arenie.";
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
	AI_Output(other,self,"DIA_Scatty_Fighter_15_00");	//Chcia³bym stoczyæ walkê na arenie.
	if(scatty_fightday <= (Wld_GetDay() - 4))
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_01_01");	//W porz¹dku. Pierw pogadajmy o twoim przeciwniku, na p³acê przyjdzie czas póŸniej.
		AI_Output(self,other,"DIA_Scatty_Fighter_01_02");	//Twoja nale¿noœæ uwarunkowana jest g³ównie od tego, kogo obierzesz sobie za przeciwnika.
		Info_ClearChoices(dia_scatty_fighter);
		Info_AddChoice(dia_scatty_fighter,"Chcê walczyæ z Kirgo.",dia_scatty_fighter_kirgo);
		Info_AddChoice(dia_scatty_fighter,"Chcê walczyæ z Kharimem.",dia_scatty_fighter_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(dia_scatty_fighter,"Chcê walczyæ z Gor Hanisem.",dia_scatty_fighter_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_15_01");	//Przecie¿ teraz nikt nie walczy. Zagl¹daj do mnie od czasu co czasu, a na pewno coœ siê dla ciebie znajdzie.
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_fighter_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_15_00");	//Chcê walczyæ z Kirgo.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_01");	//No dobra. Czyli stawka jest taka:
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_02");	//Jeœli wygrasz walkê, 25 bry³ek jest twoje.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_03");	//Zaœ jeœli przegrasz, nie dostajesz kompletnie nic. No, mo¿e poza pogruchotan¹ szczêk¹ w prezencie.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_04");	//Kirgo czeka ju¿ na ciebie na arenie. Powodzenia!
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
	AI_Output(other,self,"DIA_Scatty_Kharim_15_00");	//Chcê walczyæ z Kharimem.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_01");	//No dobra. Czyli stawka wychodzi tak:
	AI_Output(self,other,"DIA_Scatty_Kharim_01_02");	//Wygrasz walkê, 50 bry³ek wêdruje do ciebie.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_03");	//Zaœ jeœli przegrasz, nie dostajesz kompletnie nic. No, mo¿e poza pogruchotan¹ szczêk¹ w prezencie.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_04");	//Kharim czeka ju¿ na ciebie na arenie. Powodzenia!
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
	AI_Output(other,self,"DIA_Scatty_Hanis_15_00");	//Chcê walczyæ z Gor Hanisem.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_01");	//No i piêknie. Jeœli chodzi o niego, stawka wygl¹da nastepuj¹co:
	AI_Output(self,other,"DIA_Scatty_Hanis_01_02");	//Je¿eli wygrasz walkê, 100 bry³ek rudy trafia do twojej kieszeni.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_03");	//Zaœ jeœli przegrasz, nie dostajesz kompletnie nic. No, mo¿e poza pogruchotan¹ szczêk¹ w prezencie.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_04");	//Gor Hanis czeka ju¿ na ciebie na arenie. Powodzenia!
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
	description = "Walczy³em z Kirgo!";
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
	AI_Output(other,self,"DIA_Scatty_KirgoFight_15_00");	//Walczy³em z Kirgo!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_01");	//Widzia³em, nieŸle ci facjatê przerobi³...
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_02");	//Przykro mi, ale rozumiesz. Tylko zwyciêzcy dostaj¹ swój udzia³ w rudzie.
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
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_03");	//Piêknieœ mu siê dobra³ do rzyci.
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_04");	//Zaprawdê, porywaj¹ca walka. Masz tu swój udzia³.
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
	description = "Walczy³em z Kharimem!";
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
	AI_Output(other,self,"DIA_Scatty_KharimFight_15_00");	//Walczy³em z Kharimem!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_01");	//I jak widaæ wybornie ci tê buŸkê przefasoli³.
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_02");	//W ka¿dym razie twa ruda spoczywa teraz w kieszeni tego Najemnika.
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
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_03");	//Pokaza³eœ mu, gdzie raki zimuj¹!
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
	description = "Walczy³em z Gor Hanisem.";
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
	AI_Output(other,self,"DIA_Scatty_HanisFight_15_00");	//Walczy³em z Gor Hanisem.
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_01");	//Ju¿ od dawien dawna nie widzia³em nikogo, kto by zebra³ takie ciêgi.
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_02");	//No ale w sumie nie ma co siê dziwiæ, mia³eœ naprawdê twardy orzech do zgryzienia. Ruda oczywiœcie wêdruje do niego.
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
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//I pokona³eœ go! NieŸle jak na kogoœ, kto jest tu od niedawna. Powiedz Fletcherowi, ¿e mu darujê.
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_04");	//A tutaj twój udzia³. Nale¿y ci siê.
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
	description = "Chcia³bym odebraæ mój wk³ad z zak³adów.";
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
	AI_Output(other,self,"DIA_Scatty_FightsOver_15_00");	//Chcia³bym odebraæ mój wk³ad z zak³adów.
	if((hanis_bet == TRUE) && (Tpl_1422_GorHanis.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_11");	//Gor Hanis przegra³ walkê, a to znaczy, ¿e nic dla ciebie nie ma.
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_02");	//W ci¹gu najbli¿szych kilku dni bêdzie nastêpna walka, tak ¿e mo¿esz znowu spróbowaæ swojego szczêœcia.
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
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_22");	//Gor Hanis wygra³, co znaczy, ¿e 150 bry³ek jest twoje.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_04");	//Tylko nie przepij wszystkiego od razu. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_05");	//W ci¹gu najbli¿szych kilku dni bêdzie nastêpna walka. Zapraszam wtedy ponownie do obstawiania.
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
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_33");	//Kharim przegra³ walkê, a to znaczy, ¿e nic dla ciebie nie ma.
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_02");	//W ci¹gu najbli¿szych kilku dni bêdzie nastêpna walka, tak ¿e mo¿esz znowu spróbowaæ swojego szczêœcia.
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
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_44");	//Kharim wygra³, co znaczy, ¿e 150 bry³ek jest twoje.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_04");	//Tylko nie przepij wszystkiego od razu. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_05");	//W ci¹gu najbli¿szych kilku dni bêdzie nastêpna walka. Zapraszam wtedy ponownie do obstawiania.
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
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_55");	//Kirgo wygra³, co znaczy, ¿e 150 bry³ek jest twoje.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_04");	//Tylko nie przepij wszystkiego od razu. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_05");	//W ci¹gu najbli¿szych kilku dni bêdzie nastêpna walka. Zapraszam wtedy ponownie do obstawiania.
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
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_66");	//Kirgo przegra³ walkê, a to znaczy, ¿e nic dla ciebie nie ma.
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_02");	//W ci¹gu najbli¿szych kilku dni bêdzie nastêpna walka, tak ¿e mo¿esz znowu spróbowaæ swojego szczêœcia.
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

