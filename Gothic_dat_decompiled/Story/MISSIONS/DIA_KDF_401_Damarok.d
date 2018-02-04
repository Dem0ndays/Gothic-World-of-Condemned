
instance KDF_401_Damarok_WELCOME(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_WELCOME_Condition;
	information = KDF_401_Damarok_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_WELCOME_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE) && Npc_KnowsInfo(hero,KDF_405_Torrez_BOOK) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_WELCOME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//Niech Ogie� roz�wietla twe �ycie!
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_Exit(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 999;
	condition = KDF_401_Damarok_Exit_Condition;
	information = KDF_401_Damarok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

func void KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_HEAL(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_HEAL_Condition;
	information = KDF_401_Damarok_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDF) && Npc_IsInRoutine(self,Rtn_start_401))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEAL_Info()
{
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//Gdyby� zosta� ranny, uzdrowi� ci�.
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_HEALINFO(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 100;
	condition = KDF_401_Damarok_HEALINFO_Condition;
	information = KDF_401_Damarok_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Jestem ranny. Mo�esz mi pom�c?";
};


func int KDF_401_Damarok_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//Jestem ranny. Mo�esz mi pom�c?
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02");	//W zdrowym ciele - zdrowy duch.
	Snd_Play("MFX_Heal_Cast");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};


var int lernen_darf;

instance KDF_401_DAMAROK_LERNEN(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_lernen_condition;
	information = kdf_401_damarok_lernen_info;
	important = 0;
	permanent = 1;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int kdf_401_damarok_lernen_condition()
{
	if(lernen_darf == FALSE)
	{
		return TRUE;
	};
};

func void kdf_401_damarok_lernen_info()
{
	AI_Output(other,self,"KDF_401_Damarok_LERNEN_Info_14_01");	//Mo�esz mnie czego� nauczy�?
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Damarok, alchemik Mag�w Ognia, mo�e mnie poduczy� w dziedzinie alchemii.");
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_02");	//Mog� ci� zaznajomi� bli�ej ze sztuk� alchemii.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_03");	//Istnieje ca�a masa chemicznych substancji, kt�re maj� r�noraki wp�yw na cia�o i umys�.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_04");	//Mog� ci� w tym podszkoli�, je�li sobie tego �yczysz.
		lernen_darf = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_05");	//Szkol� jedynie mag�w Kr�gu Ognia.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_06");	//Dop�ki wi�c nie zdecydujesz si� s�u�y� Innosowi, nie masz co liczy� na moj� pomoc.
	};
};


instance kdf_401_damarok_traenke(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_traenke_condition;
	information = kdf_401_damarok_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jakich mikstur m�g�by� nauczy� mnie warzy�?";
};


func int kdf_401_damarok_traenke_condition()
{
	if((lernen_darf == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_traenke_info()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Info_14_01");	//Jakich mikstur m�g�by� nauczy� mnie warzy�?
	AI_Output(self,other,"KDF_401_Damarok_Traenke_Info_14_02");	//Znam g��wnie receptury na eliksiry lecznicze i many.
	Info_ClearChoices(kdf_401_damarok_traenke);
	Info_AddChoice(kdf_401_damarok_traenke,DIALOG_BACK,kdf_401_damarok_traenke_back);
	if(knows_heilessenz == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja uzdrawiaj�ca (Koszt: 1 PN)",kdf_401_damarok_traenke_health1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci�g uzdrawiaj�cy (Koszt: 2 PN)",kdf_401_damarok_traenke_health2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir uzdrawiaj�cy (Koszt: 3 PN)",kdf_401_damarok_traenke_health3);
	};
	if(knows_manaessenz == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja magicznej energii (Koszt: 1 PN)",kdf_401_damarok_traenke_mana1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci�g magicznej energii (Koszt: 2 PN)",kdf_401_damarok_traenke_mana2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir magicznej energii (Koszt: 3 PN)",kdf_401_damarok_traenke_mana3);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja �ycia (Koszt: 5 PN)",kdf_401_damarok_traenke_healthperma1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci�g �ycia (Koszt: 8 PN)",kdf_401_damarok_traenke_healthperma2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == TRUE) && (knows_heilpermaelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir �ycia (Koszt: 10 PN)",kdf_401_damarok_traenke_healthperma3);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja ducha (Koszt: 5 PN)",kdf_401_damarok_traenke_manaperma1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci�g ducha (Koszt: 8 PN)",kdf_401_damarok_traenke_manaperma2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == TRUE) && (knows_manapermaelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir ducha (Koszt: 10 PN)",kdf_401_damarok_traenke_manaperma3);
	};
};

func void kdf_401_damarok_traenke_back()
{
	Info_ClearChoices(kdf_401_damarok_traenke);
};

func void kdf_401_damarok_traenke_health1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_heilessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja uzdrawiaj�ca - 1x woda, 1x s�abe zio�a uzdrawiaj�ce.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_health2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiej�tno��: Wyci�g uzdrawiaj�cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_heilextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g uzdrawiaj�cy - 1x woda, 2x s�abe zio�a uzdrawiaj�ce, 1x ziele lecznicze.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_health3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiej�tno��: Eliksir uzdrawiaj�cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_heilelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir uzdrawiaj�cy - 1x woda, 2x zio�a lecznicze, 1x silne zio�a lecznicze.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_manaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja magicznej energii - 1x alkohol, 1x krucze ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiej�tno��: Wyci�g magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_manaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g magicznej energii - 1x alkohol, 2x krucze ziele, 1x czarne ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiej�tno��: Eliksir magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_manaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir magicznej energii - 1x alkohol, 2x czarne ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_manapermaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja ducha - 1x alkohol, 2x czarne ziele, 1x psianka.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_manapermaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g ducha - 1x alkohol, 2x czarne ziele, 2x psianka.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdf_401_damarok_traenke_healthperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_heilpermaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja �ycia - 1x woda, 2x silne zio�a lecznicze.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_heilpermaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g �ycia - 1x woda, 2x silne zio�a lecznicze, 1x orkowe ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

