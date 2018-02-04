
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
	description = "Witaj! Kim jesteœ?";
};


func int dia_blade_hello_condition()
{
	return 1;
};

func void dia_blade_hello_info()
{
	AI_Output(other,self,"DIA_Blade_Hello_13_00");	//Witaj! Kim jesteœ?
	AI_Output(self,other,"DIA_Blade_Hello_15_01");	//Wszyscy tutaj wo³aj¹ na mnie Kosa. Jestem cz³owiekiem, który dba o to, by bronie naszych ch³opaków by³y zawsze dostatecznie ostre.
	AI_Output(self,other,"DIA_Blade_Hello_11_01");	//Zanim trafi³em do kolonii, s³u¿y³em w wojsku jako p³atnerz. Dlatego nadajê siê w sam raz do takiej roboty.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Kosa mo¿e mi sprzedaæ ró¿norakie akcesoria kowalskie.");
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
	AI_Output(self,other,"DIA_Blade_Trade_11_01");	//Mogê ci zaoferowaæ ró¿norakie akcesoria potrzebne do wykuwania broni.
};


instance dia_blade_learnnot(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnnot_condition;
	information = dia_blade_learnnot_info;
	permanent = 0;
	description = "Móg³bym siê od ciebie uczyæ?";
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
	AI_Output(other,self,"DIA_Blade_LearnNOT_15_00");	//Móg³bym siê od ciebie uczyæ?
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_01");	//W rzeczy samej - jeœli tylko do³¹czysz do naszego obozu.
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_02");	//Bêd¹c Szkodnikiem, móg³bym ciê nauczyæ podstaw. Jednak bêd¹c jednym z nas, pokaza³bym ci o wiele wiêcej.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Najemnik Kosa mo¿e mnie przyuczyæ kowalstwa.");
};


instance dia_blade_learnyes(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnyes_condition;
	information = dia_blade_learnyes_info;
	permanent = 1;
	description = "Czego mo¿esz mnie nauczyæ?";
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
	AI_Output(other,self,"DIA_Blade_LearnYES_15_00");	//Czego mo¿esz mnie nauczyæ?
	AI_Output(self,other,"DIA_Blade_LearnYES_11_01");	//Móg³bym ciê podszkoliæ kuæ kilka ciekawych broni.
	AI_Output(self,other,"DIA_Blade_LearnYES_11_02");	//Powiedz tylko, co chcesz wiedzieæ.
	Info_ClearChoices(dia_blade_learnyes);
	Info_AddChoice(dia_blade_learnyes,DIALOG_BACK,dia_blade_learnyes_back);
	if(((knows_axt == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (knows_axt == FALSE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Morgensztern (Koszt: 1 PN)",dia_blade_learnyes_axt);
	};
	if(((knows_axt == TRUE) && (knows_stahlgeflecht == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (knows_stahlgeflecht == FALSE) && (knows_axt == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"¯elazna maczuga (Koszt: 2 PN)",dia_blade_learnyes_stahlgeflecht);
	};
	if(((knows_axt == TRUE) && (knows_stahlgeflecht == TRUE) && (knows_steinbrecher == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (knows_steinbrecher == FALSE) && (knows_stahlgeflecht == TRUE) && (knows_axt == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"£omotacz (Koszt: 3 PN)",dia_blade_learnyes_steinbrecher);
	};
	if((knows_söldnerklinge == FALSE) && (knows_axt == TRUE) && (knows_steinbrecher == TRUE) && (knows_stahlgeflecht == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Lekki topór bojowy (Koszt: 4 PN)",dia_blade_learnyes_söldnerklinge);
	};
	if((knows_zweihånder == FALSE) && (knows_söldnerklinge == TRUE) && (knows_axt == TRUE) && (knows_steinbrecher == TRUE) && (knows_stahlgeflecht == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Topór wojenny (Koszt: 5 PN)",dia_blade_learnyes_zweihånder);
	};
	if((knows_zornstahl == FALSE) && (knows_zweihånder == TRUE) && (knows_söldnerklinge == TRUE) && (knows_axt == TRUE) && (knows_steinbrecher == TRUE) && (knows_stahlgeflecht == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_SLD))
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
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ morgensztern.");
		knows_axt = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_stahlgeflecht()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ ¿elazn¹ maczugê.");
		knows_stahlgeflecht = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Kucie ¿elaznej maczugi",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_steinbrecher()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ ³omotacz.");
		knows_steinbrecher = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Kucie ³omotacza",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_söldnerklinge()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ lekki topór bojowy.");
		knows_söldnerklinge = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Kucie lekkiego toporu bojowego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zweihånder()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ topór wojenny.");
		knows_zweihånder = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Kucie toporu wojennego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zornstahl()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ krzyk wojownika.");
		knows_zornstahl = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Kucie krzyku wojownika",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów umiejêtnoœci!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Mia³bym robótkê dla ciebie.";
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
	AI_Output(other,self,"DIA_Blade_SMITH_13_00");	//Mia³bym robótkê dla ciebie.
	AI_Output(self,other,"DIA_Blade_SMITH_15_01");	//Serio? A na czym by ona polega³a?
	AI_Output(other,self,"DIA_Blade_SMITH_11_02");	//Najemnikom w Wolnej Kopalni przyda³by siê nowy kowal.
	AI_Output(other,self,"DIA_Blade_SMITH_11_03");	//A z kuŸni w Kotle ju¿ od d³u¿szego czasu nikt nie korzysta³.
	AI_Output(self,other,"DIA_Blade_SMITH_11_04");	//A czemu niby mia³bym akurat tam pracowaæ?
	AI_Output(other,self,"DIA_Blade_SMITH_11_05");	//No có¿, to chyba o wiele lepsza alternatywa od sterczenia tu przez ca³y dzieñ i nicnierobienia.
	AI_Output(self,other,"DIA_Blade_SMITH_11_06");	//Hmm... w sumie masz racjê. Czas najwy¿szy ruszyæ ten swój leniwy zadek.
	AI_Output(self,other,"DIA_Blade_SMITH_11_07");	//Widzimy siê póŸniej.
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	B_LogEntry(CH1_FMCSMITH,"Kosa zgodzi³ siê pracowaæ w Wolnej Kopalni. Bezzw³ocznie uda³ siê do swojego nowego miejsca pracy.");
};


instance DIA_BLADE_WHY(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_why_condition;
	information = dia_blade_why_info;
	permanent = 0;
	description = "Co tu robisz? Czemu nie jesteœ w Kotle?";
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
	AI_Output(other,self,"DIA_Blade_WHY_13_00");	//Co tu robisz? Czemu nie jesteœ w Kotle?
	AI_Output(self,other,"DIA_Blade_WHY_15_01");	//Jeszczeœ nie s³ysza³? Ludzie Gomeza zaatakowali Woln¹ Kopalniê.
	AI_Output(self,other,"DIA_Blade_WHY_11_02");	//Okyl i jego ludzie nie ¿yj¹.
	AI_Output(self,other,"DIA_Blade_WHY_11_03");	//Ja mia³em to szczêœcie, ¿e akurat w tym czasie by³em w obozie, ¿eby odebraæ zapasy.
	AI_Output(self,other,"DIA_Blade_WHY_11_04");	//Chyba tylko dlatego w ogóle jeszcze oddycham.
};

