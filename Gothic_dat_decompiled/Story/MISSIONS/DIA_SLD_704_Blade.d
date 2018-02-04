
instance SLD_704_BLADE_EXIT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 999;
	condition = sld_704_blade_exit_condition;
	information = sld_704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int sld_704_blade_exit_condition()
{
	return 1;
};

func void sld_704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};


instance dia_blade_hello(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_hello_condition;
	information = dia_blade_hello_info;
	permanent = 0;
	description = "Witaj! Kim jeste�?";
};


func int dia_blade_hello_condition()
{
	return 1;
};

func void dia_blade_hello_info()
{
	AI_Output(other,self,"DIA_Blade_Hello_13_00");	//Witaj! Kim jeste�?
	AI_Output(self,other,"DIA_Blade_Hello_15_01");	//Wszyscy tutaj wo�aj� na mnie Kosa. Jestem cz�owiekiem, kt�ry dba o to, by bronie naszych ch�opak�w by�y zawsze dostatecznie ostre.
	AI_Output(self,other,"DIA_Blade_Hello_11_01");	//Zanim trafi�em do kolonii, s�u�y�em w wojsku jako p�atnerz. Dlatego nadaj� si� w sam raz do takiej roboty.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Kosa mo�e mi sprzeda� r�norakie akcesoria kowalskie.");
};


instance DIA_BLADE_TRADE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 800;
	condition = dia_blade_trade_condition;
	information = dia_blade_trade_info;
	permanent = 1;
	description = "Co masz do sprzedania?";
	trade = 1;
};


func int dia_blade_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_hello))
	{
		return TRUE;
	};
};

func void dia_blade_trade_info()
{
	AI_Output(other,self,"DIA_Blade_Trade_15_00");	//Co masz do sprzedania?
	AI_Output(self,other,"DIA_Blade_Trade_11_01");	//Mog� ci zaoferowa� r�norakie akcesoria potrzebne do wykuwania broni.
};


instance dia_blade_learnnot(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnnot_condition;
	information = dia_blade_learnnot_info;
	permanent = 0;
	description = "M�g�bym si� od ciebie uczy�?";
};


func int dia_blade_learnnot_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_hello))
	{
		return TRUE;
	};
};

func void dia_blade_learnnot_info()
{
	AI_Output(other,self,"DIA_Blade_LearnNOT_15_00");	//M�g�bym si� od ciebie uczy�?
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_01");	//W rzeczy samej - je�li tylko do��czysz do naszego obozu.
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_02");	//B�d�c Szkodnikiem, m�g�bym ci� nauczy� podstaw. Jednak b�d�c jednym z nas, pokaza�bym ci o wiele wi�cej.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Najemnik Kosa mo�e mnie przyuczy� kowalstwa.");
};


instance dia_blade_learnyes(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnyes_condition;
	information = dia_blade_learnyes_info;
	permanent = 1;
	description = "Czego mo�esz mnie nauczy�?";
};


func int dia_blade_learnyes_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,dia_blade_learnnot)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,dia_blade_learnnot)))
	{
		return TRUE;
	};
};

func void dia_blade_learnyes_info()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_00");	//Czego mo�esz mnie nauczy�?
	AI_Output(self,other,"DIA_Blade_LearnYES_11_01");	//M�g�bym ci� podszkoli� ku� kilka ciekawych broni.
	AI_Output(self,other,"DIA_Blade_LearnYES_11_02");	//Powiedz tylko, co chcesz wiedzie�.
	Info_ClearChoices(dia_blade_learnyes);
	Info_AddChoice(dia_blade_learnyes,DIALOG_BACK,dia_blade_learnyes_back);
	if(((knows_axt == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (knows_axt == FALSE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Morgensztern (Koszt: 1 PN)",dia_blade_learnyes_axt);
	};
	if(((knows_axt == TRUE) && (knows_stahlgeflecht == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (knows_stahlgeflecht == FALSE) && (knows_axt == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"�elazna maczuga (Koszt: 2 PN)",dia_blade_learnyes_stahlgeflecht);
	};
	if(((knows_axt == TRUE) && (knows_stahlgeflecht == TRUE) && (knows_steinbrecher == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (knows_steinbrecher == FALSE) && (knows_stahlgeflecht == TRUE) && (knows_axt == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"�omotacz (Koszt: 3 PN)",dia_blade_learnyes_steinbrecher);
	};
	if((knows_s�ldnerklinge == FALSE) && (knows_axt == TRUE) && (knows_steinbrecher == TRUE) && (knows_stahlgeflecht == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Lekki top�r bojowy (Koszt: 4 PN)",dia_blade_learnyes_s�ldnerklinge);
	};
	if((knows_zweih�nder == FALSE) && (knows_s�ldnerklinge == TRUE) && (knows_axt == TRUE) && (knows_steinbrecher == TRUE) && (knows_stahlgeflecht == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Top�r wojenny (Koszt: 5 PN)",dia_blade_learnyes_zweih�nder);
	};
	if((knows_zornstahl == FALSE) && (knows_zweih�nder == TRUE) && (knows_s�ldnerklinge == TRUE) && (knows_axt == TRUE) && (knows_steinbrecher == TRUE) && (knows_stahlgeflecht == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Krzyk wojownika (Koszt: 6 PN)",dia_blade_learnyes_zornstahl);
	};
};

func void dia_blade_learnyes_back()
{
	Info_ClearChoices(dia_blade_learnyes);
};

func void dia_blade_learnyes_axt()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� morgensztern.");
		knows_axt = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_stahlgeflecht()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� �elazn� maczug�.");
		knows_stahlgeflecht = TRUE;
		PrintScreen("Nowa umiej�tno��: Kucie �elaznej maczugi",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_steinbrecher()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� �omotacz.");
		knows_steinbrecher = TRUE;
		PrintScreen("Nowa umiej�tno��: Kucie �omotacza",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_s�ldnerklinge()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� lekki top�r bojowy.");
		knows_s�ldnerklinge = TRUE;
		PrintScreen("Nowa umiej�tno��: Kucie lekkiego toporu bojowego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zweih�nder()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� top�r wojenny.");
		knows_zweih�nder = TRUE;
		PrintScreen("Nowa umiej�tno��: Kucie toporu wojennego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zornstahl()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� krzyk wojownika.");
		knows_zornstahl = TRUE;
		PrintScreen("Nowa umiej�tno��: Kucie krzyku wojownika",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w umiej�tno�ci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance dia_blade_smith(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_smith_condition;
	information = dia_blade_smith_info;
	permanent = 0;
	description = "Mia�bym rob�tk� dla ciebie.";
};


func int dia_blade_smith_condition()
{
	if(fmc_smith == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_blade_smith_info()
{
	AI_Output(other,self,"DIA_Blade_SMITH_13_00");	//Mia�bym rob�tk� dla ciebie.
	AI_Output(self,other,"DIA_Blade_SMITH_15_01");	//Serio? A na czym by ona polega�a?
	AI_Output(other,self,"DIA_Blade_SMITH_11_02");	//Najemnikom w Wolnej Kopalni przyda�by si� nowy kowal.
	AI_Output(other,self,"DIA_Blade_SMITH_11_03");	//A z ku�ni w Kotle ju� od d�u�szego czasu nikt nie korzysta�.
	AI_Output(self,other,"DIA_Blade_SMITH_11_04");	//A czemu niby mia�bym akurat tam pracowa�?
	AI_Output(other,self,"DIA_Blade_SMITH_11_05");	//No c�, to chyba o wiele lepsza alternatywa od sterczenia tu przez ca�y dzie� i nicnierobienia.
	AI_Output(self,other,"DIA_Blade_SMITH_11_06");	//Hmm... w sumie masz racj�. Czas najwy�szy ruszy� ten sw�j leniwy zadek.
	AI_Output(self,other,"DIA_Blade_SMITH_11_07");	//Widzimy si� p�niej.
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	B_LogEntry(CH1_FMCSMITH,"Kosa zgodzi� si� pracowa� w Wolnej Kopalni. Bezzw�ocznie uda� si� do swojego nowego miejsca pracy.");
};


instance DIA_BLADE_WHY(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_why_condition;
	information = dia_blade_why_info;
	permanent = 0;
	description = "Co tu robisz? Czemu nie jeste� w Kotle?";
};


func int dia_blade_why_condition()
{
	if((FMTaken == TRUE) && (fmc_smith == LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_blade_why_info()
{
	AI_Output(other,self,"DIA_Blade_WHY_13_00");	//Co tu robisz? Czemu nie jeste� w Kotle?
	AI_Output(self,other,"DIA_Blade_WHY_15_01");	//Jeszcze� nie s�ysza�? Ludzie Gomeza zaatakowali Woln� Kopalni�.
	AI_Output(self,other,"DIA_Blade_WHY_11_02");	//Okyl i jego ludzie nie �yj�.
	AI_Output(self,other,"DIA_Blade_WHY_11_03");	//Ja mia�em to szcz�cie, �e akurat w tym czasie by�em w obozie, �eby odebra� zapasy.
	AI_Output(self,other,"DIA_Blade_WHY_11_04");	//Chyba tylko dlatego w og�le jeszcze oddycham.
};

