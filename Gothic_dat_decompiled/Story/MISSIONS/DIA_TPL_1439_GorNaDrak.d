
instance DIA_GorNaDrak_EXIT(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 999;
	condition = DIA_GorNaDrak_EXIT_Condition;
	information = DIA_GorNaDrak_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GorNaDrak_Greet(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Greet_Condition;
	information = DIA_GorNaDrak_Greet_Info;
	permanent = 0;
	description = "Cze��! Dok�d si� wybieracie?";
};


func int DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_Greet_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00");	//Cze��! Dok�d si� wybieracie?
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01");	//Zabieramy wydzielin� pe�zaczy zdobyt� przez naszych braci w Starej Kopalni do Cor Kaloma.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02");	//Codziennie udajemy si� do kopalni po now� porcj� wydzieliny.
};


instance DIA_GorNaDrak_WasSekret(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WasSekret_Condition;
	information = DIA_GorNaDrak_WasSekret_Info;
	permanent = 0;
	description = "Co to za wydzielina?";
};


func int DIA_GorNaDrak_WasSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00");	//Co to za wydzielina?
	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01");	//Pozyskujemy j� z wn�trzno�ci pe�zaczy. Przy odrobinie ostro�no�ci mo�na wyci�� ich gruczo�y jadowe.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gor Na Drak - Stra�nik �wi�tynny, kt�ry zawsze kr�ci si� mi�dzy Starym Obozem a obozem na bagnie - mo�e mnie nauczy� pozyskiwa� wydzielin� pe�zaczy.");
};


instance DIA_GorNaDrak_TeachMandibles(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_TeachMandibles_Condition;
	information = DIA_GorNaDrak_TeachMandibles_Info;
	permanent = 1;
	description = "Mo�esz mnie nauczy� pozyskiwa� wydzielin� pe�zaczy? (1 PN)";
};


func int DIA_GorNaDrak_TeachMandibles_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//Naucz mnie pozyskiwa� wydzielin� z wn�trzno�ci pe�zaczy.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01");	//Oczywi�cie! Natychmiast po zabiciu potwora wytnij jego gruczo�y jadowe. Tylko pod �adnym pozorem nie wolno ci ich uszkodzi�!
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Umiej�tno�� usuwania wn�trzno�ci pe�zaczy.");
		DIA_GorNaDrak_TeachMandibles.permanent = 0;
		PrintScreen("Nowa umiej�tno��: Wycinanie wn�trzno�ci pe�zaczy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_GorNaDrak_WhatFor(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WhatFor_Condition;
	information = DIA_GorNaDrak_WhatFor_Info;
	permanent = 0;
	description = "Po co Cor Kalomowi ta wydzielina?";
};


func int DIA_GorNaDrak_WhatFor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00");	//Po co Cor Kalomowi ta wydzielina?
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01");	//Z tego co wiem, przyrz�dza z nich nap�j, kt�ry zwi�ksza magiczne zdolno�ci Nowicjuszy.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02");	//Przygotowujemy si� teraz do wielkiego przyzwania, wi�c potrzebujemy jak najwi�cej tej wydzieliny.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03");	//Przy pomocy tego napoju Nowicjusze przywo�aj� �ni�cego.
};


instance DIA_GorNaDrak_Permanent(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Permanent_Condition;
	information = DIA_GorNaDrak_Permanent_Info;
	permanent = 1;
	description = "Czy macie ju� wystarczaj�co du�o napoju, by przywo�a� �ni�cego?";
};


func int DIA_GorNaDrak_Permanent_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WhatFor) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_Permanent_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00");	//Czy macie ju� wystarczaj�co du�o napoju, by przywo�a� �ni�cego?
	AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01");	//Niestety! Nasi my�liwi poluj� na pe�zacze dniem i noc�, ale wci�� nie mamy do�� wydzieliny.
};


instance TPL_1439_GORNADRAK_WELCOME(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	condition = tpl_1439_gornadrak_welcome_condition;
	information = tpl_1439_gornadrak_welcome_info;
	important = 1;
	permanent = 0;
};


func int tpl_1439_gornadrak_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void tpl_1439_gornadrak_welcome_info()
{
	AI_Output(self,other,"Tpl_1439_GorNaDrak_WELCOME_Info_08_01");	//Uda�o ci si� wst�pi� w szeregi Stra�y �wi�tynnej? Zdumiewaj�ce. Masz powody do dumy.
	AI_StopProcessInfos(self);
};

