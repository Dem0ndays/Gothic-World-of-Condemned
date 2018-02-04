
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
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//Niech Ogieñ rozœwietla twe ¿ycie!
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
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//Gdybyœ zosta³ ranny, uzdrowiê ciê.
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
	description = "Jestem ranny. Mo¿esz mi pomóc?";
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
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//Jestem ranny. Mo¿esz mi pomóc?
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"KDF_401_Damarok_LERNEN_Info_14_01");	//Mo¿esz mnie czegoœ nauczyæ?
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Damarok, alchemik Magów Ognia, mo¿e mnie poduczyæ w dziedzinie alchemii.");
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_02");	//Mogê ciê zaznajomiæ bli¿ej ze sztuk¹ alchemii.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_03");	//Istnieje ca³a masa chemicznych substancji, które maj¹ ró¿noraki wp³yw na cia³o i umys³.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_04");	//Mogê ciê w tym podszkoliæ, jeœli sobie tego ¿yczysz.
		lernen_darf = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_05");	//Szkolê jedynie magów Krêgu Ognia.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_06");	//Dopóki wiêc nie zdecydujesz siê s³u¿yæ Innosowi, nie masz co liczyæ na moj¹ pomoc.
	};
};


instance kdf_401_damarok_traenke(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_traenke_condition;
	information = kdf_401_damarok_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jakich mikstur móg³byœ nauczyæ mnie warzyæ?";
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
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Info_14_01");	//Jakich mikstur móg³byœ nauczyæ mnie warzyæ?
	AI_Output(self,other,"KDF_401_Damarok_Traenke_Info_14_02");	//Znam g³ównie receptury na eliksiry lecznicze i many.
	Info_ClearChoices(kdf_401_damarok_traenke);
	Info_AddChoice(kdf_401_damarok_traenke,DIALOG_BACK,kdf_401_damarok_traenke_back);
	if(knows_heilessenz == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja uzdrawiaj¹ca (Koszt: 1 PN)",kdf_401_damarok_traenke_health1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci¹g uzdrawiaj¹cy (Koszt: 2 PN)",kdf_401_damarok_traenke_health2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir uzdrawiaj¹cy (Koszt: 3 PN)",kdf_401_damarok_traenke_health3);
	};
	if(knows_manaessenz == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja magicznej energii (Koszt: 1 PN)",kdf_401_damarok_traenke_mana1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci¹g magicznej energii (Koszt: 2 PN)",kdf_401_damarok_traenke_mana2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir magicznej energii (Koszt: 3 PN)",kdf_401_damarok_traenke_mana3);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja ¿ycia (Koszt: 5 PN)",kdf_401_damarok_traenke_healthperma1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci¹g ¿ycia (Koszt: 8 PN)",kdf_401_damarok_traenke_healthperma2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == TRUE) && (knows_heilpermaelixier == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Eliksir ¿ycia (Koszt: 10 PN)",kdf_401_damarok_traenke_healthperma3);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Esencja ducha (Koszt: 5 PN)",kdf_401_damarok_traenke_manaperma1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Wyci¹g ducha (Koszt: 8 PN)",kdf_401_damarok_traenke_manaperma2);
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
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health1_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_heilessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja uzdrawiaj¹ca - 1x woda, 1x s³abe zio³a uzdrawiaj¹ce.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_health2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health2_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiejêtnoœæ: Wyci¹g uzdrawiaj¹cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_heilextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci¹g uzdrawiaj¹cy - 1x woda, 2x s³abe zio³a uzdrawiaj¹ce, 1x ziele lecznicze.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_health3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiejêtnoœæ: Eliksir uzdrawiaj¹cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_heilelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir uzdrawiaj¹cy - 1x woda, 2x zio³a lecznicze, 1x silne zio³a lecznicze.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana1_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_manaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja magicznej energii - 1x alkohol, 1x krucze ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana2_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiejêtnoœæ: Wyci¹g magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_manaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci¹g magicznej energii - 1x alkohol, 2x krucze ziele, 1x czarne ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana3_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiejêtnoœæ: Eliksir magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_manaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir magicznej energii - 1x alkohol, 2x czarne ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma1_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiejêtnoœæ: Esencja ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_manapermaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja ducha - 1x alkohol, 2x czarne ziele, 1x psianka.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma2_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiejêtnoœæ: Wyci¹g ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_manapermaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci¹g ducha - 1x alkohol, 2x czarne ziele, 2x psianka.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma3_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiejêtnoœæ: Eliksir ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_manapermaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir ducha - 1x alkohol, 3x czarne ziele, 2x kocianka.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma1_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiejêtnoœæ: Esencja ¿ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_heilpermaessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja ¿ycia - 1x woda, 2x silne zio³a lecznicze.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma2_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiejêtnoœæ: Wyci¹g ¿ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_heilpermaextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci¹g ¿ycia - 1x woda, 2x silne zio³a lecznicze, 1x orkowe ziele.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Co muszê zrobiæ?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiejêtnoœæ: Eliksir ¿ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_01");	//Na pocz¹tek musisz umieœciæ wszystkie sk³adniki w menzurce, a nastêpnie dolaæ do niej wody.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_02");	//Postaraj siê jedynie dopilnowaæ, aby zachowaæ w³aœciw¹ kolejnoœæ, a z alchemi¹ wnet bêdziesz za pan brat.
		knows_heilpermaelixier = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Eliksir ¿ycia - 1x woda, 3x silne zio³a lecznicze, 2x liœæ dêbu.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

