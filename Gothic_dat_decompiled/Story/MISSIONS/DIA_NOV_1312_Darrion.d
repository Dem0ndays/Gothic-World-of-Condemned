
instance DIA_Darrion_Exit(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 999;
	condition = DIA_Darrion_Exit_Condition;
	information = DIA_Darrion_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Darrion_Exit_Condition()
{
	return 1;
};

func void DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Darrion_Hello(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = DIA_Darrion_Hello_Condition;
	information = DIA_Darrion_Hello_Info;
	permanent = 0;
	description = "Czeœæ! Jestem tu nowy i chcia³bym poznaæ lepiej wasz Obóz.";
};


func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//Czeœæ! Jestem tu nowy i chcia³bym poznaæ lepiej wasz Obóz.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//Zatem trafi³eœ nie tam gdzie trzeba. Odk¹d Stra¿nicy Œwi¹tynni rozpoczêli przygotowania do walki, pracujemy dniem i noc¹.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//Nie mam wiele czasu na pogawêdki, wiêc nie zawracaj mi g³owy jeœli nie chcesz niczego kupiæ.
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Nowicjusz Darrion handluje broni¹. Krêci siê zwykle w pobli¿u kuŸni.");
};


instance DIA_Darrion_Trade(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	permanent = 1;
	description = "Chcia³bym coœ kupiæ!";
	trade = 1;
};


func int DIA_Darrion_Trade_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

func void DIA_Darrion_Trade_Info()
{
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//Chcia³bym coœ kupiæ!
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//To œwietnie! Oto broñ, któr¹ mam aktualnie na sk³adzie.
};


instance DIA_DARRION_LEARNNOT(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnnot_condition;
	information = dia_darrion_learnnot_info;
	permanent = 0;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_darrion_learnnot_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Darrion_Hello) && (Npc_GetTrueGuild(hero) != GIL_NOV)) || (Npc_GetTrueGuild(hero) != GIL_TPL) || (Npc_GetTrueGuild(hero) != GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_darrion_learnnot_info()
{
	AI_Output(other,self,"DIA_Darrion_LearnNOT_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_01");	//Uczê tylko cz³onków naszego obozu.
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_02");	//Dlatego jeœli chcesz siê czegoœ nauczyæ, bêdziesz musia³ pierw do nas do³¹czyæ.
};


var int darrion_smithasking;

instance dia_darrion_learnyes(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnyes_condition;
	information = dia_darrion_learnyes_info;
	permanent = 1;
	description = "Mo¿esz mnie przyuczyæ nieco kowalstwa?";
};


func int dia_darrion_learnyes_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_darrion_learnyes_info()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_00");	//Mo¿esz mnie przyuczyæ nieco kowalstwa?
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_01");	//Mogê ciê nauczyæ wykuwaæ porz¹dne miecze.
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_02");	//Mimo wszystko trochê doœwiadczenia by ci siê przyda³o.
	if(darrion_smithasking == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Nowicjusz Darrion mo¿e mnie trochê przyuczyæ kowalstwa. W ci¹gu dnia znajdê go pewnie w kuŸni.");
		darrion_smithasking = TRUE;
	};
	Info_ClearChoices(dia_darrion_learnyes);
	Info_AddChoice(dia_darrion_learnyes,DIALOG_BACK,dia_darrion_learnyes_back);
	if(((knows_streitkolben == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (knows_streitkolben == FALSE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_streitkolben == FALSE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Maczuga (Koszt: 1 PN)",dia_darrion_learnyes_streitkolben);
	};
	if(((knows_stahlzunge == FALSE) && (knows_streitkolben == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (knows_stahlzunge == FALSE) && (knows_streitkolben == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_stahlzunge == FALSE) && (knows_streitkolben == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Stalowy jêzyk (Koszt: 2 PN)",dia_darrion_learnyes_stahlzunge);
	};
	if(((knows_kriegsschwert == FALSE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (knows_kriegsschwert == FALSE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_kriegsschwert == FALSE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Miecz wojenny (Koszt: 3 PN)",dia_darrion_learnyes_kriegsschwert);
	};
	if(((knows_leichter2h == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_leichter2h == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Lekki miecz dwurêczny (Koszt: 4 PN)",dia_darrion_learnyes_leichter2h);
	};
	if(((knows_hüterklinge == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_hüterklinge == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Miecz nadzorcy (Koszt: 5 PN)",dia_darrion_learnyes_hüterklinge);
	};
	if((knows_königsklinge == FALSE) && (knows_kriegsschwert == TRUE) && (knows_hüterklinge == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Miecz królewski (Koszt: 6 PN)",dia_darrion_learnyes_königsklinge);
	};
	if((knows_roter_wind == FALSE) && (knows_kriegsschwert == TRUE) && (knows_hüterklinge == TRUE) && (knows_königsklinge == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Czerwony Wiatr (Koszt: 7 PN)",dia_darrion_learnyes_roter_wind);
	};
};

func void dia_darrion_learnyes_back()
{
	Info_ClearChoices(dia_darrion_learnyes);
};

func void dia_darrion_learnyes_streitkolben()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ maczugê.");
		knows_streitkolben = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_stahlzunge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ stalowy jêzyk.");
		knows_stahlzunge = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Wykuwanie stalowego jêzyka",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_kriegsschwert()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ miecz wojenny.");
		knows_kriegsschwert = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Wykuwanie miecza wojennego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_leichter2h()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ lekki miecz dwurêczny.");
		knows_leichter2h = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Wykuwanie lekkiego miecza dwurêcznego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_hüterklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ miecz nadzorcy.");
		knows_hüterklinge = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Wykuwanie miecza nadzorcy",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_königsklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ miecz królewski.");
		knows_königsklinge = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Wykuwanie miecza królewskiego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_roter_wind()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobiæ?
	if(hero.lp >= 7)
	{
		hero.lp = hero.lp - 7;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j¹ na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wykuæ miecz Czerwony Wiatr.");
		knows_roter_wind = TRUE;
		PrintScreen("Nowa umiejêtnoœæ: Wykuwanie Czerwonego Wiatru",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma³o punktów nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance INFO_DARRION_ARMORFINISHED(C_Info)
{
	npc = NOV_1312_Darrion;
	condition = info_darrion_armorfinished_condition;
	information = info_darrion_armorfinished_info;
	important = 0;
	permanent = 0;
	description = "Chcia³eœ ze mn¹ porozmawiaæ?";
};


func int info_darrion_armorfinished_condition()
{
	if(((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_TPL)))
	{
		return TRUE;
	};
};

func void info_darrion_armorfinished_info()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Chcia³eœ ze mn¹ porozmawiaæ?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//O, jesteœ. Tak, chcia³em z tob¹ pomówiæ.
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//S³ysza³em ju¿ co siê sta³o i mam taki prezent dla ciebie.
		AI_Output(self,hero,"Info_Darrion_DIE_14_04");	//Jako jeden z naszych najlepszych Stra¿ników Œwi¹tynnych, zaszczytem jest dla mnie przyznanie ci tego pancerza.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//ZnaleŸliœmy tê zbrojê przy zak³adaniu naszego obozu w œwi¹tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Nie wiemy sk¹d pochodzi. Prawdopodobnie nale¿a³a do dawnego mieszkañca tej¿e œwi¹tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//W koñcu ich kultura znacznie siê ró¿ni od naszej.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Mam nadziejê, ¿e ten pancerz bêdzie ci s³u¿y³.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	}
	else
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Chcia³eœ ze mn¹ porozmawiaæ?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//O, jesteœ. Tak, chcia³em z tob¹ pomówiæ.
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//S³ysza³em ju¿ co siê sta³o i mam taki prezent dla ciebie.
		AI_Output(self,hero,"Info_Darrion_DIE_15_04");	//Daleko zaszed³eœ jako Nowicjusz, dlatego te¿ w pe³ni na niego zas³u¿y³eœ.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//ZnaleŸliœmy tê zbrojê przy zak³adaniu naszego obozu w œwi¹tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Nie wiemy sk¹d pochodzi. Prawdopodobnie nale¿a³a do dawnego mieszkañca tej¿e œwi¹tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//W koñcu ich kultura znacznie siê ró¿ni od naszej.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Mam nadziejê, ¿e ten pancerz bêdzie ci s³u¿y³.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	};
};


instance INFO_DARRION_CRAFT_WHICH(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 9;
	condition = info_darrion_craft_which_condition;
	information = info_darrion_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Potrafi³byœ wzmocniæ moje pancerze?";
};


func int info_darrion_craft_which_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void info_darrion_craft_which_info()
{
	AI_Output(hero,self,"Info_Darrion_CRAFT_WHICH_15_01");	//Potrafi³byœ wzmocniæ moje pancerze?
	AI_Output(self,hero,"Info_Darrion_CRAFT_WHICH_09_02");	//Jeœli masz przy sobie odpowiedni¹ zbrojê, z któr¹ da³oby siê coœ zdzia³aæ.
	Info_ClearChoices(info_darrion_craft_which);
	Info_AddChoice(info_darrion_craft_which,DIALOG_BACK,info_darrion_craft_which_back);
	if(Npc_HasItems(other,nov_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona przepaska Nowicjusza (375 bry³ek)",info_darrion_craft_which_novl);
	};
	if(Npc_HasItems(other,nov_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona lekka zbroja Nowicjusza (525 bry³ek)",info_darrion_craft_which_novm);
	};
	if(Npc_HasItems(other,nov_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona zbroja Nowicjusza (600 bry³ek)",info_darrion_craft_which_novh);
	};
	if(Npc_HasItems(other,tpl_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona lekka zbroja Œwi¹tynna (675 bry³ek)",info_darrion_craft_which_tpll);
	};
	if(Npc_HasItems(other,tpl_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona zbroja Œwi¹tynna (825 bry³ek)",info_darrion_craft_which_tplm);
	};
	if(Npc_HasItems(other,tpl_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona ciê¿ka zbroja Œwi¹tynna (1050 bry³ek)",info_darrion_craft_which_tplh);
	};
};

func void info_darrion_craft_which_back()
{
	Info_ClearChoices(info_darrion_craft_which);
};

func void info_darrion_craft_which_novl()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,nov_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, tê akurat uda mi siê ulepszyæ.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn¹ chwilê i bêdzie gotowa.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,nov_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,nov_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,nov_armor_l_upgrade);
		B_GiveInvItems(self,hero,nov_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto twój pancerz. Mam nadziejê, ¿e zapewni ci lepsz¹ ochronê ni¿ wczeœniej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,nov_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, tê akurat uda mi siê ulepszyæ.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn¹ chwilê i bêdzie gotowa.
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(hero,nov_armor_m);
		CreateInvItem(hero,nov_armor_m_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto twój pancerz. Mam nadziejê, ¿e zapewni ci lepsz¹ ochronê ni¿ wczeœniej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,nov_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, tê akurat uda mi siê ulepszyæ.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn¹ chwilê i bêdzie gotowa.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,nov_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,nov_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,nov_armor_h_upgrade);
		B_GiveInvItems(self,hero,nov_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto twój pancerz. Mam nadziejê, ¿e zapewni ci lepsz¹ ochronê ni¿ wczeœniej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tpll()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,tpl_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, tê akurat uda mi siê ulepszyæ.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn¹ chwilê i bêdzie gotowa.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,tpl_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_l_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto twój pancerz. Mam nadziejê, ¿e zapewni ci lepsz¹ ochronê ni¿ wczeœniej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,tpl_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, tê akurat uda mi siê ulepszyæ.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn¹ chwilê i bêdzie gotowa.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,tpl_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_m_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto twój pancerz. Mam nadziejê, ¿e zapewni ci lepsz¹ ochronê ni¿ wczeœniej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,tpl_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, tê akurat uda mi siê ulepszyæ.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn¹ chwilê i bêdzie gotowa.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,tpl_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_h_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto twój pancerz. Mam nadziejê, ¿e zapewni ci lepsz¹ ochronê ni¿ wczeœniej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz doœæ rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

