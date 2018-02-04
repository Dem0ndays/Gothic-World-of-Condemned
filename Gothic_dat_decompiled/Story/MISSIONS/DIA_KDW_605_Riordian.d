
instance Info_Riordian_EXIT(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 999;
	condition = Info_Riordian_EXIT_Condition;
	information = Info_Riordian_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneThunderball))
	{
		CreateInvItem(self,ItArRuneThunderball);
	};
};


instance Info_Riordian_NEWS(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_NEWS_Condition;
	information = Info_Riordian_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "Przysy�a mnie Saturas.";
};


func int Info_Riordian_NEWS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_OFFER) && Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void Info_Riordian_NEWS_Info()
{
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//Przysy�a mnie Saturas.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//Ach, chod� bli�ej. Ju� mi o wszystkim doniesiono.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//Prosz�, we� to. Znajdziesz tu najr�niejsze wywary.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//Teraz mo�esz ju� rusza� na poszukiwanie kamieni ogniskuj�cych. Jeste� nasz� jedyn� nadziej�.
	CreateInvItems(self,ItFo_Potion_Health_01,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_01,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01,15);
	CreateInvItems(hero,ItFo_Potion_Mana_01,5);
	CreateInvItems(hero,ItFo_Potion_Health_02,2);
	CreateInvItems(hero,ItFo_Potion_Mana_02,2);
	CreateInvItems(hero,ItFo_Potion_Health_03,1);
	CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	CreateInvItems(hero,ItFo_Potion_Haste_02,2);
	CreateInvItems(hero,ItFo_Potion_Strength_01,1);
	CreateInvItems(hero,ItFo_Potion_Dex_01,1);
};


instance Info_Riordian_REWARD(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_REWARD_Condition;
	information = Info_Riordian_REWARD_Info;
	permanent = 0;
	important = 0;
	description = "Saturas powiedzia�, �e masz dla mnie nagrod�.";
};


func int Info_Riordian_REWARD_Condition()
{
	if(Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Riordian_REWARD_Info()
{
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//Saturas powiedzia�, �e masz dla mnie nagrod�.
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//Ach, chod�, chod�!
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//Nasz przyw�dca opowiedzia� mi o twoich bohaterskich czynach.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//Ca�y nasz ob�z... Ach, co ja m�wi� - ca�a KOLONIA powinna ci by� dozgonnie wdzi�czna.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//Przyjmij t� skromn� nagrod� w uznaniu twoich zas�ug.
	CreateInvItems(self,ItFo_Potion_Health_02,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_02,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_02,15);
	CreateInvItems(hero,ItFo_Potion_Mana_02,5);
	CreateInvItems(hero,ItFo_Potion_Health_03,2);
	CreateInvItems(hero,ItFo_Potion_Mana_03,2);
	CreateInvItems(hero,ItFo_Potion_Haste_02,3);
	CreateInvItems(hero,ItFo_Potion_Master_01,1);
	CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
	CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
	B_LogEntry(CH3_BringFoci,"Riordian by� jak zwykle uprzejmy. Otrzyma�em od niego zapas magicznych wywar�w. To niezwykle cenny i przydatny dar.");
	if(Npc_KnowsInfo(hero,Info_Cronos_REWARD))
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
};


instance Info_Riordian_MESSAGE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGE_Condition;
	information = Info_Riordian_MESSAGE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Riordian_MESSAGE_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredFreeMine)
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGE_Info()
{
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//Ciesz� si�, �e ju� jeste�. Czeka�em na ciebie!
};


instance Info_Riordian_MESSAGEWHY(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGEWHY_Condition;
	information = Info_Riordian_MESSAGEWHY_Info;
	permanent = 0;
	important = 0;
	description = "Czeka�e�? Jak to?";
};


func int Info_Riordian_MESSAGEWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//Czeka�e�? Jak to?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//Gorn prosi� mnie, �ebym ci� do niego przys�a�, gdy tylko si� zjawisz.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//O co chodzi?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//Ma plan, jak odzyska� zaj�t� kopalni�.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//Czy wci�� pilnuje wej�cia do kopalni?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//Tak! Prosz�, zajrzyj do niego mo�liwie jak najszybciej!
};


instance KDW_605_Riordian_WELCOME(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_WELCOME_Condition;
	information = KDW_605_Riordian_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_WELCOME_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//Ciesz� si�, �e do nas do��czy�e�.
};


instance KDW_605_Riordian_HEAL(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_HEAL_Condition;
	information = KDW_605_Riordian_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEAL_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//Je�li jeste� ranny, mog� ci pom�c.
};


instance KDW_605_Riordian_HEALINFO(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 100;
	condition = KDW_605_Riordian_HEALINFO_Condition;
	information = KDW_605_Riordian_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Jestem ranny. Mo�esz co� na to poradzi�?";
};


func int KDW_605_Riordian_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//Jestem ranny. Mo�esz co� na to poradzi�?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//Tymi s�owy przywo�uj� uzdrawiaj�c� si��! Niech twe cia�o i duch zn�w zaznaj� spokoju!
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
};


instance KDW_605_Riordian_GREET(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_GREET_Condition;
	information = KDW_605_Riordian_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Witaj, magu!";
};


func int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

func void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//Witaj, magu!
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//Jestem Riordian, alchemik. Zgaduj�, �e szukasz magicznego napoju?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Riordian, jeden z Mag�w Wody, sprzedaje magiczne wywary. Znajd� go w laboratorium alchemicznym, na g�rnym poziomie.");
};


instance KDW_605_Riordian_TRADE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_TRADE_Condition;
	information = KDW_605_Riordian_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Poka� mi co masz do zaoferowania.";
	trade = 1;
};


func int KDW_605_Riordian_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_TRADE_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//Poka� mi co masz do zaoferowania.
};


var int lernen_darf_kdw;

instance KDW_605_RIORDIAN_LERNEN(C_Info)
{
	npc = KDW_605_Riordian;
	condition = kdw_605_riordian_lernen_condition;
	information = kdw_605_riordian_lernen_info;
	important = 0;
	permanent = 1;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int kdw_605_riordian_lernen_condition()
{
	if(lernen_darf_kdw == FALSE)
	{
		return TRUE;
	};
};

func void kdw_605_riordian_lernen_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Mo�esz mnie czego� nauczy�?
	if((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Riordian, alchemik Mag�w Wody, mo�e mnie poduczy� w dziedzinie alchemii.");
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_02");	//Mog� ci� zaznajomi� bli�ej ze sztuk� alchemii.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_03");	//Istnieje ca�a masa chemicznych substancji, kt�re maj� r�noraki wp�yw na cia�o i umys�.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_04");	//Mog� ci� w tym podszkoli�, je�li sobie tego �yczysz.
		lernen_darf_kdw = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_05");	//Szkol� jedynie mag�w Kr�gu Wody.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_06");	//Dop�ki wi�c nie zdecydujesz si� s�u�y� Adanosowi, nie masz co liczy� na moj� pomoc.
	};
};


instance kdw_605_riordian_traenke(C_Info)
{
	npc = KDW_605_Riordian;
	condition = kdw_605_riordian_traenke_condition;
	information = kdw_605_riordian_traenke_info;
	important = 0;
	permanent = 1;
	description = "Jakich mikstur m�g�by� nauczy� mnie warzy�?";
};


func int kdw_605_riordian_traenke_condition()
{
	if(((lernen_darf_kdw == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((lernen_darf_kdw == TRUE) && (Npc_GetTrueGuild(hero) == GIL_SLD)))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_traenke_info()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Info_14_01");	//Jakich mikstur m�g�by� nauczy� mnie warzy�?
	AI_Output(self,other,"KDW_605_Riordian_Traenke_Info_14_02");	//Znam receptury na eliksiry lecznicze, many, jak i takie stale wp�ywaj�ce na cia�o.
	Info_ClearChoices(kdw_605_riordian_traenke);
	Info_AddChoice(kdw_605_riordian_traenke,DIALOG_BACK,kdw_605_riordian_traenke_back);
	if(knows_heilessenz == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esencja uzdrawiaj�ca (Koszt: 1 PN)",kdw_605_riordian_traenke_health1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g uzdrawiaj�cy (Koszt: 2 PN)",kdw_605_riordian_traenke_health2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir uzdrawiaj�cy (Koszt: 3 PN)",kdw_605_riordian_traenke_health3);
	};
	if(knows_manaessenz == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esencja magicznej energii (Koszt: 1 PN)",kdw_605_riordian_traenke_mana1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g magicznej energii (Koszt: 2 PN)",kdw_605_riordian_traenke_mana2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir magicznej energii (Koszt: 3 PN)",kdw_605_riordian_traenke_mana3);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esencja �ycia (Koszt: 5 PN)",kdw_605_riordian_traenke_healthperma1);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g �ycia (Koszt: 8 PN)",kdw_605_riordian_traenke_healthperma2);
	};
	if((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_heilpermaessenz == TRUE) && (knows_heilpermaextrakt == TRUE) && (knows_heilpermaelixier == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir �ycia (Koszt: 10 PN)",kdw_605_riordian_traenke_healthperma3);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esencja ducha (Koszt: 5 PN)",kdw_605_riordian_traenke_manaperma1);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g ducha (Koszt: 8 PN)",kdw_605_riordian_traenke_manaperma2);
	};
	if((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_manapermaessenz == TRUE) && (knows_manapermaextrakt == TRUE) && (knows_manapermaelixier == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir ducha (Koszt: 10 PN)",kdw_605_riordian_traenke_manaperma3);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esencja si�y (Koszt: 5 PN)",kdw_605_riordian_traenke_strengthperma1);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g si�y (Koszt: 8 PN)",kdw_605_riordian_traenke_strengthperma2);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel >= 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir si�y (Koszt: 10 PN)",kdw_605_riordian_traenke_strengthperma3);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Esencja zwinno�ci (Koszt: 5 PN)",kdw_605_riordian_traenke_dexperma1);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g zwinno�ci (Koszt: 8 PN)",kdw_605_riordian_traenke_dexperma2);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir zwinno�ci (Koszt: 10 PN)",kdw_605_riordian_traenke_dexperma3);
	};
	if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Eliksir zwinno�ci (Koszt: 10 PN)",kdw_605_riordian_traenke_dexperma3);
	};
	if(((knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == TRUE) && (knows_mastermacht == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (knows_mastermacht == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Nap�j pot�gi (Koszt: 10 PN)",kdw_605_riordian_traenke_force1);
	};
	if(((knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == TRUE) && (knows_mastermacht == TRUE) && (knows_masterherrschaft == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == TRUE) && (knows_mastermacht == TRUE) && (knows_masterherrschaft == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Nap�j w�adzy (Koszt: 10 PN)",kdw_605_riordian_traenke_force2);
	};
};

func void kdw_605_riordian_traenke_back()
{
	Info_ClearChoices(kdw_605_riordian_traenke);
};

func void kdw_605_riordian_traenke_health1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_health2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiej�tno��: Wyci�g uzdrawiaj�cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_health3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiej�tno��: Eliksir uzdrawiaj�cy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_mana1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_mana2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Nowa umiej�tno��: Wyci�g magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_mana3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Nowa umiej�tno��: Eliksir magicznej energii",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_manaperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_manaperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_manaperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir ducha",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_healthperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_HealthPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_healthperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_HealthPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_healthperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir �ycia",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_strengthperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja si�y",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_strengthessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja si�y - 1x woda, 2x orkowe ziele, 1x trolest.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g si�y (Koszt: 8 PN)",kdw_605_riordian_traenke_strengthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_strengthperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g si�y",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_strengthextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g si�y - 1x woda, 3x orkowe ziele, 1x trolest.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == TRUE) && (knows_strengthelixier == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Eliksir si�y (Koszt: 10 PN)",kdw_605_riordian_traenke_strengthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_strengthperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir si�y",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_dexperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Nowa umiej�tno��: Esencja zwinno�ci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_dexessenz = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Esencja zwinno�ci - 1x alkohol, 2x serafis, 1x ogniocier�.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_strengthessenz == TRUE) && (knows_strengthextrakt == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Wyci�g zwinno�ci (Koszt: 8 PN)",kdw_605_riordian_traenke_dexperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_dexperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Nowa umiej�tno��: Wyci�g zwinno�ci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_dexextrakt = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Wyci�g zwinno�ci - 1x alkohol, 3x serafis, 1x ogniocier�.");
		if(((knows_manaessenz == TRUE) && (knows_manaextrakt == TRUE) && (knows_manaelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel == 4)) || ((knows_heilessenz == TRUE) && (knows_heilextrakt == TRUE) && (knows_heilelixier == TRUE) && (knows_dexessenz == TRUE) && (knows_dexextrakt == TRUE) && (knows_dexelixier == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Eliksir zwinno�ci (Koszt: 10 PN)",kdw_605_riordian_traenke_dexperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_dexperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma3_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Eliksir zwinno�ci",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma3_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma3_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
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

func void kdw_605_riordian_traenke_force1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Force1_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Nap�j pot�gi",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force1_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force1_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_mastermacht = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Nap�j pot�gi - 1x olej syrianiczny, 2x serafis, 1x ogniocier�, 2x orkowe ziele, 1x trolest.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_force2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Force2_15_00");	//Co musz� zrobi�?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Nowa umiej�tno��: Nap�j w�adzy",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force2_06_01");	//Na pocz�tek musisz umie�ci� wszystkie sk�adniki w menzurce, a nast�pnie dola� do niej wody.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force2_06_02");	//Postaraj si� jedynie dopilnowa�, aby zachowa� w�a�ciw� kolejno��, a z alchemi� wnet b�dziesz za pan brat.
		knows_masterherrschaft = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Nap�j w�adzy - 1x olej syrianiczny, 3x velais, 1x ogniocier�, 3x li�� d�bu, 1x trolest.");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

