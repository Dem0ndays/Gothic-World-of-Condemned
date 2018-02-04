
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
	description = "Cze��! Jestem tu nowy i chcia�bym pozna� lepiej wasz Ob�z.";
};


func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//Cze��! Jestem tu nowy i chcia�bym pozna� lepiej wasz Ob�z.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//Zatem trafi�e� nie tam gdzie trzeba. Odk�d Stra�nicy �wi�tynni rozpocz�li przygotowania do walki, pracujemy dniem i noc�.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//Nie mam wiele czasu na pogaw�dki, wi�c nie zawracaj mi g�owy je�li nie chcesz niczego kupi�.
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Nowicjusz Darrion handluje broni�. Kr�ci si� zwykle w pobli�u ku�ni.");
};


instance DIA_Darrion_Trade(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	permanent = 1;
	description = "Chcia�bym co� kupi�!";
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
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//Chcia�bym co� kupi�!
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//To �wietnie! Oto bro�, kt�r� mam aktualnie na sk�adzie.
};


instance DIA_DARRION_LEARNNOT(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnnot_condition;
	information = dia_darrion_learnnot_info;
	permanent = 0;
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_Darrion_LearnNOT_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_01");	//Ucz� tylko cz�onk�w naszego obozu.
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_02");	//Dlatego je�li chcesz si� czego� nauczy�, b�dziesz musia� pierw do nas do��czy�.
};


var int darrion_smithasking;

instance dia_darrion_learnyes(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnyes_condition;
	information = dia_darrion_learnyes_info;
	permanent = 1;
	description = "Mo�esz mnie przyuczy� nieco kowalstwa?";
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
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_00");	//Mo�esz mnie przyuczy� nieco kowalstwa?
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_01");	//Mog� ci� nauczy� wykuwa� porz�dne miecze.
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_02");	//Mimo wszystko troch� do�wiadczenia by ci si� przyda�o.
	if(darrion_smithasking == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Nowicjusz Darrion mo�e mnie troch� przyuczy� kowalstwa. W ci�gu dnia znajd� go pewnie w ku�ni.");
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
		Info_AddChoice(dia_darrion_learnyes,"Stalowy j�zyk (Koszt: 2 PN)",dia_darrion_learnyes_stahlzunge);
	};
	if(((knows_kriegsschwert == FALSE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (knows_kriegsschwert == FALSE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_kriegsschwert == FALSE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Miecz wojenny (Koszt: 3 PN)",dia_darrion_learnyes_kriegsschwert);
	};
	if(((knows_leichter2h == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_leichter2h == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Lekki miecz dwur�czny (Koszt: 4 PN)",dia_darrion_learnyes_leichter2h);
	};
	if(((knows_h�terklinge == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (knows_h�terklinge == FALSE) && (knows_kriegsschwert == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Miecz nadzorcy (Koszt: 5 PN)",dia_darrion_learnyes_h�terklinge);
	};
	if((knows_k�nigsklinge == FALSE) && (knows_kriegsschwert == TRUE) && (knows_h�terklinge == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Miecz kr�lewski (Koszt: 6 PN)",dia_darrion_learnyes_k�nigsklinge);
	};
	if((knows_roter_wind == FALSE) && (knows_kriegsschwert == TRUE) && (knows_h�terklinge == TRUE) && (knows_k�nigsklinge == TRUE) && (knows_streitkolben == TRUE) && (knows_stahlzunge == TRUE) && (knows_leichter2h == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_TPL))
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
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� maczug�.");
		knows_streitkolben = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_stahlzunge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� stalowy j�zyk.");
		knows_stahlzunge = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie stalowego j�zyka",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_kriegsschwert()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� miecz wojenny.");
		knows_kriegsschwert = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie miecza wojennego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_leichter2h()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� lekki miecz dwur�czny.");
		knows_leichter2h = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie lekkiego miecza dwur�cznego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_h�terklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� miecz nadzorcy.");
		knows_h�terklinge = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie miecza nadzorcy",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_k�nigsklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� miecz kr�lewski.");
		knows_k�nigsklinge = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie miecza kr�lewskiego",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_roter_wind()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 7)
	{
		hero.lp = hero.lp - 7;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� miecz Czerwony Wiatr.");
		knows_roter_wind = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie Czerwonego Wiatru",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
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
	description = "Chcia�e� ze mn� porozmawia�?";
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
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Chcia�e� ze mn� porozmawia�?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//O, jeste�. Tak, chcia�em z tob� pom�wi�.
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//S�ysza�em ju� co si� sta�o i mam taki prezent dla ciebie.
		AI_Output(self,hero,"Info_Darrion_DIE_14_04");	//Jako jeden z naszych najlepszych Stra�nik�w �wi�tynnych, zaszczytem jest dla mnie przyznanie ci tego pancerza.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//Znale�li�my t� zbroj� przy zak�adaniu naszego obozu w �wi�tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Nie wiemy sk�d pochodzi. Prawdopodobnie nale�a�a do dawnego mieszka�ca tej�e �wi�tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//W ko�cu ich kultura znacznie si� r�ni od naszej.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Mam nadziej�, �e ten pancerz b�dzie ci s�u�y�.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	}
	else
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Chcia�e� ze mn� porozmawia�?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//O, jeste�. Tak, chcia�em z tob� pom�wi�.
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//S�ysza�em ju� co si� sta�o i mam taki prezent dla ciebie.
		AI_Output(self,hero,"Info_Darrion_DIE_15_04");	//Daleko zaszed�e� jako Nowicjusz, dlatego te� w pe�ni na niego zas�u�y�e�.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//Znale�li�my t� zbroj� przy zak�adaniu naszego obozu w �wi�tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Nie wiemy sk�d pochodzi. Prawdopodobnie nale�a�a do dawnego mieszka�ca tej�e �wi�tyni.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//W ko�cu ich kultura znacznie si� r�ni od naszej.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Mam nadziej�, �e ten pancerz b�dzie ci s�u�y�.
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
	description = "Potrafi�by� wzmocni� moje pancerze?";
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
	AI_Output(hero,self,"Info_Darrion_CRAFT_WHICH_15_01");	//Potrafi�by� wzmocni� moje pancerze?
	AI_Output(self,hero,"Info_Darrion_CRAFT_WHICH_09_02");	//Je�li masz przy sobie odpowiedni� zbroj�, z kt�r� da�oby si� co� zdzia�a�.
	Info_ClearChoices(info_darrion_craft_which);
	Info_AddChoice(info_darrion_craft_which,DIALOG_BACK,info_darrion_craft_which_back);
	if(Npc_HasItems(other,nov_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona przepaska Nowicjusza (375 bry�ek)",info_darrion_craft_which_novl);
	};
	if(Npc_HasItems(other,nov_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona lekka zbroja Nowicjusza (525 bry�ek)",info_darrion_craft_which_novm);
	};
	if(Npc_HasItems(other,nov_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona zbroja Nowicjusza (600 bry�ek)",info_darrion_craft_which_novh);
	};
	if(Npc_HasItems(other,tpl_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona lekka zbroja �wi�tynna (675 bry�ek)",info_darrion_craft_which_tpll);
	};
	if(Npc_HasItems(other,tpl_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona zbroja �wi�tynna (825 bry�ek)",info_darrion_craft_which_tplm);
	};
	if(Npc_HasItems(other,tpl_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Wzmocniona ci�ka zbroja �wi�tynna (1050 bry�ek)",info_darrion_craft_which_tplh);
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, t� akurat uda mi si� ulepszy�.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn� chwil� i b�dzie gotowa.
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto tw�j pancerz. Mam nadziej�, �e zapewni ci lepsz� ochron� ni� wcze�niej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,nov_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, t� akurat uda mi si� ulepszy�.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn� chwil� i b�dzie gotowa.
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto tw�j pancerz. Mam nadziej�, �e zapewni ci lepsz� ochron� ni� wcze�niej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,nov_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, t� akurat uda mi si� ulepszy�.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn� chwil� i b�dzie gotowa.
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto tw�j pancerz. Mam nadziej�, �e zapewni ci lepsz� ochron� ni� wcze�niej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tpll()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,tpl_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, t� akurat uda mi si� ulepszy�.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn� chwil� i b�dzie gotowa.
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto tw�j pancerz. Mam nadziej�, �e zapewni ci lepsz� ochron� ni� wcze�niej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,tpl_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, t� akurat uda mi si� ulepszy�.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn� chwil� i b�dzie gotowa.
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto tw�j pancerz. Mam nadziej�, �e zapewni ci lepsz� ochron� ni� wcze�niej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,tpl_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Dobra, t� akurat uda mi si� ulepszy�.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Jedn� chwil� i b�dzie gotowa.
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
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Oto tw�j pancerz. Mam nadziej�, �e zapewni ci lepsz� ochron� ni� wcze�niej.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Nie masz do�� rudy.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

