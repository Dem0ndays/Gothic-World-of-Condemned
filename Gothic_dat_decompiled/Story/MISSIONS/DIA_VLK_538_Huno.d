
instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "Widz�, �e znasz si� na swoim fachu.";
};


func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//Widz�, �e znasz si� na swoim fachu.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Jeszcze nikt nie mia� powodu do narzekania.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//I lepiej, �eby nikt tego nie robi�! Ka�dy dure� potrzebuje miecza, i to w�a�nie ode mnie dostaj�!
};


instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "Jak d�ugo zajmuje wykucie jednego miecza?";
};


func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Jak d�ugo zajmuje wykucie jednego miecza?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//To zale�y. Je�li chodzi o najprostsze ostrza, wystarczy kilka minut.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Oczywi�cie pod warunkiem, �e jestem odpowiednio zmotywowany... Finansowo.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//Oczywi�cie �wiry pokroju �wistaka musz� czeka� na swoje cacka nieco d�u�ej.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Dlaczego? Czy�by �wistak za ma�o ci zap�aci�?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Nie, wr�cz przeciwnie. Za sw�j ostatni miecz da� mi 150 bry�ek rudy.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Ale facet lubi bogate zdobienia i takie tam babskie fanaberie, a to oczywi�cie kosztuje!
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Hej, ciekawski z ciebie facet, kolego!
};


instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 1;
	important = 0;
	description = "Jak stoisz z prac�, kowalu?";
};


func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Jak stoisz z prac�, kowalu?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//A co ci� to obchodzi?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//By� mo�e mam dla ciebie zam�wienie.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//Czy�by? A c� takiego, je�li wolno spyta�?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Jeszcze si� zastanowi�.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Wr��, jak naprawd� b�dziesz czego� potrzebowa�. P�ki co - nie zawracaj mi g�owy.
};


var int Huno_LearnSmith;
var int huno_smithasking;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Ch�tnie spr�bowa�bym si� jako kowal.";
};


func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Ch�tnie spr�bowa�bym si� jako kowal.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//Tylko nie wyobra�aj sobie, �e tak �atwo jest wyku� solidny miecz!
	if(huno_smithasking == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Huno - kowal ze Starego Obozu - mo�e mnie nauczy� wykuwania mieczy.");
		huno_smithasking = TRUE;
	};
	Info_ClearChoices(DIA_Huno_LEARNSMITH);
	Info_AddChoice(DIA_Huno_LEARNSMITH,DIALOG_BACK,dia_huno_learnsmith_back);
	if(knows_grobesschwert == FALSE)
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Niewyko�czony miecz (Koszt: 1 PN)",dia_huno_learnsmith_grobesschwert);
	};
	if(((knows_leichtesgardeschwert == FALSE) && (knows_grobesschwert == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((knows_leichtesgardeschwert == FALSE) && (knows_grobesschwert == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Lekki miecz Stra�nika (Koszt: 2 PN)",dia_huno_learnsmith_leichtesgardeschwert);
	};
	if(((knows_gardeschwert == FALSE) && (knows_grobesschwert == TRUE) && (knows_leichtesgardeschwert == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((knows_gardeschwert == FALSE) && (knows_grobesschwert == TRUE) && (knows_leichtesgardeschwert == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Miecz Stra�nika (Koszt: 3 PN)",dia_huno_learnsmith_gardeschwert);
	};
	if(((knows_gardistenhand == FALSE) && (knows_gardeschwert == TRUE) && (knows_grobesschwert == TRUE) && (knows_leichtesgardeschwert == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((knows_gardistenhand == FALSE) && (knows_gardeschwert == TRUE) && (knows_grobesschwert == TRUE) && (knows_leichtesgardeschwert == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"R�ka Stra�nika (Koszt: 4 PN)",dia_huno_learnsmith_gardistenhand);
	};
};

func void dia_huno_learnsmith_back()
{
	Info_ClearChoices(DIA_Huno_LEARNSMITH);
};

func void dia_huno_learnsmith_grobesschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� najprostszy miecz.");
		Huno_LearnSmith = TRUE;
		knows_grobesschwert = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_leichtesgardeschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� lekki miecz Stra�nika.");
		knows_leichtesgardeschwert = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie lekkiego miecza Stra�nika",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_gardeschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� miecz Stra�nika.");
		knows_gardeschwert = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie miecza Stra�nika",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_gardistenhand()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Co powinienem zrobi�?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Dobra, we� stal i rozgrzej j� nad ogniem.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Potem rozbij j� na kowadle.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jestem teraz w stanie wyku� miecz zwany R�k� Stra�nika.");
		knows_gardistenhand = TRUE;
		PrintScreen("Nowa umiej�tno��: Wykuwanie R�ki Stra�nika",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Za ma�o punkt�w nauki!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


var int huno_trader;

instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Chcia�bym kupi� narz�dzia kowalskie!";
	trade = 1;
};


func int DIA_Huno_BUYSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Chcia�bym kupi� narz�dzia kowalskie!
	if(huno_trader == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Huno - kowal ze Starego Obozu - mo�e mi sprzeda� rozmaite narz�dzia kowalskie.");
		huno_trader = TRUE;
	};
};


instance DIA_HUNO_WAIT(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = dia_huno_wait_condition;
	information = dia_huno_wait_info;
	permanent = 0;
	important = 1;
};


func int dia_huno_wait_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void dia_huno_wait_info()
{
	AI_Output(self,other,"DIA_Huno_Wait_15_00");	//Hej, poczekaj chwil�!
	AI_Output(other,self,"DIA_Huno_Wait_09_01");	//O co chodzi?
	AI_Output(self,other,"DIA_Huno_Wait_15_02");	//Jeste� tu nowy, mia�bym robot� dla ciebie.
	AI_Output(other,self,"DIA_Huno_Wait_09_03");	//W czym rzecz?
	AI_Output(self,other,"DIA_Huno_Wait_15_04");	//Kilka dni temu wyku�em pewien miecz dla Bloodwyna - to jeden ze Stra�nik�w Gomeza.
	AI_Output(self,other,"DIA_Huno_Wait_09_05");	//Po sko�czonej robocie schowa�em miecz do swojej skrzyni, aby Bloodwyn m�g� go odebra� nast�pnego dnia.
	AI_Output(self,other,"DIA_Huno_Wait_09_06");	//Jednak patrz� do kufra, a tam go nie ma. Wygl�da na to, �e kto� trzyma� �apy na mojej skrzyni.
	AI_Output(self,other,"DIA_Huno_Wait_09_07");	//Zasi�gnij j�zyka u kogo tylko si� da. Mo�e uda ci si� dowiedzie�, kogo tak �wierzbi�y r�czki do mojego schowka.
	AI_Output(self,other,"DIA_Huno_Wait_09_08");	//Na twoim miejscu zacz��bym od placu targowego. Mo�liwe, �e ten psubrat zd��y� ju� opyli� miecz jakiemu� kupcowi.
	huno_lostsword = LOG_RUNNING;
	Log_CreateTopic(CH1_HUNOLOSTSWORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_HUNOLOSTSWORD,LOG_RUNNING);
	B_LogEntry(CH1_HUNOLOSTSWORD,"Huno, kowal ze Starego Obozu, zleci� mi odnalezienie jego miecza, kt�ry wyrobi� specjalnie dla Bloodwyna. Po prostu zosta� on skradziony przez kogo� z jego skrzyni. Poszukiwania najlepiej zacz�� od placu targowego.");
};


instance DIA_HUNO_SUCCESS(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = dia_huno_success_condition;
	information = dia_huno_success_info;
	permanent = 0;
	important = 0;
	description = "Znalaz�em tw�j miecz.";
};


func int dia_huno_success_condition()
{
	if(Npc_HasItems(other,bloodwyns_schwert) >= 1)
	{
		return TRUE;
	};
};

func void dia_huno_success_info()
{
	AI_Output(other,self,"DIA_Huno_Success_15_00");	//Znalaz�em tw�j miecz.
	AI_Output(self,other,"DIA_Huno_Success_15_01");	//Dobra robota. Czyli nareszcie b�d� m�g� odda� Bloodwynowi jego miecz.
	AI_Output(other,self,"DIA_Huno_Success_15_02");	//Nie jeste� ciekaw kto go ukrad�?
	AI_Output(self,other,"DIA_Huno_Success_15_03");	//Nie, mnie interesuje tylko ten miecz. Tutaj ka�dego dnia co� znika, wi�c r�wnie dobrze m�g�by� obwini� po�ow� obozu.
	AI_Output(self,other,"DIA_Huno_Success_15_04");	//Ach, �ebym nie zapomnia�. Oto twoja nagroda.
	AI_Output(other,self,"DIA_Huno_Success_15_05");	//Dzi�ki, trzymaj si�!
	B_GiveInvItems(other,self,bloodwyns_schwert,1);
	Npc_RemoveInvItems(self,bloodwyns_schwert,1);
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	huno_lostsword = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_HUNOLOSTSWORD,LOG_SUCCESS);
	B_LogEntry(CH1_HUNOLOSTSWORD,"Huno by� usatysfakcjonowany z mojej pracy i da� mi w zamian kilka bry�ek rudy.");
	B_GiveXP(XP_HUNOLOSTSWORD);
};


instance INFO_HUNO_CRAFT_WHICH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 9;
	condition = info_huno_craft_which_condition;
	information = info_huno_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Zajmujesz si� r�wnie� wzmacnianiem pancerzy?";
};


func int info_huno_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void info_huno_craft_which_info()
{
	AI_Output(hero,self,"Info_Huno_CRAFT_WHICH_15_01");	//Zajmujesz si� r�wnie� wzmacnianiem pancerzy?
	AI_Output(self,hero,"Info_Huno_CRAFT_WHICH_09_02");	//Jasne, jednak potrzebny mi do tego b�dzie stosowny pancerz, jak i godziwa zap�ata w rudzie.
	Info_ClearChoices(info_huno_craft_which);
	Info_AddChoice(info_huno_craft_which,DIALOG_BACK,info_huno_craft_which_back);
	if(Npc_HasItems(other,vlk_armor_l) >= 1)
	{
		Info_AddChoice(info_huno_craft_which,"Wzmocnione lekkie spodnie kopacza (125 bry�ek)",info_huno_craft_which_vlk);
	};
	if(Npc_HasItems(other,sfb_armor_l) >= 1)
	{
		Info_AddChoice(info_huno_craft_which,"Wzmocniony str�j kopacza (125 bry�ek)",info_huno_craft_which_sfb);
	};
};

func void info_huno_craft_which_back()
{
	Info_ClearChoices(info_huno_craft_which);
};

func void info_huno_craft_which_vlk()
{
	AI_Output(other,self,",	Info_Huno_CRAFT_WHICH_Huno_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,vlk_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 125))
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_16_02");	//Wygl�da ca�kiem nie�le.
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_04");	//Jestem pewien, �e uda mi si� co� z nim zrobi�. Poczekaj chwilk�.
		AI_UnequipArmor(hero);
		Npc_RemoveInvItems(hero,ItMiNugget,125);
		Npc_RemoveInvItem(hero,vlk_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(hero,vlk_armor_l_upgrade);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_05");	//No, gotowe. Trzymaj!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_02");	//Nie masz do�� rudy, ch�opcze. Wr��, kiedy zdob�dziesz ju� wystarczaj�c� ilo��.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_huno_craft_which);
	};
};

func void info_huno_craft_which_sfb()
{
	AI_Output(other,self,",	Info_Huno_CRAFT_WHICH_Huno_13_01");	//Oto pancerz.
	if((Npc_HasItems(other,sfb_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 125))
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_16_02");	//Wygl�da ca�kiem nie�le.
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_04");	//Jestem pewien, �e uda mi si� co� z nim zrobi�. Poczekaj chwilk�.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sfb_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,125);
		Npc_RemoveInvItem(self,sfb_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,sfb_armor_l_upgrade);
		B_GiveInvItems(self,hero,sfb_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_05");	//No, gotowe. Trzymaj!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_02");	//Nie masz do�� rudy, ch�opcze. Wr��, kiedy zdob�dziesz ju� wystarczaj�c� ilo��.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_huno_craft_which);
	};
};

